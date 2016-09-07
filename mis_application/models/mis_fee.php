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
	public function getCount($keyword, $eid=0)
	{
	    $sql = "select count(*) as num from `$this->_table` as a left join `$this->_enterpriseTable` as b on a.enterprise_id = b.enterprise_id where 1=1 ";
		if(isset($keyword['pay_status']) && $keyword['pay_status'] != ''){
			$sql .= ' and a.pay_status ='.$keyword['pay_status'];
		}
		if(isset($keyword['enterprise_name']) && $keyword['enterprise_name'] != ''){
            $sql .= ' and b.enterprise_name like "%'.$keyword['enterprise_name'].'%"';
        }
        if(isset($keyword['fee_date']) && $keyword['fee_date'] != ''){
            $sql .= ' and a.fee_date ='.$keyword['fee_date'];
        }
		if($eid!=0){
			$sql .= ' and a.enterprise_id ='.$eid;
		}
		$query = $this->db->query($sql);
        if($query){
        	$info = $query->row_array();
        }
        return $info['num'];
	}
	
	/**
	 * 获取列表
	 * Enter description here ...
	 */
	public function getList($keyword, $offset, $limit, $eid=0)
	{
		$info = array();
		$sql = "select * from `$this->_table` as a left join `$this->_enterpriseTable` as b on 
				a.enterprise_id = b.enterprise_id where 1=1 ";
		if(isset($keyword['pay_status']) && $keyword['pay_status'] != ''){
			$sql .= ' and a.pay_status ='.$keyword['pay_status'];
		}
		if(isset($keyword['enterprise_name']) && $keyword['enterprise_name'] != ''){
        	$sql .= ' and b.enterprise_name like "%'.$keyword['enterprise_name'].'%"';
        }
        if(isset($keyword['fee_date']) && $keyword['fee_date'] != ''){
        	$sql .= ' and a.fee_date ='.$keyword['fee_date'];
        }
		if($eid!=0){
			$sql .= ' and a.enterprise_id ='.$eid;
		}
		$sql .= " order by a.fee_id desc limit $offset, $limit";
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
		$info = array();
		$sql = "select * from `$this->_table` as a left join `$this->_enterpriseTable` as b on 
				a.enterprise_id = b.enterprise_id where fee_id=$id ";
		$query = $this->db->query($sql);
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
	
	/**
	 * 
	 * 通过企业和日期查找信息
	 * @param unknown_type $enterprise_id
	 * @param unknown_type $date
	 */
	public function getInfoByEnterpriseAndDate($enterprise_id, $date)
	{
		$this->db->where('enterprise_id', $enterprise_id);
		$this->db->where('fee_date', $date);
		$query = $this->db->get($this->_table);
		$info = array();
		if($query){
			$info = $query->row_array();
		}
		return $info;
	}

	public function getEnterpriseFee()
	{
	    $sql = "SELECT enterprise_id,SUM(rent_fee+property_fee+water_fee_unit_price*water_fee_num+elec_fee_unit_price*elec_fee_num) as fee FROM mis_fee WHERE pay_status = 0 GROUP BY enterprise_id";
	    $query = $this->db->query($sql);
        $info = array();
        if($query){
            $info = $query->result_array();
        }
        $result = array();
        foreach($info as $item){
            $result[$item['enterprise_id']] = $item;
        }
        return $result;
	}
}