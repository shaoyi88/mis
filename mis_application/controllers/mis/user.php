<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 园区用户首页
	 */
	public function index()
	{
		$data = array();
		if(checkRight('user_list') === FALSE){
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
		page(formatUrl('admin/index').'?', $this->MIS_User->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_User->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['user_type'] = $this->config->item('user_type');
		$data['user_second_type'] = $this->config->item('user_second_type');		
		$this->showView('userList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑用户
	 */
	public function add()
	{
		$data = array();
		$data['user_type'] = $this->config->item('user_type');
		$data['user_second_type'] = $this->config->item('user_second_type');		
		if($this->input->get('id')){
			if(checkRight('user_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$id = $this->input->get('id');
			$this->load->model('MIS_User');
			$data['info'] = $this->MIS_User->getInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('user_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('userAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑逻辑
	 */
	public function doAdd()
	{
		$data = array();
		if($this->input->post('user_id')){
			if(checkRight('user_edit') === FALSE){
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
			redirect(formatUrl('user/index'));
		}else{
			if(checkRight('user_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['user_password'] = md5($data['user_password']);
			$data['reg_time'] = time();
			$data['user_audit_type'] = 0;
			$this->load->model('MIS_User');
			$msg = '';
			$userInfo = $this->MIS_User->queryUserByAccountPhone($data['user_account'], $data['user_phone']);
			if(empty($userInfo)){
				if($this->MIS_User->add($data) === FALSE){
					$msg = '&msg='.urlencode('创建失败');
				}
			}else{
				$msg = '&msg='.urlencode('该园区用户已存在，请勿重复新增');
			}
			redirect(formatUrl('user/index?'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除
	 */
	public function doDel()
	{
		$data = array();
		if(checkRight('user_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_User');
		$this->MIS_User->del($id);
		redirect(formatUrl('user/index'));
	}
}