<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 园区用户模型类
 * @author Administrator
 *
 */
class MIS_User extends CI_Model
{
	private $_table = 'mis_user';
	private $_enterpriseTable = 'mis_enterprise';
	private $_relateEnterpriseApply = 'mis_relate_enterprise_apply';
	private $_ci;
	
	/**
	 * 初始化
	 */
	public function __construct()
	{
		parent::__construct();
		$this->_ci = & get_instance();
	}

	/**
	 * 
	 * 增加
	 * @param unknown_type $data
	 */
	public function add($data)
	{
		$this->db->insert($this->_table, $data); 
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();		
		return $id;
	}
	
	/**
	 * 
	 * 编辑
	 * @param unknown_type $data
	 */
	public function update($data)
	{
        $this->db->where('user_id', $data['user_id']);
		$this->db->update($this->_table, $data);
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('user_id', $id);
		$this->db->delete($this->_table); 
	} 
	
	/**
	 * 获取信息
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$sql = "select * from $this->_table as a left join $this->_enterpriseTable as b on a.enterprise_id = b. enterprise_id where user_id = $id";
		$query = $this->db->query($sql);
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取列表
	 */
	public function getList($keyword, $offset, $limit)
	{
		$info = array();
		$sql = "select * from $this->_table as a left join $this->_enterpriseTable as b on a.enterprise_id = b. enterprise_id where 1=1";

		if(isset($keyword['user_type']) && $keyword['user_type'] != ''){
			$sql .= " and a.user_type = ".$keyword['user_type'];
		}
		if(isset($keyword['user_second_type'])){
			$sql .= " and a.user_second_type = ".$keyword['user_second_type'];
		}
		if(isset($keyword['keyword']) && $keyword['keyword'] != ''){
			$sql .= " and (a.user_nickname = ".$keyword['keyword']." or a.user_account = ".$keyword['keyword'].")";
		}
		$sql .= " order by reg_time desc limit $offset,$limit";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取总数
	 */
	public function getCount($keyword)
	{
		if(isset($keyword['keyword'])){
			$this->db->where('user_nickname', $keyword['keyword']);
			$this->db->or_where('user_account', $keyword['keyword']);
		}
		if(isset($keyword['user_type'])){
			$this->db->where('user_type', $keyword['user_type']);
		}
		if(isset($keyword['user_second_type'])){
			$this->db->where('user_second_type', $keyword['user_second_type']);
		}
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 通过账户名和手机查询
	 * Enter description here ...
	 * @param unknown_type $account
	 */
	public function queryUserByAccountPhone($account, $phone)
	{
		$this->db->where('user_account', $account);
		$this->db->or_where('user_phone', $phone);
		$info = array();
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 校验用户
	 * @param unknown_type $userAccount
	 * @param unknown_type $userPassword
	 */
	public function checkUser($userAccount, $userPassword)
	{
		$query = $this->db->get_where($this->_table, array('user_account' => $userAccount));
		if($query){
			$info = $query->row_array();
			if(!empty($info) && md5($userPassword) == $info['user_password']){
				return $info;
			}
		}
		return FALSE;
	}
	
	/**
	 * 
	 * 获取待审核企业用户总数
	 */
	public function getApproveEnterpriseUserCount()
	{
		$sql = "select count(*) as num from $this->_relateEnterpriseApply where status = 0";
		if(checkRight('enterprise_user_assign')){
			$sql .= " and (follow_by=0 or follow_by=".$this->_ci->userId.")";
		}else{
			$sql .= " and follow_by=".$this->_ci->userId;
		}
		$query = $this->db->query($sql);
		if($query){
			$info = $query->row_array();
		}
		return $info['num'];
	}
	
	/**
	 * 
	 * 获取待审核企业用户列表
	 */
	public function getApproveEnterpriseUserList($offset, $limit)
	{
		$info = array();
		$sql = "select * from $this->_relateEnterpriseApply as a left join $this->_enterpriseTable as b on a.enterprise_id = b. enterprise_id where 1=1";
		if(checkRight('enterprise_user_assign')){
			$sql .= " and (a.follow_by = ".$this->_ci->userId." or a.follow_by = 0)";
		}else{
			$sql .= " and a.follow_by = ".$this->_ci->userId;
		}
		$sql .=	" and a.apply_type = 1 and a.status = 0 order by a.add_time desc limit $offset,$limit";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 更新审核申请
	 * @param unknown_type $data
	 */
	public function updateRelateEnterpriseApply($data)
	{
		$this->db->where('apply_id', $data['apply_id']);
		$this->db->update($this->_relateEnterpriseApply, $data);
	}
	
/**
	 * 
	 * 获取需要第一次提醒的列表
	 */
	public function getRemindFirstNum()
	{
		$info = array();
		$sql = "SELECT count(*) as num FROM $this->_relateEnterpriseApply WHERE status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->row_array();
		}
		return $info['num'];
	}
	
	/**
	 * 
	 * 获取需要第二次提醒的列表
	 */
	public function getRemindSecondNum()
	{
		$info = array();
		$sql = "SELECT count(*) as num FROM $this->_relateEnterpriseApply WHERE status = 0 AND (UNIX_TIMESTAMP(NOW()) -last_remind_time>172800) AND remind_times=1";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->row_array();
		}
		return $info['num'];
	}
	
	/**
	 * 
	 * 更新第一次提醒状态
	 */
	public function updataRemindFitst()
	{
		$sql = "update $this->_relateEnterpriseApply set last_remind_time=".time().",remind_times=1 where status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
		$query = $this->db->query($sql);
	}
	
	/**
	 * 
	 * 更新第二次提醒状态
	 */
	public function updataRemindSecond()
	{
		$sql = "update $this->_relateEnterpriseApply set last_remind_time=".time().",remind_times=2 where status = 0 AND (UNIX_TIMESTAMP(NOW()) - last_remind_time>172800) AND remind_times=1";
		$query = $this->db->query($sql);
	}
}