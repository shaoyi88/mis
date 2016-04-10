<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 流程模型类
 * @author Administrator
 *
 */
class MIS_Flow extends CI_Model
{
	private $_table = 'mis_flow';
	private $_stepTable = 'mis_flow_step';
	
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
		$query = $this->db->get_where($this->_table, array('flow_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取步骤信息
	 * @param unknown_type $id
	 */
	public function getStepInfo($id)
	{
		$query = $this->db->get_where($this->_stepTable, array('flow_id' => $id));
		$info = array();
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
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('flow_id', $id);
		$this->db->delete($this->_table); 
	} 
	
	/**
	 * 
	 * 删除步骤
	 * @param unknown_type $id
	 */
	public function delStep($id)
	{
		$this->db->where('flow_id', $id);
		$this->db->delete($this->_stepTable); 
	}
	
	/**
	 * 
	 * 编辑
	 * @param unknown_type $data
	 */
	public function update($data)
	{
        $this->db->where('flow_id', $data['flow_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 批量添加步骤
	 * @param unknown_type $dataList
	 */
	public function addStep($dataList)
	{
		$this->db->insert_batch($this->_stepTable, $dataList); 
	}
	
	/**
	 * 
	 * 去掉默认流程
	 * @param unknown_type $id
	 */
	public function unsetDefaultFlow($id)
	{
		$sql = "update $this->_table set is_default = 0 where flow_id <> $id";
		$this->db->query($sql);
	}
}