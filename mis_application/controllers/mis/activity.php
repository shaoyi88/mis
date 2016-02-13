<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Activity extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 园区活动首页
	 */
	public function index()
	{
		$data = array();
		if(checkRight('activity_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->showView('activityList', $data);
	}
}