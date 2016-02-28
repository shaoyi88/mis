<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sys extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	public function index()
	{
		$data = array();
		if(checkRight('sys_config') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Sys');
		$info = $this->MIS_Sys->getInfo();
		if(!empty($info)){
			$data['info'] = $info;
		}
		$this->showView('sysConfig', $data);
	}
	
	public function doConfig()
	{
		$data = array();
		if(checkRight('sys_config') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Sys');
		$data = $this->input->post();
		if($data['sys_id']){
			$this->MIS_Sys->update($data);
		}else{
			$this->MIS_Sys->add($data);
		}
		redirect(formatUrl('sys/index'));
	}
}