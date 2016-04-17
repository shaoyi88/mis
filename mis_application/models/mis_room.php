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
	 * 编辑预订信息
	 * @param unknown_type $data
	 */
	public function updateBooking($data)
	{
        $this->db->where('booking_id', $data['booking_id']);
		$this->db->update($this->_bookingTable, $data); 
	}
}