<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 物业投诉模型类
 * @author Administrator
 *
 */
class MIS_Complain extends CI_Model
{
	private $_table = 'mis_complain';
	
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
	public function getCount($keyword, $uid=0)
	{
		if(isset($keyword['status']) && $keyword['status'] != ''){
			$this->db->where('status', $keyword['status']);
		}
		if($uid){
			$this->db->where('user_id', $uid);
		}
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 获取列表
	 * Enter description here ...
	 */
	public function getList($keyword, $offset, $limit, $uid=0)
	{
		$info = array();
		if(isset($keyword['status']) && $keyword['status'] != ''){
			$this->db->where('status', $keyword['status']);
		}
		if($uid){
			$this->db->where('user_id', $uid);
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
	public function getConfirmCount()
	{
		$this->db->where('status', 0);
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 获取列表
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
		$query = $this->db->get_where($this->_table, array('complain_id' => $id));
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
        $this->db->where('complain_id', $data['complain_id']);
		$this->db->update($this->_table, $data); 
	}
}