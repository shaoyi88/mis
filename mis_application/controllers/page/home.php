<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class home extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 * 
	 * 主页
	 */
	public function index()
	{
		$data = array();
		$this->load->model('MIS_Enterprise');
		$data['elogo'] = $this->MIS_Enterprise->getLogo();
		$data['layoutName'] = 'lwLayout';
		$data['nav'] = 1;
		$this->showView('index', $data);
	}
	
	/**
	 *
	 * 简介
	 */
	public function zs()
	{
		$data = array();
		$data['nav'] = 2;
		$data['layoutName'] = 'lwLayout';
		$this->showView('rycenter', $data);
	}
	
	/**
	 *
	 * 联系我们
	 */
	public function contact()
	{
		$data = array();
		$data['layoutName'] = 'lwLayout';
		$data['nav'] = 6;
		$this->showView('contact', $data);
	}
	
	/**
	 *
	 * 易创客
	 */
	public function maker()
	{
		$data = array();
		$data['layoutName'] = 'lwLayout';
		$data['nav'] = 4;
		$this->showView('maker', $data);
	}
	
	/**
	 *
	 * 退出
	 */
	public function logout()
	{
		$this->session->sess_destroy();
		redirect(formatUrl('home/index'));
	}
	
	/**
	 *
	 * 投诉建议
	 */
	public function advice()
	{
		checkUserLogin();
		$data = array();
		$data['msg'] = $this->input->get('msg');
		$data['feedback_type'] = $this->config->item('feedback_type');
		$this->showView('advice', $data);
	}
	
	/**
	 *
	 * 投诉建议do
	 */
	public function do_advice()
	{
		checkUserLogin();
		$data = array();
		$data = $this->input->post();
		$this->load->model('MIS_Feedback');
		$data['user_id'] = $this->userId;
		$this->load->model('MIS_User');
		$userInfo = $this->MIS_User->getInfo($data['user_id']);
		$data['user_name'] = $userInfo['user_name'];
		$data['add_time'] = time();
		$this->MIS_Feedback->add($data);
		redirect(formatUrl('home/index'));
	}
	
	/**
	 *
	 * 注册页
	 */
	public function register()
	{
		if($this->userId){
			redirect(formatUrl('home/index'));
		}else{
			$data = array();
			$data['msg'] = $this->input->get('msg');
			$data['uri'] = $this->input->get('uri');
			$data['layoutName'] = 'nlwLayout';
		    $data['nav'] = 0;
		    $data['headTitle'] = '注册';
			$this->showView('register', $data);
		}
	}
	
	
	/**
	 *
	 * 注册处理
	 */
	public function doRegister(){
		if($this->userId){
			redirect(formatUrl('home/index'));
		}else{
			if(($data['user_account'] = $this->input->post('user_account', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请填写账户')));
			}
			if(($data['user_name'] = $this->input->post('user_name', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请填写姓名')));
			}
			if(($data['user_password'] = $this->input->post('user_password', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请填写密码')));
			}
			if(($userPasswordRe = $this->input->post('user_password_re', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请确认密码密码')));
			}
			if($data['user_password']!=$userPasswordRe){
				redirect(formatUrl('home/register?msg='.urlencode('两次输入密码不相同')));
			}
			$data['user_password'] = md5($data['user_password']);
			$data['reg_time'] = time();
			$data['user_type'] = 0;
			$this->load->model('MIS_User');
			if($uid=$this->MIS_User->add($data)){ 
				$info = array(
						'user_id' => $uid,
						'user_name' => $data['user_name'],
						'user_type' => $data['user_type'],
				);
				$this->session->set_userdata($info);
				redirect(formatUrl('myhome/index'));
			}else{
				redirect(formatUrl('home/register?msg='.urlencode('注册失败')));
			}
		}
	}
	
	/**
	 *
	 * 检查账号重复
	 */
	public function checkAccount(){
		$data = array();
		$account = $this->input->get('account');
		$this->load->model('MIS_User');
		$data['status'] = 1;
		if($this->MIS_User->getInfoByName(trim($account))){
			$data['status'] = 0;
		}
		$this->send_json($data);
	}
}