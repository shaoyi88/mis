<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 企业需求模型类
 * @author Administrator
 *
 */
class MIS_Need extends CI_Model
{
	private $_table = 'mis_need';
	private $_enterpriseTable = 'mis_enterprise';
	
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
	public function getCount($keyword,$uid=0)
	{
		if(isset($keyword['need_type']) && $keyword['need_type'] != ''){
			$this->db->where('need_type', $keyword['need_type']);
		}
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
		$sql = "select * from `$this->_table` as a left join `$this->_enterpriseTable` as b on 
				a.enterprise_id = b.enterprise_id where 1=1 ";
		if(isset($keyword['need_type']) && $keyword['need_type'] != ''){
			$sql .= ' and a.need_type ='.$keyword['need_type'];
		}
		if(isset($keyword['status']) && $keyword['status'] != ''){
			$sql .= ' and a.status ='.$keyword['status'];
		}
		if($uid){
			$sql .= ' and a.user_id ='.$uid;
		}
		$sql .= " limit $offset, $limit";
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
		$sql = "select * from `$this->_table` as a left join `$this->_enterpriseTable` as b on 
				a.enterprise_id = b.enterprise_id where a.need_id=$id";
		$query = $this->db->query($sql);
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
        $this->db->where('need_id', $data['need_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 *
	 * 添加
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
}