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
		if(!$data['follow_by'] && $data['status'] == 1){
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
		$data['total'] = $info['rent_fee_unit_price']*$info['property_fee_num']+
						$info['property_fee_unit_price']*$info['property_fee_num']+
						$info['water_fee_unit_price']*$info['water_fee_num']+
						$info['elec_fee_unit_price']*$info['elec_fee_num'];
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
		$data = $this->input->post();
		$this->load->model('MIS_Fee');
		$info = $this->MIS_Fee->getInfoByEnterpriseAndDate($data['enterprise_id'], $data['fee_date']);
		if($data['fee_id']){
			if(checkRight('fee_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$msg = '';
			if(isset($info['fee_id']) && $info['fee_id'] != $data['fee_id']){
				$msg = '?msg='.urlencode('同一个企业同一个月份不能创建多份费用');
			}else{
				$this->MIS_Fee->update($data);
			}
		}else{
			if(checkRight('fee_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$msg = '';
			if(isset($info['fee_id'])){
				$msg = '?msg='.urlencode('同一个企业同一个月份不能创建多份费用');
			}else{
				$id = $this->MIS_Fee->add($data);
				if($id === FALSE){
					$msg = '?msg='.urlencode('创建失败');
				}
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
	
	/**
	 * 
	 * 导出缴费通知单（物管、水电费）
	 */
	public function export1()
	{
		$data = array();
		if(checkRight('fee_export') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Fee');
		$info = $this->MIS_Fee->getInfo($id);
		 //加载PHPExcel库
	   	require_once THIRD_PATH.'PHPExcel.php';
	   	require_once THIRD_PATH.'PHPExcel/IOFactory.php';
	   	$objPHPExcel = new PHPExcel();
	   	//列宽
		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(36);
		//第一行
		$objPHPExcel->getActiveSheet()->getRowDimension(1)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A1:G1');
		$objPHPExcel->getActiveSheet()->setCellValue('A1', '缴费通知单');
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(20);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1:G1')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第二行
		$objPHPExcel->getActiveSheet()->getRowDimension(2)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A2:D2');
		$objPHPExcel->getActiveSheet()->setCellValue('A2', '公司名称：'.$info['enterprise_name']);
		$objPHPExcel->getActiveSheet()->getStyle('A2:D2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('A2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		$objPHPExcel->getActiveSheet()->getStyle('A2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->mergeCells('E2:G2');
		$objPHPExcel->getActiveSheet()->setCellValue('E2', '编号：物管、水电费-'.date('Y-m',$info['fee_date']));
		$objPHPExcel->getActiveSheet()->getStyle('E2:G2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('E2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
		$objPHPExcel->getActiveSheet()->getStyle('E2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第三行
		$objPHPExcel->getActiveSheet()->getRowDimension(3)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A3:G3');
		$objPHPExcel->getActiveSheet()->setCellValue('A3', '你好！贵单位在创投大厦     层    号房物管、水电费缴费明细如下：');
		$objPHPExcel->getActiveSheet()->getStyle('A3')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		$objPHPExcel->getActiveSheet()->getStyle('A3')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A3:G3')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第四行
		$objPHPExcel->getActiveSheet()->getRowDimension(4)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A4', '缴费类别');
		$objPHPExcel->getActiveSheet()->mergeCells('B4:C4');
		$objPHPExcel->getActiveSheet()->setCellValue('B4', '租户期间');
		$objPHPExcel->getActiveSheet()->setCellValue('D4', '计租面积（m²）');
		$objPHPExcel->getActiveSheet()->setCellValue('E4', '单价（元）');
		$objPHPExcel->getActiveSheet()->setCellValue('F4', '费用（元）');
		$objPHPExcel->getActiveSheet()->setCellValue('G4', '备注');
		$objPHPExcel->getActiveSheet()->getStyle('A4:G4')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A4:G4')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A4:G4')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第五行
		$objPHPExcel->getActiveSheet()->getRowDimension(5)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A5', '物管费');
		$objPHPExcel->getActiveSheet()->mergeCells('B5:C5');
		$objPHPExcel->getActiveSheet()->setCellValue('B5', date('Y年n月',$info['fee_date']));
		$objPHPExcel->getActiveSheet()->setCellValue('D5', $info['property_fee_num']);
		$objPHPExcel->getActiveSheet()->setCellValue('E5', $info['property_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->setCellValue('F5', $info['property_fee_num']*$info['property_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->getStyle('A5:G5')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A5:G5')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A5:G5')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第六行
		$objPHPExcel->getActiveSheet()->mergeCells('A6:G6');
		$objPHPExcel->getActiveSheet()->getStyle('A6:G6')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第七行
		$objPHPExcel->getActiveSheet()->getRowDimension(7)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A7', '缴费类别');
		$objPHPExcel->getActiveSheet()->setCellValue('B7', '上期读数');
		$objPHPExcel->getActiveSheet()->setCellValue('C7', '本期读数');
		$objPHPExcel->getActiveSheet()->setCellValue('D7', '计费数量（吨/度）');
		$objPHPExcel->getActiveSheet()->setCellValue('E7', '单价（元）');
		$objPHPExcel->getActiveSheet()->setCellValue('F7', '费用（元）');
		$objPHPExcel->getActiveSheet()->getStyle('A7:G7')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A7:G7')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A7:G7')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第八行
		$objPHPExcel->getActiveSheet()->getRowDimension(8)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A8', date('n月份电费',$info['fee_date']));
		$objPHPExcel->getActiveSheet()->setCellValue('D8', $info['elec_fee_num']);
		$objPHPExcel->getActiveSheet()->setCellValue('E8', $info['elec_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->setCellValue('F8', $info['elec_fee_num']*$info['elec_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->getStyle('A8:G8')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A8:G8')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A8:G8')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第九行
		$objPHPExcel->getActiveSheet()->getRowDimension(9)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A9', date('n月份水费',$info['fee_date']));
		$objPHPExcel->getActiveSheet()->setCellValue('D9', $info['water_fee_num']);
		$objPHPExcel->getActiveSheet()->setCellValue('E9', $info['water_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->setCellValue('F9', $info['water_fee_num']*$info['water_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->getStyle('A9:G9')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A9:G9')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A9:G9')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第十行
		$objPHPExcel->getActiveSheet()->mergeCells('A10:G10');
		$objPHPExcel->getActiveSheet()->getStyle('A10:G10')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第十一行
		$objPHPExcel->getActiveSheet()->getRowDimension(11)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A11', '费用合计');
		$objPHPExcel->getActiveSheet()->mergeCells('B11:E11');
		$total = $info['property_fee_num']*$info['property_fee_unit_price']+$info['elec_fee_num']*$info['elec_fee_unit_price']+$info['water_fee_num']*$info['water_fee_unit_price'];
		$objPHPExcel->getActiveSheet()->setCellValue('B11', '（人民币大写）：'.cny($total));
		$objPHPExcel->getActiveSheet()->setCellValue('F11', '￥'.$total);
		$objPHPExcel->getActiveSheet()->getStyle('A11:G11')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A11:G11')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A11:G11')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('B11')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		//第十二行
		$objPHPExcel->getActiveSheet()->getRowDimension(12)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A12:G12');
		$objPHPExcel->getActiveSheet()->setCellValue('A12', '请贵单位在接到该缴费通知单后5个工作日内支付该款项，谢谢！');
		$objPHPExcel->getActiveSheet()->getStyle('A12')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十三行
		$objPHPExcel->getActiveSheet()->getRowDimension(13)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A13:G13');
		$objPHPExcel->getActiveSheet()->setCellValue('A13', '联系人：');
		$objPHPExcel->getActiveSheet()->getStyle('A13')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十四行
		$objPHPExcel->getActiveSheet()->getRowDimension(14)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A14:G14');
		$objPHPExcel->getActiveSheet()->setCellValue('A14', '联系电话：');
		$objPHPExcel->getActiveSheet()->getStyle('A14')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十五行
		$objPHPExcel->getActiveSheet()->getRowDimension(15)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('G15', date('Y年m月d日', time()));
		$objPHPExcel->getActiveSheet()->getStyle('G15')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十六行
		$objPHPExcel->getActiveSheet()->getRowDimension(16)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A16:G16');
		$objPHPExcel->getActiveSheet()->setCellValue('A16', '户 名：');
		$objPHPExcel->getActiveSheet()->getStyle('A16')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十七行
		$objPHPExcel->getActiveSheet()->getRowDimension(17)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A17:G17');
		$objPHPExcel->getActiveSheet()->setCellValue('A17', '账号：');
		$objPHPExcel->getActiveSheet()->getStyle('A17')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十八行
		$objPHPExcel->getActiveSheet()->getRowDimension(18)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A18:G18');
		$objPHPExcel->getActiveSheet()->setCellValue('A18', '行址：');
		$objPHPExcel->getActiveSheet()->getStyle('A18')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		
		$objPHPExcel->getActiveSheet()->setTitle('缴费通知单（物管、水电费）');
		$objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$file_name="缴费通知单（物管、水电费）_".date("YmdHis").".xlsx";
		header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$file_name.'"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
	}
	
	/**
	 * 
	 * 导出缴费通知单（租金）
	 */
	public function export2()
	{
		$data = array();
		if(checkRight('fee_export') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Fee');
		$info = $this->MIS_Fee->getInfo($id);
		//加载PHPExcel库
	   	require_once THIRD_PATH.'PHPExcel.php';
	   	require_once THIRD_PATH.'PHPExcel/IOFactory.php';
	   	$objPHPExcel = new PHPExcel();
	   	//列宽
		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(24);
		$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(36);
		//第一行
		$objPHPExcel->getActiveSheet()->getRowDimension(1)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A1:G1');
		$objPHPExcel->getActiveSheet()->setCellValue('A1', '缴费通知单');
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(20);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A1:G1')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第二行
		$objPHPExcel->getActiveSheet()->getRowDimension(2)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A2:D2');
		$objPHPExcel->getActiveSheet()->setCellValue('A2', '公司名称：'.$info['enterprise_name']);
		$objPHPExcel->getActiveSheet()->getStyle('A2:D2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('A2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		$objPHPExcel->getActiveSheet()->getStyle('A2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->mergeCells('E2:G2');
		$objPHPExcel->getActiveSheet()->setCellValue('E2', '编号：租金费用-'.date('Y-m',$info['fee_date']));
		$objPHPExcel->getActiveSheet()->getStyle('E2:G2')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('E2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
		$objPHPExcel->getActiveSheet()->getStyle('E2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第三行
		$objPHPExcel->getActiveSheet()->getRowDimension(3)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A3:G3');
		$objPHPExcel->getActiveSheet()->setCellValue('A3', '你好！贵单位在创投大厦     层    号房租金费用缴费明细如下：');
		$objPHPExcel->getActiveSheet()->getStyle('A3')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		$objPHPExcel->getActiveSheet()->getStyle('A3')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A3:G3')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第四行
		$objPHPExcel->getActiveSheet()->getRowDimension(4)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A4', '缴费类别');
		$objPHPExcel->getActiveSheet()->mergeCells('B4:C4');
		$objPHPExcel->getActiveSheet()->setCellValue('B4', '租户期间');
		$objPHPExcel->getActiveSheet()->setCellValue('D4', '计租面积（m²）');
		$objPHPExcel->getActiveSheet()->setCellValue('E4', '单价（元）');
		$objPHPExcel->getActiveSheet()->setCellValue('F4', '费用（元）');
		$objPHPExcel->getActiveSheet()->setCellValue('G4', '备注');
		$objPHPExcel->getActiveSheet()->getStyle('A4:G4')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A4:G4')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A4:G4')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第五行
		$objPHPExcel->getActiveSheet()->getRowDimension(5)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A5', '租金');
		$objPHPExcel->getActiveSheet()->mergeCells('B5:C5');
		$objPHPExcel->getActiveSheet()->setCellValue('B5', date('Y年n月',$info['fee_date']));
		$objPHPExcel->getActiveSheet()->setCellValue('D5', $info['property_fee_num']);
		$objPHPExcel->getActiveSheet()->setCellValue('E5', $info['rent_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->setCellValue('F5', $info['property_fee_num']*$info['rent_fee_unit_price']);
		$objPHPExcel->getActiveSheet()->getStyle('A5:G5')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A5:G5')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A5:G5')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		//第六行
		$objPHPExcel->getActiveSheet()->getRowDimension(6)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('A6', '费用合计');
		$objPHPExcel->getActiveSheet()->mergeCells('B6:E6');
		$total = $info['property_fee_num']*$info['rent_fee_unit_price'];
		$objPHPExcel->getActiveSheet()->setCellValue('B6', '（人民币大写）：'.cny($total));
		$objPHPExcel->getActiveSheet()->setCellValue('F6', '￥'.$total);
		$objPHPExcel->getActiveSheet()->getStyle('A6:G6')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A6:G6')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		$objPHPExcel->getActiveSheet()->getStyle('A6:G6')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
		$objPHPExcel->getActiveSheet()->getStyle('B6')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		//第七行
		$objPHPExcel->getActiveSheet()->getRowDimension(7)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A7:G7');
		$objPHPExcel->getActiveSheet()->setCellValue('A7', '请贵单位在接到该缴费通知单后5个工作日内支付该款项，谢谢！');
		$objPHPExcel->getActiveSheet()->getStyle('A7')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第八行
		$objPHPExcel->getActiveSheet()->getRowDimension(8)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A8:G8');
		$objPHPExcel->getActiveSheet()->setCellValue('A8', '联系人：');
		$objPHPExcel->getActiveSheet()->getStyle('A8')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第九行
		$objPHPExcel->getActiveSheet()->getRowDimension(9)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A9:G9');
		$objPHPExcel->getActiveSheet()->setCellValue('A9', '联系电话：');
		$objPHPExcel->getActiveSheet()->getStyle('A9')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十行
		$objPHPExcel->getActiveSheet()->getRowDimension(10)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->setCellValue('G10', date('Y年m月d日', time()));
		$objPHPExcel->getActiveSheet()->getStyle('G10')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十一行
		$objPHPExcel->getActiveSheet()->getRowDimension(11)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A11:G11');
		$objPHPExcel->getActiveSheet()->setCellValue('A11', '户 名：');
		$objPHPExcel->getActiveSheet()->getStyle('A11')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十二行
		$objPHPExcel->getActiveSheet()->getRowDimension(12)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A12:G12');
		$objPHPExcel->getActiveSheet()->setCellValue('A12', '账号：');
		$objPHPExcel->getActiveSheet()->getStyle('A12')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		//第十三行
		$objPHPExcel->getActiveSheet()->getRowDimension(13)->setRowHeight(30);
		$objPHPExcel->getActiveSheet()->mergeCells('A13:G13');
		$objPHPExcel->getActiveSheet()->setCellValue('A13', '行址：');
		$objPHPExcel->getActiveSheet()->getStyle('A13')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		
		$objPHPExcel->getActiveSheet()->setTitle('缴费通知单（租金）');
		$objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$file_name="缴费通知单（租金）_".date("YmdHis").".xlsx";
		header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$file_name.'"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
	}
}