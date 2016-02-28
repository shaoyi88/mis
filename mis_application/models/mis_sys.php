<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 系统配置模型类
 * @author Administrator
 *
 */
class MIS_Sys extends CI_Model
{
	private $_table = 'mis_sys_config';
	
	/**
	 * 初始化
	 */
	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * 获取信息
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getInfo()
	{
		$query = $this->db->get($this->_table);
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
        $this->db->where('sys_id', $data['sys_id']);
		$this->db->update($this->_table, $data); 
	}
}