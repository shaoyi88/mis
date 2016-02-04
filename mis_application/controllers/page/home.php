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
		$this->showView('index', $data);
	}
}