<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends MIS_Controller
{
	protected function initialize()
	{
		parent::initialize();
		checkUserLogin();
	}

	/**
	 *
	 * 登录页面
	 */
	public function index()
	{
		$data = array();
		echo '用户登录页面';
	}
}