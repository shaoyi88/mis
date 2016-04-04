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
		$this->showView('repairDetail', $data);
	}
	
	/**
	 * 
	 * 报修确认
	 */
	public function repairConfirm()
	{
		$data = array();
		if(checkRight('repair_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$data['status'] = 1;
		$data['service_time'] = strtotime($data['service_time']);
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
		$this->showView('complainDetail', $data);
	}
	
	/**
	 * 
	 * 投诉回复
	 */
	public function complainReply()
	{
		$data = array();
		if(checkRight('complain_reply') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$data['status'] = 1;
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
		if(checkRight('waterFee_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Fee');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('property/waterFee').'?', $this->MIS_Fee->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Fee->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['fee_type'] = $this->config->item('fee_type');
		$this->showView('feeList', $data);
	}
	
	/**
	 * 
	 * 费用信息添加/编辑
	 */
	public function addFee()
	{
		$data = array();
		$data['fee_type'] = $this->config->item('fee_type');
		$data['t'] = $this->input->get('t');
		$this->load->model('MIS_User');
		$data['userList'] = $this->MIS_User->getEnterpriseUserList();
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
				$msg = '&msg='.urlencode('创建失败');
			}
		}
		redirect(formatUrl('property/feeList?t='.$data['fee_type'].$msg));
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
		$t = $this->input->get('t');
		$this->load->model('MIS_Fee');
		$this->MIS_Fee->del($id);
		redirect(formatUrl('property/feeList?t=').$t);
	}
}