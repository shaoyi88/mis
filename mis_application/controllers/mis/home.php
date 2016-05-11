<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 主页
	 */
	public function index()
	{
		$data = array();
		$data['userName'] = $this->userName;
		$data['menus'] = $this->config->item('menus');
		$data['admin_id'] = $this->userId;
		$this->load->model('MIS_Sys');
		$info = $this->MIS_Sys->getInfo();
		$defaultConfig = $this->config->item('default_sys_config');
		$data['website_title'] = isset($info['website_title']) && $info['website_title'] ? $info['website_title'] : $defaultConfig['website_title'];
		$data['website_copyright'] = isset($info['website_copyright']) && $info['website_copyright'] ? $info['website_copyright'] : $defaultConfig['website_copyright'];
		$data['website_record_no'] = isset($info['website_record_no']) && $info['website_record_no'] ? $info['website_record_no'] : $defaultConfig['website_record_no'];
		remind(); //进入首页进行提醒
		$this->showView('index', $data);
	}
	
	/**
	 * 
	 * 退出
	 */
	public function logout()
	{
		$this->session->sess_destroy();
		redirect(formatUrl('login/index'));
	}
	
	/**
	 * 
	 * 欢迎页面
	 */
	public function welcome()
	{
		$data = array();
		$this->load->model('MIS_Sys');
		$info = $this->MIS_Sys->getInfo();
		$defaultConfig = $this->config->item('default_sys_config');
		$data['website_title'] = isset($info['website_title']) && $info['website_title'] ? $info['website_title'] : $defaultConfig['website_title'];
		$data['userName'] = $this->userName;
		if(checkRight(array('activity_audit', 'activity_assign'))){
			$this->load->model('MIS_Activity');
			$data['activityNum'] = $this->MIS_Activity->getAuditCount();
		}
		if(checkRight(array('enterprise_user_approve','enterprise_user_assign','apply_assign','apply_audit'))){
			$data['userNum'] = 0;
			if(checkRight(array('enterprise_user_approve','enterprise_user_assign'))){
				$this->load->model('MIS_User');
				$data['userNum'] = $this->MIS_User->getApproveEnterpriseUserCount();
			}
			if(checkRight(array('apply_assign','apply_audit'))){
				$this->load->model('MIS_EnterprisePotential');
				$data['userNum'] += $this->MIS_EnterprisePotential->getFollowCount();
			}
		}
		if(checkRight(array('repair_confirm', 'repair_assign', 'complain_reply', 'complain_assign'))){
			$data['propertyNum'] = 0;
			if(checkRight(array('repair_confirm','repair_assign'))){
				$this->load->model('MIS_Repair');
				$data['propertyNum'] += $this->MIS_Repair->getConfirmCount();
			}
			if(checkRight(array('complain_reply','complain_assign'))){
				$this->load->model('MIS_Complain');
				$data['propertyNum'] += $this->MIS_Complain->getConfirmCount();
			}
		}
		if(checkRight(array('project_apply_confirm', 'project_apply_assign', 'room_booking_confirm', 'room_booking_assign', 'potential_follow', 'potential_assign'))){
			$data['businessNum'] = 0;
			if(checkRight(array('project_apply_confirm','project_apply_assign'))){
				$this->load->model('MIS_Apply');
				$data['businessNum'] += $this->MIS_Apply->getConfirmApplyCount();
			}
			if(checkRight(array('room_booking_confirm','room_booking_assign'))){
				$this->load->model('MIS_Room');
				$data['businessNum'] += $this->MIS_Room->getConfirmBookingCount();
			}
			if(checkRight(array('potential_follow','potential_assign'))){
				$this->load->model('MIS_EnterpriseHidden');
				$data['businessNum'] += $this->MIS_EnterpriseHidden->getFollowCount();
			}
		}
		$this->showView('welcome', $data);
	}
	
	/**
	 * 开发中页面
	 */
	public function coding()
	{
		$data = array();
		$this->showView('coding', $data);
	}
}