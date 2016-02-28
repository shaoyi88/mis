<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 主页
	 */
	public function index()
	{
		$data = array();
		$data['userName'] = $this->userName;
		$data['menus'] = $this->config->item('menus');
		$data['admin_id'] = $this->userId;
		$this->load->model('MIS_Sys');
		$info = $this->MIS_Sys->getInfo();
		$defaultConfig = $this->config->item('default_sys_config');
		$data['website_title'] = isset($info['website_title']) && $info['website_title'] ? $info['website_title'] : $defaultConfig['website_title'];
		$data['website_copyright'] = isset($info['website_copyright']) && $info['website_copyright'] ? $info['website_copyright'] : $defaultConfig['website_copyright'];
		$data['website_record_no'] = isset($info['website_record_no']) && $info['website_record_no'] ? $info['website_record_no'] : $defaultConfig['website_record_no'];
		$this->showView('index', $data);
	}
	
	/**
	 * 
	 * 退出
	 */
	public function logout()
	{
		$this->session->sess_destroy();
		redirect(formatUrl('login/index'));
	}
	
	/**
	 * 
	 * 欢迎页面
	 */
	public function welcome()
	{
		$data = array();
		$this->load->model('MIS_Sys');
		$info = $this->MIS_Sys->getInfo();
		$defaultConfig = $this->config->item('default_sys_config');
		$data['website_title'] = isset($info['website_title']) && $info['website_title'] ? $info['website_title'] : $defaultConfig['website_title'];
		$data['userName'] = $this->userName;
		$this->showView('welcome', $data);
	}
}