<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class enterprise extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 * 
	 * 企业风采主页
	 */
	public function index()
	{
		$data = array();
		$this->showView('enterprise', $data);
	}
	
}