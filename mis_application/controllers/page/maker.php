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
	
}