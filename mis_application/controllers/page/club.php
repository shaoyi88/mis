<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class club extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 * 
	 * 投资人俱乐部主页
	 */
	public function index()
	{
		$data = array();
		$this->showView('club', $data);
	}
	
}