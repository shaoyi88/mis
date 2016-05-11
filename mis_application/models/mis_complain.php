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
		$sql = "select count(*) as num from $this->_table where (status = 0 or status = 1)";
		if(checkRight('complain_assign')){
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
	 * 获取列表
	 * Enter description here ...
	 */
	public function getConfirmList($offset, $limit)
	{
		$info = array();
		$sql = "select * from $this->_table where (status = 0 or status = 1)";
		if(checkRight('complain_assign')){
			$sql .= " and (follow_by=0 or follow_by=".$this->_ci->userId.")";
		}else{
			$sql .= " and follow_by=".$this->_ci->userId;
		}
		$sql .= " limit $offset,$limit";
		$query = $this->db->query($sql);
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
        $this->db->where('complain_id', $data['complain_id']);
		$this->db->update($this->_table, $data); 
	}
	
/**
	 * 
	 * 获取需要第一次提醒的列表
	 */
	public function getRemindFirstNum()
	{
		$info = array();
		$sql = "SELECT count(*) as num FROM $this->_table WHERE status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
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
		$sql = "SELECT count(*) as num FROM $this->_table WHERE status = 0 AND (UNIX_TIMESTAMP(NOW()) -last_remind_time>172800) AND remind_times=1";
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
		$sql = "update $this->_table set last_remind_time=".time().",remind_times=1 where status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
		$query = $this->db->query($sql);
	}
	
	/**
	 * 
	 * 更新第二次提醒状态
	 */
	public function updataRemindSecond()
	{
		$sql = "update $this->_table set last_remind_time=".time().",remind_times=2 where status = 0 AND (UNIX_TIMESTAMP(NOW()) - last_remind_time>172800) AND remind_times=1";
		$query = $this->db->query($sql);
	}
}