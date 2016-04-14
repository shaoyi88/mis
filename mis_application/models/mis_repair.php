<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 物业报修模型类
 * @author Administrator
 *
 */
class MIS_Repair extends CI_Model
{
	private $_table = 'mis_repair';
	
	/**
	 * 初始化
	 */
	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * 
	 * 获取总数
	 */
	public function getCount($keyword)
	{
		if(isset($keyword['repair_type']) && $keyword['repair_type'] != ''){
			$this->db->where('repair_type', $keyword['repair_type']);
		}
		if(isset($keyword['status']) && $keyword['status'] != ''){
			$this->db->where('status', $keyword['status']);
		}
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 获取列表
	 * Enter description here ...
	 */
	public function getList($keyword, $offset, $limit)
	{
		$info = array();
		if(isset($keyword['repair_type']) && $keyword['repair_type'] != ''){
			$this->db->where('repair_type', $keyword['repair_type']);
		}
		if(isset($keyword['status']) && $keyword['status'] != ''){
			$this->db->where('status', $keyword['status']);
		}
		$query = $this->db->get($this->_table, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取待确认总数
	 */
	public function getConfirmCount()
	{
		$this->db->where('status', 0);
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 获取待确认列表
	 * Enter description here ...
	 */
	public function getConfirmList($offset, $limit)
	{
		$info = array();
		$this->db->where('status', 0);
		$query = $this->db->get($this->_table, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取信息
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$query = $this->db->get_where($this->_table, array('repair_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 编辑
	 * @param unknown_type $data
	 */
	public function update($data)
	{
        $this->db->where('repair_id', $data['repair_id']);
		$this->db->update($this->_table, $data); 
	}
}