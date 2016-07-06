<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 
 * 资讯模型类
 * @author Administrator
 *
 */
class MIS_Article extends CI_Model
{
	private $_table = 'mis_article';
	private $_typeTable = 'mis_article_type';
	private $_commentTable = 'mis_article_comment';
	
	/**
	 * 初始化
	 */
	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * 获取类型列表树
	 * Enter description here ...
	 */
	public function getTypeListTree($pid, $allTypeList = NULL)
	{
		if($allTypeList === NULL){
			$allTypeList = $this->_getAllType();
		}
		$reuslt = array();
		$this->_getSubTypeList($reuslt, $allTypeList, $pid, 0);
		return $reuslt;
	}
	
	/**
	 * 
	 * 获取类别信息
	 * @param unknown_type $id
	 */
	public function getTypeInfo($id)
	{
		$query = $this->db->get_where($this->_typeTable, array('type_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 根据名称获取类别
	 * @param unknown_type $pid
	 * @param unknown_type $name
	 */
	public function getTypeInfoByName($pid, $name)
	{
		$this->db->where('parent_id', $pid);
		$this->db->where('type_name', $name);
		$query = $this->db->get($this->_table);
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 * 
	 * 增加类别
	 * @param unknown_type $data
	 */
	public function addType($data)
	{
		$this->db->insert($this->_typeTable, $data);
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();
		return $id;
	}
	
	/**
	 * 
	 * 更新类别
	 * @param unknown_type $data
	 */
	public function updateType($data)
	{
		$this->db->where('type_id', $data['type_id']);
		$this->db->update($this->_typeTable, $data);
	}
	
	/**
	 * 
	 * 删除类别
	 * @param unknown_type $dids
	 */
	public function delType($dids)
	{
		$this->db->where_in('type_id', $dids);
		$this->db->delete($this->_typeTable);
	}
	
	/**
	 * 
	 * 通过类别获取文章
	 * @param unknown_type $types
	 */
	public function getInfoByTypes($dids)
	{
		$this->db->where_in('type_id', $dids);
		$info = array();
		$query = $this->db->get($this->_table);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 获取全部类型
	 */
	private function _getAllType()
	{
		$info = array();
		$query = $this->db->get($this->_typeTable);
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 获取子树
	 * @param unknown_type $result
	 * @param unknown_type $allList
	 * @param unknown_type $pid
	 * @param unknown_type $level
	 */
	private function _getSubTypeList(&$result, $allList, $pid, $level)
	{
		foreach($allList as $item){
			if($item['parent_id'] == $pid){
				$item['level'] = $level;
				$result[] = $item;
				$this->_getSubTypeList($result,$allList,$item['type_id'],$level+1);
			}
		}
	}
	
	/**
	 * 
	 * 获取总数
	 */
	public function getCount($type)
	{
		if($type != ''){
			$this->db->where('article_type', $type);
		}
		return $this->db->count_all_results($this->_table);
	}
	
	/**
	 * 
	 * 获取列表
	 */
	public function getList($type, $offset, $limit)
	{
		$info = array();
		$this->db->order_by('update_time','DESC');
		if($type != ''){
			$this->db->where('article_type', $type);
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
		$this->db->where('article_id', $data['article_id']);
		$this->db->update($this->_table, $data);
	}
	
	/**
	 * 
	 * 删除
	 * @param unknown_type $dids
	 */
	public function del($id)
	{
		$this->db->where('article_id', $id);
		$this->db->delete($this->_table);
	}
	
	/**
	 * 
	 * 获取信息
	 * @param unknown_type $id
	 */
	public function getInfo($id)
	{
		$query = $this->db->get_where($this->_table, array('article_id' => $id));
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 获取文章评论
	 * @param unknown_type $id
	 */
	public function getCommentList($id)
	{
		$this->db->select("a.*,b.user_nickname");
		$this->db->from("mis_article_comment as a");
		$this->db->join('mis_user as b', 'a.user_id = b.user_id');
		$this->db->group_by('a.comment_id');
		$this->db->order_by('a.comment_time desc');
		$query = $this->db->get($this->_commentTable);
		$info = array();
		if($query){
			$info = $query->result_array();
		}
		return $info;
	}
	
	/**
	 *
	 * 添加文章评论
	 * @param unknown_type $data
	 */
	public function addComment($data)
	{
		$this->db->insert($this->_commentTable, $data);
		if($this->db->affected_rows() <= 0){
			return FALSE;
		}
		$id = $this->db->insert_id();
		return $id;
	}
}