<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Workbench extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 活动审核
	 */
	public function activity()
	{
		if(checkRight('activity_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Activity');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('workbench/activity').'?', $this->MIS_Activity->getAuditCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Activity->getAuditList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['activity_audit_type'] = $this->config->item('activity_audit_type');
		$this->showView('activityAuditList', $data);
	}
	
	/**
	 * 
	 * 活动审核
	 */
	public function doAuditActivity()
	{
		if(checkRight('activity_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$this->load->model('MIS_Activity');
		$this->MIS_Activity->update($data);
		redirect(formatUrl('workbench/activity'));
	}
	
	/**
	 * 
	 * 物业服务
	 */
	public function property()
	{
		$data = array();
		if(checkRight(array('repair_confirm', 'complain_reply')) === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data['type'] = checkRight('repair_confirm') ? 0 : 1;
		if($this->input->get('type')){
			$data['type'] = $this->input->get('type');
		}
		if($data['type'] == 0){
			if(checkRight('repair_confirm') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_Repair');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/property').'?type=0', $this->MIS_Repair->getConfirmCount(), PER_COUNT, $offset, $pageUrl);
			$dataList = $this->MIS_Repair->getConfirmList($offset, PER_COUNT);
			$data['pageUrl'] = $pageUrl;
			$data['dataList'] = $dataList;
			$data['repair_status'] = $this->config->item('repair_status');
			$data['repair_type'] = $this->config->item('repair_type');
		}else{
			if(checkRight('complain_reply') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_Complain');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/property').'?type=1', $this->MIS_Complain->getConfirmCount(), PER_COUNT, $offset, $pageUrl);
			$dataList = $this->MIS_Complain->getConfirmList($offset, PER_COUNT);
			$data['pageUrl'] = $pageUrl;
			$data['dataList'] = $dataList;
			$data['complain_status'] = $this->config->item('complain_status');
		}
		$this->showView('propertyList', $data);
	}
	
	/**
	 * 
	 * 确认物业报修
	 */
	public function doRepairConfirm()
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
		$this->MIS_Repair->update($data);
		redirect(formatUrl('workbench/property?type=0'));
	}
	
	/**
	 * 
	 * 确认物业投诉
	 */
	public function doComplainConfirm()
	{
		$data = array();
		if(checkRight('complain_reply') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$data['status'] = 1;
		$this->load->model('MIS_Complain');
		$this->MIS_Complain->update($data);
		redirect(formatUrl('workbench/property?type=1'));
	}
	
	/**
	 * 
	 * 企业服务
	 */
	public function business()
	{
		$data = array();
		if(checkRight(array('project_apply_confirm')) === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data['type'] = checkRight('project_apply_confirm') ? 0 : 1;
		if($this->input->get('type')){
			$data['type'] = $this->input->get('type');
		}
		if($data['type'] == 0){
			if(checkRight('project_apply_confirm') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_Project');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/business').'?type=0', $this->MIS_Project->getConfirmApplyCount(), PER_COUNT, $offset, $pageUrl);
			$dataList = $this->MIS_Project->getConfirmApplyList($offset, PER_COUNT);
			$data['pageUrl'] = $pageUrl;
			$data['dataList'] = $dataList;
		}else{
			if(checkRight('room_booking_confirm') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_Room');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/business').'?type=1', $this->MIS_Room->getConfirmBookingCount(), PER_COUNT, $offset, $pageUrl);
			$dataList = $this->MIS_Room->getConfirmBookingList($offset, PER_COUNT);
			$data['pageUrl'] = $pageUrl;
			$data['dataList'] = $dataList;
			$data['room_type'] = $this->config->item('room_type');
		}
		$this->showView('businessList', $data);
	}
	
	/**
	 * 
	 * 项目需求申请确认
	 */
	public function doConfirmProjectApply()
	{
		$data = array();
		if(checkRight('project_apply_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$data['status'] = 1;
		$this->load->model('MIS_Project');
		$msg = '';
		$this->MIS_Project->updateApply($data);
		redirect(formatUrl('workbench/business?type=0'));
	}
	
	/**
	 * 
	 * 企业审批
	 */
	public function enterprise()
	{
		$data = array();
		if(checkRight('enterprise_user_approve') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_User');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('workbench/enterprise').'?', $this->MIS_User->getApproveEnterpriseUserCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_User->getApproveEnterpriseUserList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('approveEnterpriseUserList', $data);
	}
	
	/**
	 * 
	 * 企业审批逻辑
	 */
	public function doApproveEnterpriseUser()
	{
		$data = array();
		if(checkRight('enterprise_user_approve') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$this->load->model('MIS_User');
		$updataApply = array();
		$updataApply['apply_id'] = $data['apply_id'];
		$updataApply['status'] = $data['status'];
		$updataApply['msg'] = $data['msg'];
		$this->MIS_User->updateRelateEnterpriseApply($updataApply);
		$updataUser = array();
		$updataUser['user_id'] = $data['user_id'];
		$updataUser['enterprise_id'] = $data['enterprise_id'];
		$this->MIS_User->update($updataUser);
		redirect(formatUrl('workbench/enterprise'));
	}
}