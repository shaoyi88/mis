<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 入驻申请模型类
 * @author Administrator
 *
 */
class MIS_EnterprisePotential extends CI_Model
{
	private $_table = 'mis_enterprise_potential';
	private $_approval = 'mis_enterprise_approval';
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
	 * 获取列表
	 */
	public function getList($keaword, $offset, $limit, $uid=0)
	{
		$info = array();
		if($uid){
		    $this->db->where('app_by', $uid);
		}
		if(isset($keyword['enterprise_name'])){
			$this->db->like('enterprise_name', $keyword['enterprise_name']);
		}
		if(isset($keyword['enterprise_contact'])){
			$this->db->like('enterprise_contact', $keyword['enterprise_contact']);
		}
		$this->db->order_by('app_time','DESC');
		$query = $this->db->get($this->_table, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取总数
	 */
	public function getCount($keaword,$uid=0)
	{   
		$info = array();
		if($uid){
			$this->db->where('app_by', $uid);
		}
		if(isset($keyword['enterprise_name'])){
			$this->db->like('enterprise_name', $keyword['enterprise_name']);
		}
	    if(isset($keyword['enterprise_contact'])){
			$this->db->like('enterprise_contact', $keyword['enterprise_contact']);
		}
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->result_array();
		}
		return count($info);
	}
	
	/**
	 * 获取信息
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$query = $this->db->get_where($this->_table, array('enterprise_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
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
        $this->db->where('enterprise_id', $data['enterprise_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('enterprise_id', $id);
		$this->db->delete($this->_table); 
	} 
	
	/**
	 * 
	 * 获取待跟进的数目
	 */
	public function getFollowCount()
	{
		$sql = "select count(*) as num from $this->_table where deal_status = 0";
		if(checkRight('apply_assign')){
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
	 * 获取待跟进的列表
	 */
	public function getFollowList($offset, $limit)
	{
		$info = array();
		$sql = "select * from $this->_table where deal_status = 0";
		if(checkRight('apply_assign')){
			$sql .= " and (follow_by=0 or follow_by=".$this->_ci->userId.")";
		}else{
			$sql .= " and follow_by=".$this->_ci->userId;
		}
		$sql .= " order by app_time desc limit $offset,$limit";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
/**
	 * 
	 * 获取需要第一次提醒的列表
	 */
	public function getRemindFirstNum()
	{
		$info = array();
		$sql = "SELECT count(*) as num FROM $this->_table WHERE deal_status = 0 AND (UNIX_TIMESTAMP(NOW()) - app_time>172800) AND remind_times=0";
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
		$sql = "SELECT count(*) as num FROM $this->_table WHERE deal_status = 0 AND (UNIX_TIMESTAMP(NOW()) -last_remind_time>172800) AND remind_times=1";
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
		$sql = "update $this->_table set last_remind_time=".time().",remind_times=1 where deal_status = 0 AND (UNIX_TIMESTAMP(NOW()) - app_time>172800) AND remind_times=0";
		$query = $this->db->query($sql);
	}
	
	/**
	 * 
	 * 更新第二次提醒状态
	 */
	public function updataRemindSecond()
	{
		$sql = "update $this->_table set last_remind_time=".time().",remind_times=2 where deal_status = 0 AND (UNIX_TIMESTAMP(NOW()) - last_remind_time>172800) AND remind_times=1";
		$query = $this->db->query($sql);
	}
	
	/**
	 * 立项申请
	 * 
	 */
	public function addApproval($data)
	{
		$this->db->insert($this->_approval, $data);
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();
		return $id;
	}
	
	/**
	 * 获取立项信息信息
	 * @param unknown_type $id
	 */
	public function getApprovalInfo($id)
	{
		$query = $this->db->get_where($this->_approval, array('potential_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
}