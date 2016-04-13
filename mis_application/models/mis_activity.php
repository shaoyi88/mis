<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 活动模型类
 * @author Administrator
 *
 */
class MIS_Activity extends CI_Model
{
	private $_table = 'mis_activity';
	private $_commentTable = 'mis_activity_comment';
	private $_registerTable = 'mis_activity_register';
	
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
		if(isset($keyword['activity_status']) && $keyword['activity_status'] != ''){
			$this->db->where('activity_status', $keyword['activity_status']);
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
		if(isset($keyword['activity_status'])){
			$this->db->where('activity_status', $keyword['activity_status']);
		}
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 
	 * 获取待审核列表
	 */
	public function getAuditList($offset, $limit)
	{
		$info = array();
		$this->db->order_by('add_time','DESC');
		$this->db->where('activity_status', 0);
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
	public function getAuditCount()
	{
		$this->db->where('activity_status', 0);
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 获取信息
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$query = $this->db->get_where($this->_table, array('activity_id' => $id));
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
        $this->db->where('activity_id', $data['activity_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('activity_id', $id);
		$this->db->delete($this->_table); 
		$this->db->delete($this->_commentTable); 
		$this->db->delete($this->_registerTable); 
	} 
	
	/**
	 * 
	 * 获取活动报名列表
	 */
	public function getRegisterList($offset, $limit)
	{
		$info = array();
		$this->db->order_by('add_time','DESC');
		$query = $this->db->get($this->_registerTable, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取活动报名总数
	 */
	public function getRegisterCount()
	{
		return $this->db->count_all_results($this->_registerTable);
	}
	
	/**
	 * 
	 * 获取活动评论列表
	 */
	public function getCommentList($offset, $limit)
	{
		$info = array();
		$this->db->order_by('add_time','DESC');
		$query = $this->db->get($this->_commentTable, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取活动评论总数
	 */
	public function getCommentCount()
	{
		return $this->db->count_all_results($this->_commentTable);
	}
	
	/**
	 * 
	 * 删除活动报名
	 * @param unknown_type $id
	 */
	public function delRegister($id)
	{
		$this->db->where('register_id', $id);
		$this->db->delete($this->_registerTable); 
	} 
	
	/**
	 * 
	 * 删除活动评论
	 * @param unknown_type $id
	 */
	public function delComment($id)
	{
		$this->db->where('comment_id', $id);
		$this->db->delete($this->_commentTable); 
	} 
}