<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class incubator extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 * 
	 * 孵化器主页
	 */
	public function index()
	{
		$data = array();
		$this->showView('incubator', $data);
	}
	
}