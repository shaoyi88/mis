<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends MIS_Controller
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}

	/**
	 *
	 * 登录页面
	 */
	public function index()
	{
		$data = array();
		if($this->input->get('msg')){
			$data['msg'] =  $this->input->get('msg');
		}
		$data['layout'] = FALSE; //不使用layout文件
		$this->load->model('MIS_Sys');
		$info = $this->MIS_Sys->getInfo();
		$defaultConfig = $this->config->item('default_sys_config');
		$data['website_title'] = isset($info['website_title']) && $info['website_title'] ? $info['website_title'] : $defaultConfig['website_title'];
		$data['website_copyright'] = isset($info['website_copyright']) && $info['website_copyright'] ? $info['website_copyright'] : $defaultConfig['website_copyright'];
		$data['website_record_no'] = isset($info['website_record_no']) && $info['website_record_no'] ? $info['website_record_no'] : $defaultConfig['website_record_no'];
		$this->showView('login', $data);
	}

	/**
	 *
	 * 登录处理
	 */
	public function actionLogin()
	{
		if(($userAccount = $this->input->post('userAccount', TRUE)) === FALSE){
			redirect(formatUrl('login/index?msg='.urlencode('请填写账户')));
		}
		if(($userPassword = $this->input->post('userPassword', TRUE)) === FALSE){
			redirect(formatUrl('login/index?msg='.urlencode('请填写密码')));
		}
		$this->load->model('MIS_Admin');
		if(($adminInfo = $this->MIS_Admin->checkAdmin($userAccount, $userPassword)) === FALSE){
			redirect(formatUrl('login/index?msg='.urlencode('账户或密码错误')));
		}
		
		$info = array(
			'admin_id' => $adminInfo['admin_id'],
			'admin_name' => $adminInfo['admin_name']
		);
		if($adminInfo['admin_role'] == 0){
			$info['admin_role'] = 0;
			$info['admin_rights'] = 'all';
		}else{
			$this->load->model('MIS_Admin');
			$roleInfo = $this->MIS_Admin->getInfo($adminInfo['admin_role']);
			$info['admin_role'] = $adminInfo['admin_role'];
			$info['admin_rights'] = $roleInfo['role_rights'];
		}
		$this->session->set_userdata($info);
		redirect(formatUrl('home/index'));
	}
}