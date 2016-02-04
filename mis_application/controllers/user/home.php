<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkUserLogin();
	}
	
	/**
	 * 
	 * 主页
	 */
	public function index()
	{
		$data = array();
		echo '用户中心';
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
}