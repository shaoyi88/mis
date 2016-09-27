<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 网盘模型类
 * @author Administrator
 *
 */
class MIS_Netdisk extends CI_Model
{
	private $_table = 'mis_dir';
	private $_fileTable = 'mis_file';
	
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
	public function getDirList($offset, $limit)
	{
		$info = array();
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
	public function getDirCount()
	{
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 获取信息
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getDirInfo($id)
	{
		$query = $this->db->get_where($this->_table, array('dir_id' => $id));
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
	public function addDir($data)
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
	public function updateDir($data)
	{
        $this->db->where('dir_id', $data['dir_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function delDir($id)
	{
		$this->db->where('dir_id', $id);
		$this->db->delete($this->_table); 
		$this->db->delete($this->_fileTable); 
	} 
	
	/**
	 * 
	 * 删除文件
	 * @param unknown_type $ids
	 */
	public function delFile($id)
	{
		$this->db->where('file_id', $id);
		$this->db->delete($this->_fileTable); 
	} 
	
	/**
	 * 
	 * 获取文件总数
	 */
	public function getFileCount($dirId)
	{
		$this->db->where('dir_id', $dirId);
		return $this->db->count_all_results($this->_fileTable);
	}
	
	/**
	 * 
	 * 获取文件列表
	 * @param unknown_type $dirId
	 * @param unknown_type $limit
	 * @param unknown_type $offset
	 */
	public function getFileList($dirId, $offset, $limit)
	{
		$info = array();
		$this->db->where('dir_id', $dirId);
		$query = $this->db->get($this->_fileTable, $limit, $offset);
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
	public function addFile($data)
	{
		$this->db->insert($this->_fileTable, $data); 
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();		
		return $id;
	}
	
	/**
	 * 获取信息
	 * Enter description here ...
	 * @param unknown_type $id
	 */
	public function getFileInfo($id)
	{
		$query = $this->db->get_where($this->_fileTable, array('file_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
}