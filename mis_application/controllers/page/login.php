<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class login extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkUserLogin();
	}
	
	/**
	 * 
	 * 登录页
	 */
	public function index()
	{
		$data = array();
        $data['msg'] = $this->input->get('msg');
        $data['layout'] = FALSE;
		$this->showView('login', $data);
	}
	
	
	/**
	 *
	 * 登录处理
	 */
	public function actionLogin(){
		if(($userAccount = $this->input->post('user_login', TRUE)) == FALSE){
			redirect(formatUrl('login/index?msg='.urlencode('请填写账户')));
		}		
		if(($userPassword = $this->input->post('user_password', TRUE)) == FALSE){
			redirect(formatUrl('login/index?msg='.urlencode('请填写密码')));
		}
		$this->load->model('MIS_User');
		if(($userInfo = $this->MIS_User->checkUser($userAccount, $userPassword)) === FALSE){
			redirect(formatUrl('login/index?msg='.urlencode('账户或密码错误')));
		}
		$info = array(
				'user_id' => $userInfo['user_id'],
				'user_name' => $userInfo['user_nickname']?$userInfo['user_nickname']:$userInfo['user_name'],
				'user_type' => $userInfo['user_type'],
		);
		$this->session->set_userdata($info);
		redirect(formatUrl('myhome/index'));
	}
	
	/**
	 *
	 * ajax登录处理
	 */
	public function ajaxLogin(){
		$data = array();
		$data['status'] = 0;
		if(($userAccount = $this->input->post('user_login', TRUE)) == FALSE){
			$data['error'] = '请填写账号';
			$this->send_json($data);
		}
		if(($userPassword = $this->input->post('user_password', TRUE)) == FALSE){
			$data['error'] = '请填写密码';
			$this->send_json($data);
		}
		$this->load->model('MIS_User');
		if(($userInfo = $this->MIS_User->checkUser($userAccount, $userPassword)) === FALSE){
			$data['error'] = '账户或密码错误';
			$this->send_json($data);
		}
		$info = array(
				'user_id' => $userInfo['user_id'],
				'user_name' => $userInfo['user_nickname'],
				'user_type' => $userInfo['user_type'],
		);
		$this->session->set_userdata($info);
		$data['status'] = 1;
		$this->send_json($data);
	}
		
}