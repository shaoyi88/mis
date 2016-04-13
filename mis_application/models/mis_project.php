<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 项目模型类
 * @author Administrator
 *
 */
class MIS_Project extends CI_Model
{
	private $_table = 'mis_project';
	private $_applyTable = 'mis_project_apply';
	
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
	public function getCount()
	{
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 获取列表
	 * Enter description here ...
	 */
	public function getList($offset, $limit)
	{
		$info = array();
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
		$query = $this->db->get_where($this->_table, array('project_id' => $id));
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
        $this->db->where('project_id', $data['project_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('project_id', $id);
		$this->db->delete($this->_table); 
	} 
	
	/**
	 * 
	 * 获取项目申请信息
	 * @param unknown_type $id
	 */
	public function getApplyInfo($id)
	{
		$query = $this->db->get_where($this->_applyTable, array('project_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取总数
	 */
	public function getApplyCount($id)
	{
		$this->db->where('project_id', $id);
		return $this->db->count_all_results($this->_applyTable);
	}
	
	/**
	 * 获取列表
	 * Enter description here ...
	 */
	public function getApplyList($id, $offset, $limit)
	{
		$info = array();
		$this->db->where('project_id', $id);
		$query = $this->db->get($this->_applyTable, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 更新申请
	 * @param unknown_type $data
	 */
	public function updateApply($data)
	{
        $this->db->where('apply_id', $data['apply_id']);
		$this->db->update($this->_applyTable, $data); 
	}
	
	/**
	 * 
	 * 获取总数
	 */
	public function getConfirmApplyCount()
	{
		$this->db->where('status', 0);
		return $this->db->count_all_results($this->_applyTable);
	}
	
	/**
	 * 获取列表
	 * Enter description here ...
	 */
	public function getConfirmApplyList($offset, $limit)
	{
		$info = array();
		$this->db->select('*');
		$this->db->where('status', 0);
		$this->db->join($this->_table, "$this->_table.project_id = $this->_applyTable.project_id", 'left');
		$query = $this->db->get($this->_applyTable, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
}