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
	public function getList($keyword, $offset, $limit, $uid=0)
	{
		$info = array();
		$this->db->order_by('add_time','DESC');
		if(isset($keyword['activity_status']) && $keyword['activity_status'] != ''){
			$this->db->where('activity_status', $keyword['activity_status']);
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
	public function getCount($keyword, $uid=0)
	{
		if(isset($keyword['activity_status'])){
			$this->db->where('activity_status', $keyword['activity_status']);
		}
		if($uid){
			$this->db->where('user_id', $uid);
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
		$sql = "select * from $this->_table where activity_status = 0";
		if(checkRight('activity_assign')){
			$sql .= " and (follow_by=0 or follow_by=".$this->_ci->userId.")";
		}else{
			$sql .= " and follow_by=".$this->_ci->userId;
		}
		$sql .= " order by add_time desc limit $offset,$limit";
		$query = $this->db->query($sql);
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
		$sql = "select count(*) as num from $this->_table where activity_status = 0";
		if(checkRight('activity_assign')){
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
	
	/**
	 * 
	 * 获取需要第一次提醒的列表
	 */
	public function getRemindFirstNum()
	{
		$info = array();
		$sql = "SELECT count(*) as num FROM $this->_table WHERE activity_status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
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
		$sql = "SELECT count(*) as num FROM $this->_table WHERE activity_status = 0 AND (UNIX_TIMESTAMP(NOW()) -last_remind_time>172800) AND remind_times=1";
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
		$sql = "update $this->_table set last_remind_time=".time().",remind_times=1 where activity_status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
		$query = $this->db->query($sql);
	}
	
	/**
	 * 
	 * 更新第二次提醒状态
	 */
	public function updataRemindSecond()
	{
		$sql = "update $this->_table set last_remind_time=".time().",remind_times=2 where activity_status = 0 AND (UNIX_TIMESTAMP(NOW()) - last_remind_time>172800) AND remind_times=1";
		$query = $this->db->query($sql);
	}
}