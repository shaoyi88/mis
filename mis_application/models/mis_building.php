<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 资讯模型类
 * @author Administrator
 *
 */
class MIS_Building extends CI_Model
{
	private $_table = 'mis_building';
	private $_eb_table = 'mis_enterprise_building';
	
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
		if(isset($keyword['building_type']) && $keyword['building_type'] != ''){
			$this->db->where('building_type', $keyword['building_type']);
		}
		if(isset($keyword['building_name']) && $keyword['building_name'] != ''){
			$this->db->where('building_name', $keyword['building_name']);
		}
		if(isset($keyword['building_floor']) && $keyword['building_floor'] != ''){
			$this->db->where('building_floor', $keyword['building_floor']);
		}
		if(isset($keyword['building_room']) && $keyword['building_room'] != ''){
			$this->db->where('building_room', $keyword['building_room']);
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
		if(isset($keyword['building_type']) && $keyword['building_type'] != ''){
			$this->db->where('building_type', $keyword['building_type']);
		}
		if(isset($keyword['building_name']) && $keyword['building_name'] != ''){
			$this->db->where('building_name', $keyword['building_name']);
		}
		if(isset($keyword['building_floor']) && $keyword['building_floor'] != ''){
			$this->db->where('building_floor', $keyword['building_floor']);
		}
		if(isset($keyword['building_room']) && $keyword['building_room'] != ''){
			$this->db->where('building_room', $keyword['building_room']);
		}
		$query = $this->db->get($this->_table, $limit, $offset);
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
	 * 更新
	 * @param unknown_type $data
	 */
	public function update($data)
	{
		$this->db->where('building_id', $data['building_id']);
		$this->db->update($this->_table, $data);
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $dids
	 */
	public function delType($id)
	{
		$this->db->where('building_id', $id);
		$this->db->delete($this->_table);
	}
	
	/**
	 * 
	 * 获取信息
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$query = $this->db->get_where($this->_table, array('building_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $dids
	 */
	public function del($id)
	{
		$this->db->where('building_id', $id);
		$this->db->delete($this->_table);
	}
	
	/**
	 * 
	 * 根据房间号获取信息
	 * @param unknown_type $id
	 */
	public function getInfoByBuildingRoom($building_floor, $building_room)
	{
		$query = $this->db->get_where($this->_table, array('building_floor'=> $building_floor,'building_room' => $building_room));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 获取全部列表
	 * Enter description here ...
	 */
	public function getAllList()
	{
		$info = array();
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	public function getInfoByEid($eList)
	{
		$info = array();
		$sql = "select * from $this->_eb_table as e left join $this->_table as b on e.building_id = b.building_id where e.enterprise_id in ($eList)";
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
}