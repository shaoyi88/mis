<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Property extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 报修列表
	 */
	public function repair()
	{
		$data = array();
		if(checkRight('repair_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Repair');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('property/repair').'?', $this->MIS_Repair->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Repair->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['repair_status'] = $this->config->item('repair_status');
		$data['repair_type'] = $this->config->item('repair_type');
		$this->showView('repairList', $data);
	}
	
	/**
	 * 
	 * 报修查看
	 */
	public function repairDetail()
	{
		$data = array();
		if(checkRight('repair_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Repair');
		$data['info'] = $this->MIS_Repair->getInfo($id);
		$data['repair_status'] = $this->config->item('repair_status');
		$data['repair_type'] = $this->config->item('repair_type');
		$data['userId'] = $this->userId;
		//获取可跟进用户
		$this->load->model('MIS_Admin');
		$adminList = array();
		$list = $this->MIS_Admin->getAll();
		foreach($list as $item){
			if($item['admin_role'] == 0){
				$adminList[] = $item;
			}else{
				$rightsArr = explode(',', $item['role_rights']);
				if(in_array('repair_confirm', $rightsArr)){
					$adminList[] = $item;
				}
			}
		}
		$data['adminList'] = $adminList;
		$this->showView('repairDetail', $data);
	}
	
	/**
	 * 
	 * 报修确认
	 */
	public function repairConfirm()
	{
		$data = $this->input->post();
		if(!$data['follow_by'] && checkRight('repair_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('repair_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if(!$data['follow_by']){
			$data['status'] = 1;
			$data['service_time'] = strtotime($data['service_time']);
		}
		$this->load->model('MIS_Repair');
		$msg = '';
		$this->MIS_Repair->update($data);
		redirect(formatUrl('property/repair'));
	}
	
	/**
	 * 
	 * 投诉列表
	 */
	public function complain()
	{
		$data = array();
		if(checkRight('complain_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Complain');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('property/complain').'?', $this->MIS_Complain->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Complain->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['complain_status'] = $this->config->item('complain_status');
		$this->showView('complainList', $data);
	}
	
	/**
	 * 
	 * 投诉查看
	 */
	public function complainDetail()
	{
		$data = array();
		if(checkRight('complain_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Complain');
		$data['info'] = $this->MIS_Complain->getInfo($id);
		$data['complain_status'] = $this->config->item('complain_status');
		$data['userId'] = $this->userId;
		//获取可跟进用户
		$this->load->model('MIS_Admin');
		$adminList = array();
		$list = $this->MIS_Admin->getAll();
		foreach($list as $item){
			if($item['admin_role'] == 0){
				$adminList[] = $item;
			}else{
				$rightsArr = explode(',', $item['role_rights']);
				if(in_array('complain_reply', $rightsArr)){
					$adminList[] = $item;
				}
			}
		}
		$data['adminList'] = $adminList;
		$this->showView('complainDetail', $data);
	}
	
	/**
	 * 
	 * 投诉回复
	 */
	public function complainReply()
	{
		$data = $this->input->post();
		if(!$data['follow_by'] && checkRight('complain_reply') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('complain_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if(!$data['follow_by']){
			$data['status'] = 1;
		}
		$this->load->model('MIS_Complain');
		$msg = '';
		$this->MIS_Complain->update($data);
		redirect(formatUrl('property/complain'));
	}
	
	/**
	 * 
	 * 费用管理列表
	 */
	public function feeList()
	{
		$data = array();
		if(checkRight('fee_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
		}
		$this->load->model('MIS_Fee');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('property/feeList'), $this->MIS_Fee->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Fee->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$this->showView('feeList', $data);
	}
	
	/**
	 * 
	 * 费用信息添加/编辑
	 */
	public function addFee()
	{
		$data = array();
		$this->load->model('MIS_Enterprise');
		$data['enterpriseList'] = $this->MIS_Enterprise->getAllList();
		if($this->input->get('did')){
			if(checkRight('fee_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$did = $this->input->get('did');
			$this->load->model('MIS_Fee');
			$data['info'] = $this->MIS_Fee->getInfo($did);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('fee_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('feeAdd', $data);
	}
	
	/**
	 * 
	 * 支付费用
	 */
	public function payFee()
	{
		$data = array();
		if(checkRight('fee_pay') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Fee');
		$info = $this->MIS_Fee->getInfo($id);
		$data['info'] = $info;
		$data['total'] = $info['property_fee_amount']+$info['water_fee_amount']+$info['elec_fee_amount'];
		$this->showView('feePay', $data);
	}
	
	/**
	 * 
	 * 支付费用逻辑
	 */
	public function doPayFee()
	{
		$data = array();
		if(checkRight('fee_pay') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$this->load->model('MIS_Enterprise');
		$enterpriseInfo = $this->MIS_Enterprise->getInfo($data['enterprise_id']);
		if($data['pay_amount'] > $data['total']){ // 支付大于预付,多余金额转入企业账户
			// 增加账户记录
			$record = array();
			$record['enterprise_id'] = $data['enterprise_id'];
			$record['record_type'] = 1;
			$record['amount'] = $data['pay_amount']-$data['total'];
			$balance = $enterpriseInfo['enterprise_account']+$record['amount'];
			$record['balance'] = $balance;
			$record['add_time'] = time();
			$record['desc'] = '费用支付存入';
			$record['admin_id'] = $this->userId;
			$record['admin_name'] = $this->userName;
			$this->MIS_Enterprise->addRecord($record);
			// 更新企业账户
			$update = array();
			$update['enterprise_id'] = $data['enterprise_id'];
			$update['enterprise_account'] = $balance;
			$this->MIS_Enterprise->update($update);
		}else if($data['pay_amount'] < $data['total']){ // 支付小于预付，使用账户金额支付
			if($data['pay_amount']+$enterpriseInfo['enterprise_account'] < $data['total']){ // 账户金额不足
				$msg = '?msg='.urlencode('账户金额不足支付');
				redirect(formatUrl('property/feeList'.$msg));
				exit;
			}else{
				// 增加账户记录
				$record = array();
				$record['enterprise_id'] = $data['enterprise_id'];
				$record['record_type'] = 0;
				$record['amount'] = $data['total'] - $data['pay_amount'];
				$balance = $enterpriseInfo['enterprise_account']-$record['amount'];
				$record['balance'] = $balance;
				$record['add_time'] = time();
				$record['desc'] = '费用支付支出';
				$record['admin_id'] = $this->userId;
				$record['admin_name'] = $this->userName;
				$this->MIS_Enterprise->addRecord($record);
				// 更新企业账户
				$update = array();
				$update['enterprise_id'] = $data['enterprise_id'];
				$update['enterprise_account'] = $balance;
				$this->MIS_Enterprise->update($update);
			}
		}
		$data['pay_status'] = 1;
		$data['pay_time'] = time();
		unset($data['total']);
		$this->load->model('MIS_Fee');
		$this->MIS_Fee->update($data);
		redirect(formatUrl('property/feeList'));
	}
	
	/**
	 * 
	 * 费用信息添加/编辑逻辑
	 */
	public function doAddFee()
	{
		$data = array();
		$data['fee_date'] = strtotime($data['fee_date']);
		if($this->input->post('fee_id')){
			if(checkRight('fee_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Fee');
			$msg = '';
			$this->MIS_Fee->update($data);
		}else{
			if(checkRight('fee_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Fee');
			$msg = '';
			$id = $this->MIS_Fee->add($data);
			if($id === FALSE){
				$msg = '?msg='.urlencode('创建失败');
			}
		}
		redirect(formatUrl('property/feeList'.$msg));
	}
	
 	/**
     * 
     * 删除
     */
	public function doDelFee()
	{
		$data = array();
		if(checkRight('fee_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Fee');
		$this->MIS_Fee->del($id);
		redirect(formatUrl('property/feeList'));
	}
	
	/**
	 * 
	 * 企业需求列表
	 */
	public function need()
	{
		$data = array();
		if(checkRight('need_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Need');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('property/need').'?', $this->MIS_Need->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Need->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['need_status'] = $this->config->item('need_status');
		$data['need_type'] = $this->config->item('need_type');
		$this->showView('needList', $data);
	}
	
	/**
	 * 
	 * 企业需求详情
	 */
	public function needDetail()
	{
		$data = array();
		if(checkRight('need_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Need');
		$data['info'] = $this->MIS_Need->getInfo($id);
		$data['need_status'] = $this->config->item('need_status');
		$data['need_type'] = $this->config->item('need_type');
		$this->showView('needDetail', $data);
	}
	
	/**
	 * 
	 * 企业需求确认
	 */
	public function needConfirm()
	{
		$data = array();
		if(checkRight('need_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$data['status'] = 1;
		$this->load->model('MIS_Need');
		$msg = '';
		$this->MIS_Need->update($data);
		redirect(formatUrl('property/need'));
	}
}