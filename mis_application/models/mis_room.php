<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 房间模型类
 * @author Administrator
 *
 */
class MIS_Room extends CI_Model
{
	private $_table = 'mis_room';
	private $_bookingTable = 'mis_room_booking';
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
	public function getCount($keyword)
	{
		if(isset($keyword['t']) && $keyword['t'] != ''){
			$this->db->where('room_type', $keyword['t']);
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
		if(isset($keyword['t']) && $keyword['t'] != ''){
			$this->db->where('room_type', $keyword['t']);
		}
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
		$query = $this->db->get_where($this->_table, array('room_id' => $id));
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
        $this->db->where('room_id', $data['room_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('room_id', $id);
		$this->db->delete($this->_table); 
	} 
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function delBooking($id)
	{
		$this->db->where('room_id', $id);
		$this->db->delete($this->_bookingTable); 
	} 
	
	/**
	 * 
	 * 获取预订信息
	 * @param unknown_type $date
	 */
	public function getBookingList($id, $startTime, $endTime)
	{
		$info = array();
		$sql = "select * from `$this->_bookingTable` where room_id = '$id' and start_time > $startTime and start_time < $endTime order by start_time";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 获取预订信息
	 * @param unknown_type $id
	 */
	public function getBookingInfo($id)
	{
		$query = $this->db->get_where($this->_bookingTable, array('booking_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 添加预订信息
	 * @param unknown_type $data
	 */
	public function addBooking($data)
	{
		$this->db->insert($this->_bookingTable, $data);
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();
		return $id;
	}
	
	/**
	 * 
	 * 编辑预订信息
	 * @param unknown_type $data
	 */
	public function updateBooking($data)
	{
        $this->db->where('booking_id', $data['booking_id']);
		$this->db->update($this->_bookingTable, $data); 
	}
	
	/**
	 * 
	 * 获取待确认的申请单数目
	 */
	public function getConfirmBookingCount()
	{
		$sql = "select count(*) as num from $this->_bookingTable where status = 0";
		if(checkRight('room_booking_assign')){
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
	 * 
	 * 获取待确认的申请单
	 * @param unknown_type $keyword
	 * @param unknown_type $offset
	 * @param unknown_type $limit
	 */
	public function getConfirmBookingList($offset, $limit)
	{
		$info = array();
		$sql = "select * from `$this->_bookingTable` as a left join `$this->_table` as b on a.room_id = b.room_id where a.status = 0 ";
		if(checkRight('room_booking_assign')){
			$sql .= " and (a.follow_by=0 or a.follow_by=".$this->_ci->userId.")";
		}else{
			$sql .= " and a.follow_by=".$this->_ci->userId;
		}
		$sql .= " order by a.add_time desc limit $offset,$limit";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 搜索
	 * Enter description here ...
	 */
	public function search($keyword)
	{
		$info = array();
		if(isset($keyword['t']) && $keyword['t'] != ''){
			$this->db->where('room_type', $keyword['t']);
		}
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 获取个人预订信息
	 * @param unknown_type $date
	 */
	public function getBookingListByUid($keyword, $offset, $limit, $uid)
	{
		$info = array();
		$this->db->select('a.*,b.room_address,b.room_name');
		$this->db->from('mis_room_booking as a');
		$this->db->join('mis_room as b', 'a.room_id = b.room_id');
		if(isset($keyword['t']) && $keyword['t'] != ''){
			$this->db->where('b.room_type', $keyword['t']);
		}
		$this->db->where('a.user_id', $uid);
		$this->db->group_by('a.booking_id');
		$this->db->order_by('a.start_time desc');
		$query = $this->db->get($this->_bookingTable, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 获取个人预订总数
	 */
	public function getUidBookingCount($keyword, $uid)
	{
		if(isset($keyword['t']) && $keyword['t'] != ''){
			$this->db->where('room_type', $keyword['t']);
		}
		$this->db->where('user_id', $uid);
		return $this->db->count_all_results($this->_bookingTable);
	}
	
/**
	 * 
	 * 获取需要第一次提醒的列表
	 */
	public function getRemindFirstNum()
	{
		$info = array();
		$sql = "SELECT count(*) as num FROM $this->_bookingTable WHERE status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
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
		$sql = "SELECT count(*) as num FROM $this->_bookingTable WHERE status = 0 AND (UNIX_TIMESTAMP(NOW()) -last_remind_time>172800) AND remind_times=1";
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
		$sql = "update $this->_bookingTable set last_remind_time=".time().",remind_times=1 where status = 0 AND (UNIX_TIMESTAMP(NOW()) - add_time>172800) AND remind_times=0";
		$query = $this->db->query($sql);
	}
	
	/**
	 * 
	 * 更新第二次提醒状态
	 */
	public function updataRemindSecond()
	{
		$sql = "update $this->_bookingTable set last_remind_time=".time().",remind_times=2 where status = 0 AND (UNIX_TIMESTAMP(NOW()) - last_remind_time>172800) AND remind_times=1";
		$query = $this->db->query($sql);
	}
	
	/**
	 * 
	 * 查询预订
	 * @param unknown_type $room_id
	 * @param unknown_type $start_time
	 * @param unknown_type $end_time
	 */
	public function searchBookingByTime($booking_id, $room_id, $start_time, $end_time)
	{
		$sql = "select * from $this->_bookingTable where booking_id <> $booking_id and room_id = $room_id and ((start_time >= $start_time and start_time <= $end_time) or (end_time >= $start_time and end_time <= $end_time))";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
}