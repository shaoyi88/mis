<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Feedback extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 投诉建议列表
	 */
	public function index()
	{
		$data = array();
		if(checkRight('feedback_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Feedback');
		$keyword = array();
		if($this->input->get()){
			$keyword = $this->input->get();
		}
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('feedback/index').'?', $this->MIS_Feedback->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Feedback->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['feedback_type'] = $this->config->item('feedback_type');
		$data['feedback_status'] = $this->config->item('feedback_status');
		$this->showView('feedbackList', $data);
	}
	
	/**
	 * 
	 * 投诉建议详情
	 */
	public function detail()
	{
		$data = array();
		if(checkRight('feedback_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$did = $this->input->get('did');
		$this->load->model('MIS_Feedback');
		$data['info'] = $this->MIS_Feedback->getInfo($did);
		$data['feedback_type'] = $this->config->item('feedback_type');
		$data['feedback_status'] = $this->config->item('feedback_status');
		$this->showView('feedbackDetail', $data);
	}
	
	/**
	 * 
	 * 回复
	 */
	public function doReply()
	{
		$data = $this->input->post();
		if(checkRight('feedback_reply') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data['reply_time'] = strtotime('now');
		$data['admin_id'] = $this->userId; 
		$data['admin_name'] = $this->userName;
		$this->load->model('MIS_Feedback');
		$this->MIS_Feedback->addReply($data);
		$updateData = array();
		$updateData['feedback_id'] = $data['feedback_id'];
		$updateData['feedback_status'] = 1;
		$this->MIS_Feedback->update($updateData);
		redirect(formatUrl('feedback/index'));
	}
}