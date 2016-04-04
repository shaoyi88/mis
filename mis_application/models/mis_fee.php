<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 费用模型类
 * @author Administrator
 *
 */
class MIS_Fee extends CI_Model
{
	private $_table = 'mis_fee';
	
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
			$this->db->where('fee_type', $keyword['t']);
		}
		if(isset($keyword['pay_status']) && $keyword['pay_status'] != ''){
			$this->db->where('pay_status', $keyword['pay_status']);
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
			$this->db->where('fee_type', $keyword['t']);
		}
		if(isset($keyword['pay_status']) && $keyword['pay_status'] != ''){
			$this->db->where('pay_status', $keyword['pay_status']);
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
		$query = $this->db->get_where($this->_table, array('fee_id' => $id));
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
        $this->db->where('fee_id', $data['fee_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('fee_id', $id);
		$this->db->delete($this->_table); 
	} 
}