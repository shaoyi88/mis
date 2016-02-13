<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Netdisk extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 文档管理首页
	 */
	public function index()
	{
		$data = array();
		if(checkRight('dir_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->showView('dirList', $data);
	}
}