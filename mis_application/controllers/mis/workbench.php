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
		//获取可跟进用户
		$this->load->model('MIS_Admin');
		$adminList = array();
		$list = $this->MIS_Admin->getAll();
		foreach($list as $item){
			if($item['admin_role'] == 0){
				$adminList[] = $item;
			}else{
				$rightsArr = explode(',', $item['role_rights']);
				if(in_array('activity_audit', $rightsArr)){
					$adminList[] = $item;
				}
			}
		}
		$data['adminList'] = $adminList;
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
	 * 指派跟进人
	 */
	public function doFollowActivity()
	{
		if(checkRight('activity_assign') === FALSE){
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
	 * 指派跟进人
	 */
	public function doRepairFollow()
	{
		if(checkRight('repair_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
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
	 * 指派跟进人
	 */
	public function doComplainFollow()
	{
		if(checkRight('complain_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
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
		if(checkRight(array('project_apply_confirm','room_booking_confirm','potential_follow')) === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if(checkRight('project_apply_confirm')){
			$data['type'] = 0;
		}else if(checkRight('room_booking_confirm')){
			$data['type'] = 1;
		}else{
			$data['type'] = 2;
		}
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
			//获取可跟进用户
			$this->load->model('MIS_Admin');
			$adminList = array();
			$list = $this->MIS_Admin->getAll();
			foreach($list as $item){
				if($item['admin_role'] == 0){
					$adminList[] = $item;
				}else{
					$rightsArr = explode(',', $item['role_rights']);
					if(in_array('project_apply_confirm', $rightsArr)){
						$adminList[] = $item;
					}
				}
			}
			$data['adminList'] = $adminList;
		}else if($data['type'] == 1){
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
		}else{
			if(checkRight('potential_follow') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_EnterprisePotential');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/business').'?type=2', $this->MIS_EnterprisePotential->getFollowCount(), PER_COUNT, $offset, $pageUrl);
			$dataList = $this->MIS_EnterprisePotential->getFollowList($offset, PER_COUNT);
			$data['pageUrl'] = $pageUrl;
			$data['dataList'] = $dataList;
			//获取可跟进用户
			$this->load->model('MIS_Admin');
			$adminList = array();
			$list = $this->MIS_Admin->getAll();
			foreach($list as $item){
				if($item['admin_role'] == 0){
					$adminList[] = $item;
				}else{
					$rightsArr = explode(',', $item['role_rights']);
					if(in_array('potential_follow', $rightsArr)){
						$adminList[] = $item;
					}
				}
			}
			$data['adminList'] = $adminList;
		}
		$this->showView('businessList', $data);
	}
	
	public function doFollowPotential()
	{
		$data = $this->input->post();
		if(!$data['follow_by'] && checkRight('potential_follow') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('potential_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if(!$data['follow_by']){
			$data['deal_status'] = 1;
		}
		$this->load->model('MIS_EnterprisePotential');
		$msg = '';
		$this->MIS_EnterprisePotential->update($data);
		redirect(formatUrl('workbench/business?type=2'));
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
	 * 指派跟进人
	 */
	public function doFollowProjectApply()
	{
		if(checkRight('project_apply_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$this->load->model('MIS_Project');
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
		//获取可跟进用户
		$this->load->model('MIS_Admin');
		$adminList = array();
		$list = $this->MIS_Admin->getAll();
		foreach($list as $item){
			if($item['admin_role'] == 0){
				$adminList[] = $item;
			}else{
				$rightsArr = explode(',', $item['role_rights']);
				if(in_array('enterprise_user_approve', $rightsArr)){
					$adminList[] = $item;
				}
			}
		}
		$data['adminList'] = $adminList;
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
	
	/**
	 * 
	 * 指派跟进人
	 */
	public function doEnterpriseUserFollow()
	{
		if(checkRight('enterprise_user_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$this->load->model('MIS_User');
		$this->MIS_User->updateRelateEnterpriseApply($data);
		redirect(formatUrl('workbench/enterprise'));
	}
}