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
				'user_name' => $userInfo['user_nickname']
		);
		$this->session->set_userdata($info);
		redirect(formatUrl('myhome/index'));
	}
}