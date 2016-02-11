<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 投诉建议模型类
 * @author Administrator
 *
 */
class MIS_Feedback extends CI_Model
{
	private $_table = 'mis_feedback';
	private $_replyTable = 'mis_feedback_reply';
	
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
	public function getList($keyword, $offset, $limit)
	{
		$info = array();
		$this->db->order_by('add_time','DESC');
		if(isset($keyword['feedback_type'])){
			$this->db->where('feedback_type', $keyword['feedback_type']);
		}
		if(isset($keyword['feedback_status'])){
			$this->db->where('feedback_status', $keyword['feedback_status']);
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
		if(isset($keyword['feedback_type'])){
			$this->db->where('feedback_type', $keyword['feedback_type']);
		}
		if(isset($keyword['feedback_status'])){
			$this->db->where('feedback_status', $keyword['feedback_status']);
		}
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 
	 * 获取详情
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$this->db->select("*,$this->_table.feedback_id as feedback_id");
		$this->db->join($this->_replyTable, "$this->_table.feedback_id = $this->_replyTable.feedback_id", 'left');	
		$query = $this->db->get_where($this->_table, array("$this->_table.feedback_id" => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 添加回复
	 * @param unknown_type $data
	 */
	public function addReply($data)
	{
		$this->db->insert($this->_replyTable, $data); 
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();		
		return $id;
	}
	
	/**
	 * 
	 * 更新
	 * @param unknown_type $data
	 */
	public function update($data)
	{
		$this->db->where('feedback_id', $data['feedback_id']);
		$this->db->update($this->_table, $data); 
	}
}