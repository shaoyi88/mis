<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class activity extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 *
	 * 活动首页
	 */
	public function index()
	{
		$data = array();
		$this->load->model('MIS_Activity');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('activity/index').'?', $this->MIS_Activity->getCount(array()), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Article->getList(array(), $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('activity', $data);
	}
	
	/**
	 * 
	 * 活动详情
	 */
	public function info()
	{
		$data = array();
		$this->load->model('MIS_Activity');
		$id = $this->input->get('id');
		$data['activityInfo'] = $this->MIS_Activity->getInfo($id);
		$type = '';
		$data['list'] = $this->MIS_Article->getList(array(), 0, 10);
		$data['nav'] = 0;
		$data['layoutName'] = 'lwLayout';
		$this->showView('activitynnfo', $data);
	}
	
}