<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 俱乐部活动模型类
 * @author Administrator
 *
 */
class MIS_EnterprisePotential extends CI_Model
{
	private $_table = 'mis_enterprise_potential';
	
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
}