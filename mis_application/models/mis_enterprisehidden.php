<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 潜在客户模型类
 * @author Administrator
 *
 */
class MIS_EnterpriseHidden extends CI_Model
{
	private $_table = 'mis_enterprise_hidden';
	private $_eb_table = 'mis_enterprise_hidden_building';
	private $_build_table = 'mis_building';
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
	 * 获取信息
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$query = $this->db->get_where($this->_table, array('enterprise_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('enterprise_id', $id);
		$this->db->delete($this->_table); 
	}
	
	/**
	 * 
	 * 获取列表
	 */
	public function getList($offset, $limit)
	{
		$info = array();
		$this->db->order_by('add_time','DESC');
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
	public function getCount()
	{   
		return $this->db->count_all_results($this->_table);
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
        $this->db->where('enterprise_id', $data['enterprise_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 获取待跟进的数目
	 */
	public function getFollowCount()
	{
		$sql = "select count(*) as num from $this->_table where status = 0";
		if(checkRight('potential_assign')){
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
	 * 获取待跟进的列表
	 */
	public function getFollowList($offset, $limit)
	{
		$info = array();
		$sql = "select * from $this->_table where status = 0";
		if(checkRight('potential_assign')){
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
	
	/**
	 * 获取意向办公地点
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getEnterpriseBuildingInfo($id, &$info = array())
	{
		$sql = "select * from $this->_eb_table as e left join $this->_build_table as b on e.building_id = b.building_id where e.enterprise_id = $id";
		$query = $this->db->query($sql);
		$result = array();
		if($query){
			$info = $query->result_array();
		}
		foreach($info as $item){
			$result[] = $item['building_id'];
		}
		return $result;
	}
	
	/**
	 * 
	 * 批量增加意向办公地点
	 */
	public function batchAddEnterpriseBuilding($list)
	{
		$this->db->insert_batch($this->_eb_table, $list); 
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		return TRUE;
	}
	
	/**
	 * 
	 * 删除意向办公地点
	 * @param unknown_type $ids
	 */
	public function delEnterpriseBuildingInfo($id)
	{
		$this->db->where('enterprise_id', $id);
		$this->db->delete($this->_eb_table); 
	} 
}