<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 园区企业模型类
 * @author Administrator
 *
 */
class MIS_Enterprise extends CI_Model
{
	private $_table = 'mis_enterprise';
	private $_accountRecordTable = 'mis_enterprise_account_record';
	
	/**
	 * 初始化
	 */
	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * 
	 * 获取列表
	 */
	public function getAllList()
	{
		$info = array();
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->result_array();
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
	 * 增加账户记录
	 * @param unknown_type $data
	 */
	public function addRecord($data)
	{
		$this->db->insert($this->_accountRecordTable, $data); 
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();		
		return $id;
	}
	
	/**
	 * 
	 * 获取列表
	 */
	public function getList($offset, $limit)
	{
		$info = array();
		$this->db->order_by('enterprise_enter_time','DESC');
		$query = $this->db->get($this->_table, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 通过企业名查询
	 * Enter description here ...
	 * @param unknown_type $account
	 */
	public function queryByName($name)
	{
		$this->db->where('enterprise_name', $name);
		$info = array();
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取总数
	 */
	public function getCount()
	{
		return $this->db->count_all_results($this->_table);
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
}