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
		$data = array();
		if(checkRight(array('activity_audit', 'activity_assign')) === FALSE){
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
		unset($data['file']);
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
		if(checkRight(array('repair_confirm', 'repair_assign', 'complain_reply', 'complain_assign')) === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data['type'] = checkRight(array('repair_confirm', 'repair_assign')) ? 0 : 1;
		if($this->input->get('type')){
			$data['type'] = $this->input->get('type');
		}
		if(checkRight(array('repair_confirm','repair_assign'))){
			$this->load->model('MIS_Repair');
			$data['num1'] = $this->MIS_Repair->getConfirmCount();
		}
		if(checkRight(array('complain_reply','complain_assign'))){
			$this->load->model('MIS_Complain');
			$data['num2'] = $this->MIS_Complain->getConfirmCount();
		}
		if($data['type'] == 0){
			if(checkRight(array('repair_confirm', 'repair_assign')) === FALSE){
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
			if(checkRight(array('complain_reply','complain_assign')) === FALSE){
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
		$data = $this->input->get();
		unset($data['file']);
		if($data['status'] == 1){
			$data['service_time'] = strtotime($data['service_time']);
		}
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
		unset($data['file']);
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
		$data = $this->input->get();
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
		if(checkRight(array('project_apply_confirm', 'project_apply_assign'))){
			$data['type'] = 0;
		}else if(checkRight(array('room_booking_confirm','room_booking_assign'))){
			$data['type'] = 1;
		}else{
			$data['type'] = 2;
		}
		if($this->input->get('type')){
			$data['type'] = $this->input->get('type');
		}
		if(checkRight(array('project_apply_confirm','project_apply_assign'))){
			$this->load->model('MIS_Apply');
			$data['num1'] = $this->MIS_Apply->getConfirmApplyCount();
		}
		if(checkRight(array('room_booking_confirm','room_booking_assign'))){
			$this->load->model('MIS_Room');
			$data['num2'] = $this->MIS_Room->getConfirmBookingCount();
		}
		if(checkRight(array('potential_follow','potential_assign'))){
			$this->load->model('MIS_EnterpriseHidden');
			$data['num3'] = $this->MIS_EnterpriseHidden->getFollowCount();
		}
		if($data['type'] == 0){
			if(checkRight(array('project_apply_confirm','project_apply_assign')) === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_Apply');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/business').'?type=0', $this->MIS_Apply->getConfirmApplyCount(), PER_COUNT, $offset, $pageUrl);
			$dataList = $this->MIS_Apply->getConfirmApplyList($offset, PER_COUNT);
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
			$data['apply_status'] = $this->config->item('project_apply_status');
			$data['apply_type'] = $this->config->item('apply_type');
		}else if($data['type'] == 1){
			if(checkRight(array('room_booking_confirm','room_booking_assign')) === FALSE){
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
			$this->load->model('MIS_EnterpriseHidden');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/business').'?type=2', $this->MIS_EnterpriseHidden->getFollowCount(), PER_COUNT, $offset, $pageUrl);
			$dataList = $this->MIS_EnterpriseHidden->getFollowList($offset, PER_COUNT);
			$data['pageUrl'] = $pageUrl;
			$data['dataList'] = $dataList;
			//获取可跟进用户
			$this->load->model('MIS_Admin');
			$adminList = array();
			$list = $this->MIS_Admin->getAll();
			foreach($list as $item){
				$adminList[] = $item;
			}
			$data['adminList'] = $adminList;
		}
		$this->showView('businessList', $data);
	}
	
	public function doFollowPotential()
	{
		$data = $this->input->post();
		unset($data['file']);
		$this->load->model('MIS_EnterpriseHidden');
		$msg = '';
		$this->MIS_EnterpriseHidden->update($data);
		redirect(formatUrl('workbench/business?type=2'));
	}
	
	public function doEnterpriseApplyFollow()
	{
		$data = $this->input->post();
		if(!$data['follow_by'] && checkRight('apply_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('apply_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		unset($data['file']);
		$this->load->model('MIS_EnterprisePotential');
		$msg = '';
		$this->MIS_EnterprisePotential->update($data);
		redirect(formatUrl('workbench/enterprise?type=1'));
	}
	
	public function doEnterpriseApplyChange()
	{
		$data = array();
		if(checkRight('activity_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_EnterprisePotential');
		$msg = '';
		$data['enterprise_id'] = $id;
		$data['is_change'] = 1;
		$this->MIS_EnterprisePotential->update($data);
		
		$info = $this->MIS_EnterprisePotential->getInfo($id);
		$this->load->model('MIS_EnterpriseHidden');
		$addData = array();
		$addData['enterprise_name'] = $info['enterprise_name'];
		$addData['enterprise_contact'] = $info['enterprise_contact'];
		$addData['enterprise_contact_mobile'] = $info['enterprise_contact_mobile'];
		$addData['add_time'] = time();
		$this->MIS_EnterpriseHidden->add($addData);
		
		redirect(formatUrl('workbench/enterprise?type=1'));
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
		unset($data['file']);
		$data['status'] = 1;
		$this->load->model('MIS_Apply');
		$msg = '';
		$this->MIS_Apply->update($data);
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
		$this->load->model('MIS_Apply');
		$this->MIS_Apply->update($data);
		redirect(formatUrl('workbench/business?type=0'));
	}
	
	/**
	 * 
	 * 企业审批
	 */
	public function enterprise()
	{
		$data = array();
		if(checkRight(array('enterprise_user_approve','enterprise_user_assign','apply_assign','apply_audit')) === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if(checkRight(array('enterprise_user_approve', 'enterprise_user_assign'))){
			$data['type'] = 0;
		}else{
			$data['type'] = 1;
		}
		if(checkRight(array('enterprise_user_approve','enterprise_user_assign'))){
			$this->load->model('MIS_User');
			$data['num1'] = $this->MIS_User->getApproveEnterpriseUserCount();
		}
		if(checkRight(array('apply_assign','apply_audit'))){
			$this->load->model('MIS_EnterprisePotential');
			$data['num2'] = $this->MIS_EnterprisePotential->getFollowCount();
		}
		if($this->input->get('type')){
			$data['type'] = $this->input->get('type');
		}
		if($data['type'] == 0){
			if(checkRight(array('enterprise_user_approve','enterprise_user_assign')) === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_User');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/enterprise').'?type=0', $this->MIS_User->getApproveEnterpriseUserCount(), PER_COUNT, $offset, $pageUrl);
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
		}else{
			if(checkRight(array('apply_assign','apply_audit')) === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$this->load->model('MIS_EnterprisePotential');
			$offset = 0;
			$pageUrl = '';
			page(formatUrl('workbench/business').'?type=1', $this->MIS_EnterprisePotential->getFollowCount(), PER_COUNT, $offset, $pageUrl);
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
					if(in_array('apply_audit', $rightsArr)){
						$adminList[] = $item;
					}
				}
			}
			$data['adminList'] = $adminList;
		}
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
		unset($data['file']);
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
	
	/**
	 * 
	 * 导出会议室租用申请表
	 */
	public function exportRoomBooking()
	{
		$data = array();
		if(checkRight('room_booking_export') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Room');
		$info = $this->MIS_Room->getBookingApplyInfo($id);
		$room_type = $this->config->item('room_type');
		 //加载PHPExcel库
	   	require_once THIRD_PATH.'PHPExcel.php';
	   	require_once THIRD_PATH.'PHPExcel/IOFactory.php';
	   	$objPHPExcel = new PHPExcel();
	   	//列宽
		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(12);
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(12);
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(15);
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
		$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(12);
		$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(12);
		$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(12);
		$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(12);
		
		//第一行
		$objPHPExcel->getActiveSheet()->getRowDimension(1)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A1:H1');
		$objPHPExcel->getActiveSheet()->setCellValue('A1', '创投大厦'.$room_type[$info['room_type']].'租用申请表');
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(20);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1:H1')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第二行
		$objPHPExcel->getActiveSheet()->mergeCells('A2:F2');
		$objPHPExcel->getActiveSheet()->mergeCells('G2:H2');
		$objPHPExcel->getActiveSheet()->setCellValue('G2', '编号：');
		$objPHPExcel->getActiveSheet()->getStyle('A2:H2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		$objPHPExcel->getActiveSheet()->getStyle('A2:H2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A2:H2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第三行
		$objPHPExcel->getActiveSheet()->getRowDimension(3)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A3', '申请单位');
		$objPHPExcel->getActiveSheet()->mergeCells('B3:C3');
		$objPHPExcel->getActiveSheet()->setCellValue('B3', $info['enterprise_name']);
		$objPHPExcel->getActiveSheet()->setCellValue('D3', '申请日期');
		$objPHPExcel->getActiveSheet()->mergeCells('E3:H3');
		$objPHPExcel->getActiveSheet()->setCellValue('E3', date('Y年m月d日', $info['start_time']));
		$objPHPExcel->getActiveSheet()->getStyle('A3:H3')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A3:H3')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A3:H3')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第四行
		$objPHPExcel->getActiveSheet()->getRowDimension(4)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A4', '租用场地');
		$objPHPExcel->getActiveSheet()->mergeCells('B4:H4');
		$objPHPExcel->getActiveSheet()->setCellValue('B4', $info['room_name']);
		$objPHPExcel->getActiveSheet()->getStyle('A4:H4')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A4:H4')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A4:H4')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第五行
		$objPHPExcel->getActiveSheet()->getRowDimension(5)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A5', '租用事由');
		$objPHPExcel->getActiveSheet()->mergeCells('B5:H5');
		$objPHPExcel->getActiveSheet()->setCellValue('B5', $info['meeting_title']);
		$objPHPExcel->getActiveSheet()->getStyle('A5:H5')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A5:H5')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A5:H5')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第六行
		$objPHPExcel->getActiveSheet()->getRowDimension(6)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A6', '使用设备');
		$objPHPExcel->getActiveSheet()->mergeCells('B6:H6');
		$objPHPExcel->getActiveSheet()->setCellValue('B6', '口空调     口话筒    口投影       口其它：（         ）');
		$objPHPExcel->getActiveSheet()->getStyle('A6:H6')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A6:H6')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A6:H6')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第七行
		$objPHPExcel->getActiveSheet()->getRowDimension(7)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A7', '张贴物品');
		$objPHPExcel->getActiveSheet()->mergeCells('B7:E7');
		$objPHPExcel->getActiveSheet()->setCellValue('B7', '口无  口标示  口框架海报  口横幅  口其它');
		$objPHPExcel->getActiveSheet()->setCellValue('F7', '张贴位置');
		$objPHPExcel->getActiveSheet()->mergeCells('G7:H7');
		$objPHPExcel->getActiveSheet()->getStyle('A7:H7')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A7:H7')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A7:H7')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第八行
		$objPHPExcel->getActiveSheet()->getRowDimension(8)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A8', '与会人数');
		$objPHPExcel->getActiveSheet()->mergeCells('C8:D8');
		$objPHPExcel->getActiveSheet()->setCellValue('C8', '预计与会嘉宾（仅供参考）');
		$objPHPExcel->getActiveSheet()->mergeCells('E8:H8');
		$objPHPExcel->getActiveSheet()->getStyle('A8:H8')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A8:H8')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A8:H8')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第九行
		$objPHPExcel->getActiveSheet()->getRowDimension(9)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A9:B9');
		$objPHPExcel->getActiveSheet()->mergeCells('C9:D9');
		$objPHPExcel->getActiveSheet()->mergeCells('E9:F9');
		$objPHPExcel->getActiveSheet()->mergeCells('G9:H9');
		$objPHPExcel->getActiveSheet()->setCellValue('A9', '申请人');
		$objPHPExcel->getActiveSheet()->setCellValue('C9', '办公室电话');
		$objPHPExcel->getActiveSheet()->setCellValue('E9', '移动电话');
		$objPHPExcel->getActiveSheet()->setCellValue('G9', '单位地址');
		$objPHPExcel->getActiveSheet()->getStyle('A9:H9')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A9:H9')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A9:H9')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第十行
		$objPHPExcel->getActiveSheet()->getRowDimension(10)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A10:B10');
		$objPHPExcel->getActiveSheet()->mergeCells('C10:D10');
		$objPHPExcel->getActiveSheet()->mergeCells('E10:F10');
		$objPHPExcel->getActiveSheet()->mergeCells('G10:H10');
		$objPHPExcel->getActiveSheet()->setCellValue('A10', $info['contacts']);
		$objPHPExcel->getActiveSheet()->setCellValue('E10', $info['contacts_phone']);
		$objPHPExcel->getActiveSheet()->getStyle('A10:H10')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A10:H10')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A10:H10')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第十一行
		$objPHPExcel->getActiveSheet()->getRowDimension(11)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A11', '收费金额');
		$objPHPExcel->getActiveSheet()->setCellValue('B11', '元');
		$objPHPExcel->getActiveSheet()->mergeCells('C11:H11');
		$objPHPExcel->getActiveSheet()->setCellValue('C11', '预先缴纳定金       元，场地保证金       元');
		$objPHPExcel->getActiveSheet()->getStyle('A11:H11')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A11:H11')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A11:H11')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第十二行
		$objPHPExcel->getActiveSheet()->getRowDimension(12)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A12:D12');
		$objPHPExcel->getActiveSheet()->mergeCells('E12:H12');
		$objPHPExcel->getActiveSheet()->setCellValue('A12', '申请单位负责人意见:');
		$objPHPExcel->getActiveSheet()->setCellValue('E12', '运营部意见：');
		$objPHPExcel->getActiveSheet()->getStyle('A12:H12')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		$objPHPExcel->getActiveSheet()->getStyle('A12:H12')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A12:H12')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第十三行
		$objPHPExcel->getActiveSheet()->mergeCells('A13:D16');
		$objPHPExcel->getActiveSheet()->mergeCells('E13:H16');
		$objPHPExcel->getActiveSheet()->getStyle('A13:H16')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A13:H16')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A13:A19')->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('D13:D19')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('H13:H19')->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第十四行
		$objPHPExcel->getActiveSheet()->getRowDimension(17)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A17:D17');
		$objPHPExcel->getActiveSheet()->mergeCells('E17:H17');
		$objPHPExcel->getActiveSheet()->setCellValue('A17', '申请单位盖章：');
		$objPHPExcel->getActiveSheet()->setCellValue('E17', '部门负责人签字：');			
		$objPHPExcel->getActiveSheet()->getStyle('A17:H17')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A17:H17')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十五行
		$objPHPExcel->getActiveSheet()->mergeCells('A18:D18');
		$objPHPExcel->getActiveSheet()->mergeCells('E18:H18');
		$objPHPExcel->getActiveSheet()->getStyle('A18:H18')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A18:H18')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十六行
		$objPHPExcel->getActiveSheet()->getRowDimension(19)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A19:D19');
		$objPHPExcel->getActiveSheet()->mergeCells('E19:H19');
		$objPHPExcel->getActiveSheet()->setCellValue('A19', '日期：   年    月    日');
		$objPHPExcel->getActiveSheet()->setCellValue('E19', '日期：   年    月    日');
		$objPHPExcel->getActiveSheet()->getStyle('A19:H19')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A19:H19')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A19:H19')->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//最后四行
		$objPHPExcel->getActiveSheet()->getRowDimension(20)->setRowHeight(20);
		$objPHPExcel->getActiveSheet()->getRowDimension(21)->setRowHeight(20);
		$objPHPExcel->getActiveSheet()->getRowDimension(22)->setRowHeight(20);
		$objPHPExcel->getActiveSheet()->getRowDimension(23)->setRowHeight(20);
		$objPHPExcel->getActiveSheet()->mergeCells('A20:H20');
		$objPHPExcel->getActiveSheet()->mergeCells('A21:H21');
		$objPHPExcel->getActiveSheet()->mergeCells('A22:H22');
		$objPHPExcel->getActiveSheet()->mergeCells('A23:H23');
		$objPHPExcel->getActiveSheet()->setCellValue('A20', '备注：');
		$objPHPExcel->getActiveSheet()->setCellValue('A21', '1、租用场地包含会后清洁服务，但不包含纸、笔、茶水及人员服务；');
		$objPHPExcel->getActiveSheet()->setCellValue('A22', '2、请自备笔记本电脑,但需提前联系物业服务中心工程人员安装一软件方可使用；');
		$objPHPExcel->getActiveSheet()->setCellValue('A23', '3、请爱惜会议室设备，若有损坏照价赔偿');
		
		$objPHPExcel->getActiveSheet()->setTitle('创投大厦'.$room_type[$info['room_type']].'租用申请表');
		$objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$file_name='创投大厦'.$room_type[$info['room_type']].'租用申请表_'.date("YmdHis").".xlsx";
		header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$file_name.'"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
	}
}