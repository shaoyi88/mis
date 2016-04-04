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
	private $_enterpriseTable = 'mis_enterprise_userinfo';
	
	/**
	 * 初始化
	 */
	public function __construct()
	{
		parent::__construct();
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
		$query = $this->db->get_where($this->_table, array('user_id' => $id));
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
		$this->db->order_by('reg_time','DESC');
		if(isset($keyword['user_type']) && $keyword['user_type'] != ''){
			$this->db->where('user_type', $keyword['user_type']);
		}
		if(isset($keyword['user_second_type'])){
			$this->db->where('user_second_type', $keyword['user_second_type']);
		}
		if(isset($keyword['keyword']) && $keyword['keyword'] != ''){
			$this->db->where('user_nickname', $keyword['keyword']);
			$this->db->or_where('user_account', $keyword['keyword']);
		}
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
	 * 获取企业用户列表
	 */
	public function getEnterpriseUserList()
	{
		$info = array();
		$this->db->select('*');
		$this->db->from("$this->_table as a");
		$this->db->join("$this->_enterpriseTable as b", 'a.user_id = b.user_id');
		$this->db->order_by('a.reg_time','DESC');
		$this->db->where('user_audit_type', 2);
		$query = $this->db->get();
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
}