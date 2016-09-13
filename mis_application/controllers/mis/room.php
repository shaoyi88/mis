<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Room extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 房间列表
	 */
	public function roomList()
	{
		$data = array();
		if(checkRight('room_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Room');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('room/roomList').'?t='.$keyword['t'], $this->MIS_Room->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Room->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['room_type'] = $this->config->item('room_type');
		$this->showView('roomList', $data);
	}
	
	/**
	 * 
	 * 导出会议室使用情况
	 */
	public function export()
	{
		$data = array();
		if(checkRight('room_used_export') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Room');
		$t = $this->input->get('t');
		$info = $this->MIS_Room->getUsedList($t);
		$room_type = $this->config->item('room_type');
		//加载PHPExcel库
	   	require_once THIRD_PATH.'PHPExcel.php';
	   	require_once THIRD_PATH.'PHPExcel/IOFactory.php';
	   	$objPHPExcel = new PHPExcel();
		//列宽
		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(12);
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(36);
		//第一行
		$objPHPExcel->getActiveSheet()->getRowDimension(1)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A1:H1');
		$objPHPExcel->getActiveSheet()->setCellValue('A1', '创投大厦'.$room_type[$t].'使用情况登记表');
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(20);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1:H1')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第二行
		$objPHPExcel->getActiveSheet()->getRowDimension(2)->setRowHeight(20);
		$objPHPExcel->getActiveSheet()->setCellValue('A2', '序号');
		$objPHPExcel->getActiveSheet()->setCellValue('B2', '日期	');
		$objPHPExcel->getActiveSheet()->setCellValue('C2', '使用单位');
		$objPHPExcel->getActiveSheet()->setCellValue('D2', '使用前电量');
		$objPHPExcel->getActiveSheet()->setCellValue('E2', '使用后电量');
		$objPHPExcel->getActiveSheet()->setCellValue('F2', '使用电量');
		$objPHPExcel->getActiveSheet()->setCellValue('G2', '会议时长');
		$objPHPExcel->getActiveSheet()->setCellValue('H2', '备注');
		$objPHPExcel->getActiveSheet()->getStyle('A2:H2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A2:H2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A2:H2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$n = 3;
		foreach($info as $k=>$item){
			$objPHPExcel->getActiveSheet()->getRowDimension($n)->setRowHeight(20);
			$objPHPExcel->getActiveSheet()->setCellValue('A'.$n, $k+1);
			$objPHPExcel->getActiveSheet()->setCellValue('B'.$n, date('Y年m月d日', $item['start_time']));
			$objPHPExcel->getActiveSheet()->setCellValue('C'.$n, $item['enterprise_name']);
			$objPHPExcel->getActiveSheet()->setCellValue('G'.$n, (($item['end_time']-$item['start_time'])/3600).'小时');
			$objPHPExcel->getActiveSheet()->getStyle("A$n:H$n")->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
			$objPHPExcel->getActiveSheet()->getStyle("A$n:H$n")->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			$objPHPExcel->getActiveSheet()->getStyle("A$n:H$n")->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
			$n++;
		}
		$objPHPExcel->getActiveSheet()->setTitle($room_type[$t].'使用情况登记表');
		$objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$file_name=$room_type[$t]."使用情况登记表_".date("YmdHis").".xlsx";
		header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$file_name.'"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
	}
	
	/**
	 * 
	 * 房间添加/编辑
	 */
	public function add()
	{
		$data = array();
		$data['room_type'] = $this->config->item('room_type');
		$data['t'] = $this->input->get('t');
		if($this->input->get('did')){
			if(checkRight('room_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$did = $this->input->get('did');
			$this->load->model('MIS_Room');
			$data['info'] = $this->MIS_Room->getInfo($did);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('room_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('roomAdd', $data);
	}
	
	/**
	 * 
	 * 房间添加/编辑逻辑
	 */
	public function doAdd()
	{
		$data = array();
		if($this->input->post('room_id')){
			if(checkRight('room_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Room');
			$msg = '';
			$this->MIS_Room->update($data);
		}else{
			if(checkRight('room_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Room');
			$msg = '';
			$id = $this->MIS_Room->add($data);
			if($id === FALSE){
				$msg = '&msg='.urlencode('创建失败');
			}
		}
		redirect(formatUrl('room/roomList?t='.$data['room_type'].$msg));
	}
	
	/**
     * 
     * 删除
     */
	public function doDel()
	{
		$data = array();
		if(checkRight('room_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$t = $this->input->get('t');
		$this->load->model('MIS_Room');
		$this->MIS_Room->del($id);
		$this->MIS_Room->delBooking($id);
		redirect(formatUrl('room/roomList?t=').$t);
	}
	
	/**
	 * 
	 * 详情
	 */
	public function detail()
	{
		$data = array();
		if(checkRight('room_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data['date'] = date('Y-m-d', time());
		if($this->input->get('date')){
			$data['date'] = $this->input->get('date');
		}
		$data['room_booking_status'] = $this->config->item('room_booking_status');
		$id = $this->input->get('did');
		$data['room_type'] = $this->config->item('room_type');
		$data['t'] = $this->input->get('t');
		$this->load->model('MIS_Room');
		$data['info'] = $this->MIS_Room->getInfo($id);
		$data['dataList'] = $this->MIS_Room->getBookingList($id, strtotime($data['date']." 00:00:00"), strtotime($data['date']." 23:59:59"));
		$this->showView('roomDetail', $data);
	}
	
	/**
	 * 
	 * 查看预订详情
	 */
	public function viewBooking()
	{
		$data = array();
		if(checkRight('room_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Room');
		$data['info'] = $this->MIS_Room->getBookingInfo($id);
		$bookingInfo = $this->MIS_Room->searchBookingByTime($data['info']['booking_id'], $data['info']['room_id'], $data['info']['start_time'], $data['info']['end_time']);
		$data['curBooking'] = $data['bookingList'] = array();
		foreach($bookingInfo as $info){
			if($info['status'] == 1){
				$data['curBooking'] = $info;
				break;
			}
			if($info['status'] == 0){
				$data['bookingList'][] = $info;
			}
		}
		$data['room_booking_status'] = $this->config->item('room_booking_status');
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
				if(in_array('room_booking_confirm', $rightsArr)){
					$adminList[] = $item;
				}
			}
		}
		$data['adminList'] = $adminList;
		$this->showView('roomBookingDetail', $data);
	}
	
	/**
	 * 
	 * 确认预订信息
	 */
	public function doConfirmBooking()
	{
		$data = $this->input->post();
		unset($data['file']);
		if(!$data['follow_by'] && checkRight('room_booking_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('room_booking_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Room');
		if(!$data['follow_by']){
			$info = $this->MIS_Room->getBookingInfo($data['booking_id']);
			$bookingInfo = $this->MIS_Room->searchBookingByTime($info['booking_id'], $info['room_id'], $info['start_time'], $info['end_time']);
			foreach($bookingInfo as $info){
				if($info['status'] == 1){
					redirect(formatUrl('room/viewBooking?id=').$data['booking_id'].'&msg='.urlencode('该时段已被预约'));
					exit;
				}
			}
		}		
		$this->MIS_Room->updateBooking($data);
		redirect(formatUrl('room/viewBooking?id=').$data['booking_id']);
	}
}