<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Club extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 俱乐部会员列表
	 */
	public function userList()
	{
		$data = array();
		if(checkRight('club_userList') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		$this->load->model('MIS_User');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('club/userList').'?', $this->MIS_User->getCount(array('user_type'=>1)), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_User->getList(array('user_type'=>1), $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;	
		$this->showView('clubUserList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑俱乐部会员
	 */
	public function userAdd()
	{
		$data = array();
		if($this->input->get('id')){
			if(checkRight('club_userEdit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$id = $this->input->get('id');
			$this->load->model('MIS_User');
			$data['info'] = $this->MIS_User->getInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('club_userAdd') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('clubUserAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑俱乐部会员逻辑
	 */
	public function userDoAdd()
	{
		$data = array();
		if($this->input->post('user_id')){
			if(checkRight('club_userEdit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			if($data['user_password']){
        		$data['user_password'] = md5($data['user_password']);
        	}else{
        		unset($data['user_password']);
        	}
			$this->load->model('MIS_User');
			$this->MIS_User->update($data);
			redirect(formatUrl('club/userList'));
		}else{
			if(checkRight('club_userAdd') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['user_password'] = md5($data['user_password']);
			$data['reg_time'] = time();
			$this->load->model('MIS_User');
			$msg = '';
			$userInfo = $this->MIS_User->queryUserByAccountPhone($data['user_account'], $data['user_phone']);
			if(empty($userInfo)){
				if($this->MIS_User->add($data) === FALSE){
					$msg = '&msg='.urlencode('创建失败');
				}
			}else{
				$msg = '&msg='.urlencode('该俱乐部会员已存在，请勿重复新增');
			}
			redirect(formatUrl('club/userList?'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除俱乐部会员
	 */
	public function userDoDel()
	{
		$data = array();
		if(checkRight('club_userDel') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_User');
		$this->MIS_User->del($id);
		redirect(formatUrl('club/userList'));
	}
	
	/**
	 * 
	 * 俱乐部活动列表
	 */
	public function activityList()
	{
		$data = array();
		if(checkRight('club_activityList') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		$this->load->model('MIS_ClubActivity');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('club/activityList').'?', $this->MIS_ClubActivity->getCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_ClubActivity->getList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('clubActivityList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑活动
	 */
	public function activityAdd()
	{
		$data = array();
		if($this->input->get('id')){
			if(checkRight('club_activityEdit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$id = $this->input->get('id');
			$this->load->model('MIS_ClubActivity');
			$data['info'] = $this->MIS_ClubActivity->getInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('club_activityAdd') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('clubActivityAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑逻辑
	 */
	public function activityDoAdd()
	{
		$data = array();
		if($this->input->post('activity_id')){
			if(checkRight('club_activityEdit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_ClubActivity');
			$this->MIS_ClubActivity->update($data);
			redirect(formatUrl('club/activityList'));
		}else{
			if(checkRight('club_activityAdd') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['admin_id'] = $this->userId;
			$data['admin_name'] = $this->userName;
			$data['add_time'] = time();
			$this->load->model('MIS_ClubActivity');
			$msg = '';
			if($this->MIS_ClubActivity->add($data) === FALSE){
				$msg = '&msg='.urlencode('创建失败');
			}
			redirect(formatUrl('club/activityList?'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除
	 */
	public function activityDoDel()
	{
		$data = array();
		if(checkRight('club_activityDel') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_ClubActivity');
		$this->MIS_ClubActivity->del($id);
		
		redirect(formatUrl('club/activityList'));
	}
	
	/**
	 * 
	 * 查看
	 */
	public function activityDetail()
	{
		$data = array();
		if(checkRight('club_activityList') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_ClubActivity');
		//获取详情
		$data['info'] = $this->MIS_ClubActivity->getInfo($id);
		$this->showView('clubActivityDetail', $data);
	}
	
	/**
	 * 
	 * 俱乐部产品列表
	 */
	public function productList()
	{
		$data = array();
		if(checkRight('club_productList') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		$this->load->model('MIS_ClubProduct');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('club/productList').'?', $this->MIS_ClubProduct->getCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_ClubProduct->getList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('clubProductList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑产品
	 */
	public function productAdd()
	{
		$data = array();
		if($this->input->get('id')){
			if(checkRight('club_productEdit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$id = $this->input->get('id');
			$this->load->model('MIS_ClubProduct');
			$data['info'] = $this->MIS_ClubProduct->getInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('club_productAdd') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('clubProductAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑产品逻辑
	 */
	public function productDoAdd()
	{
		$data = array();
		if($this->input->post('product_id')){
			if(checkRight('club_productEdit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_ClubProduct');
			$this->MIS_ClubProduct->update($data);
			redirect(formatUrl('club/productList'));
		}else{
			if(checkRight('club_productAdd') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['admin_id'] = $this->userId;
			$data['admin_name'] = $this->userName;
			$data['add_time'] = time();
			$this->load->model('MIS_ClubProduct');
			$msg = '';
			if($this->MIS_ClubProduct->add($data) === FALSE){
				$msg = '&msg='.urlencode('创建失败');
			}
			redirect(formatUrl('club/productList?'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除
	 */
	public function productDoDel()
	{
		$data = array();
		if(checkRight('club_productDel') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_ClubProduct');
		$this->MIS_ClubProduct->del($id);
		
		redirect(formatUrl('club/productList'));
	}
	
	/**
	 * 
	 * 查看
	 */
	public function productDetail()
	{
		$data = array();
		if(checkRight('club_productList') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_ClubProduct');
		//获取详情
		$data['info'] = $this->MIS_ClubProduct->getInfo($id);
		$this->showView('clubProductDetail', $data);
	}
}