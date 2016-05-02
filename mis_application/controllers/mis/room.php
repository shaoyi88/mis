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
		$id = $this->input->get('id');
		$this->load->model('MIS_Room');
		$data['info'] = $this->MIS_Room->getBookingInfo($id);
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
		if(!$data['follow_by'] && checkRight('room_booking_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('room_booking_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Room');
		$this->MIS_Room->updateBooking($data);
		redirect(formatUrl('room/viewBooking?id=').$data['booking_id']);
	}
}