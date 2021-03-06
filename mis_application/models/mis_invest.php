<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 投资申请模型类
 * @author Administrator
 *
 */
class MIS_Invest extends CI_Model
{
	private $_table = 'mis_enterprise_invest';
	
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
	public function getCount($keyword, $uid=0)
	{
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
		$this->db->select('a.*,b.enterprise_name');
		$this->db->from('mis_enterprise_invest as a');
		$this->db->join('mis_enterprise as b', 'a.enterprise_id = b.enterprise_id');
	    if($uid){
			$this->db->where('a.user_id', $uid);
		}
		$this->db->group_by('invest_id');
		$this->db->order_by('a.add_time desc');
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
		$this->db->select('a.*,b.enterprise_name');
		$this->db->from('mis_enterprise_invest as a');
		$this->db->join('mis_enterprise as b', 'a.enterprise_id = b.enterprise_id');
		$this->db->where('invest_id', $uid);
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
        $this->db->where('invest_id', $data['invest_id']);
		$this->db->update($this->_table, $data); 
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $ids
	 */
	public function del($id)
	{
		$this->db->where('invest_id', $id);
		$this->db->delete($this->_table); 
	} 
	
}