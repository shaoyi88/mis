<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class maker extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 * 
	 * 易创客主页
	 */
	public function index()
	{
		$data = array();
		$this->showView('maker', $data);
	}
	
	/**
	 *
	 * 易创客详情介绍
	 */
	public function info()
	{
		$data = array();
		$this->showView('makerinfo', $data);
	}
	
	/**
	 *
	 * 易创客导师团队
	 */
	public function mentor()
	{
		$data = array();
		$this->showView('mentorlist', $data);
	}
	
}