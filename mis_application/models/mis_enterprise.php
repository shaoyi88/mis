<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 园区企业模型类
 * @author Administrator
 *
 */
class MIS_Enterprise extends CI_Model
{
	private $_table = 'mis_enterprise';
	private $_accountRecordTable = 'mis_enterprise_account_record';
	private $_eb_table = 'mis_enterprise_building';
	private $_build_table = 'mis_building';
	
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
	public function getAllList()
	{
		$info = array();
		$query = $this->db->get($this->_table);
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
	 * 编辑
	 * @param unknown_type $data
	 */
	public function update($data)
	{
        $this->db->where('enterprise_id', $data['enterprise_id']);
		$this->db->update($this->_table, $data); 
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
	 * 增加账户记录
	 * @param unknown_type $data
	 */
	public function addRecord($data)
	{
		$this->db->insert($this->_accountRecordTable, $data); 
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();		
		return $id;
	}
	
	/**
	 * 
	 * 获取列表
	 */
	public function getList($offset, $limit)
	{
		$info = array();
		$this->db->order_by('enterprise_enter_time','DESC');
		$query = $this->db->get($this->_table, $limit, $offset);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 通过企业名查询
	 * Enter description here ...
	 * @param unknown_type $account
	 */
	public function queryByName($name)
	{
		$this->db->where('enterprise_name', $name);
		$info = array();
		$query = $this->db->get($this->_table);
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
	 * 搜索企业
	 * @param unknown_type $key
	 */
	public function queryEnterpriseByKey($key)
	{
		$sql = "SELECT * FROM (`$this->_table`) WHERE enterprise_name like '%$key%'";
		$info = array();
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 获取企业logo
	 * @param unknown_type $key
	 */
	public function getLogo()
	{
		$sql = "SELECT * FROM (`$this->_table`) WHERE enterprise_logo<>''";
		$info = array();
		$query = $this->db->query($sql);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 批量增加企业所在办公地点
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
	 * 获取企业所在办公地点
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
	 * 删除企业所在办公地点
	 * @param unknown_type $ids
	 */
	public function delEnterpriseBuildingInfo($id)
	{
		$this->db->where('enterprise_id', $id);
		$this->db->delete($this->_eb_table); 
	}

	/**
	 *
	 * 验证企业邀请码
	 * @param unknown_type $code
	 */
	public function checkCode($code)
	{
		$this->db->where('enterprise_code', $code);
	    $info = array();
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->row_array();
			if(!empty($info)){
				return TRUE;
			}
		}
		return FALSE;
	}
}