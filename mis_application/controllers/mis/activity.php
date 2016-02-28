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
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		$this->load->model('MIS_Activity');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('activity/index').'?', $this->MIS_Activity->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Activity->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['activity_audit_type'] = $this->config->item('activity_audit_type');
		$data['admin_id'] = $this->userId;
		$this->showView('activityList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑活动
	 */
	public function add()
	{
		$data = array();
		if($this->input->get('id')){
			if(checkRight('activity_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$id = $this->input->get('id');
			$this->load->model('MIS_Activity');
			$data['info'] = $this->MIS_Activity->getInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('activity_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('activityAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑逻辑
	 */
	public function doAdd()
	{
		$data = array();
		if($this->input->post('activity_id')){
			if(checkRight('activity_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Activity');
			$this->MIS_Activity->update($data);
			redirect(formatUrl('activity/index'));
		}else{
			if(checkRight('activity_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['admin_id'] = $this->userId;
			$data['admin_name'] = $this->userName;
			$data['add_time'] = time();
			$data['activity_status'] = 1; //管理员创建活动默认通过
			$this->load->model('MIS_Activity');
			$msg = '';
			if($this->MIS_Activity->add($data) === FALSE){
				$msg = '&msg='.urlencode('创建失败');
			}
			redirect(formatUrl('activity/index?'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除
	 */
	public function doDel()
	{
		$data = array();
		if(checkRight('activity_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Activity');
		$this->MIS_Activity->del($id);
		
		redirect(formatUrl('activity/index'));
	}
	
	/**
	 * 
	 * 查看/审核
	 */
	public function detail()
	{
		$data = array();
		if(checkRight('activity_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data['activity_audit_type'] = $this->config->item('activity_audit_type');
		$data['type'] = $this->input->get('type');
		$id = $this->input->get('id');
		$this->load->model('MIS_Activity');
		//获取详情
		$data['info'] = $this->MIS_Activity->getInfo($id);
		//获取报名
		$registerOffset = 0;
		$registerPageUrl = '';
		page(formatUrl('activity/detail?type=1&id=').$id, $this->MIS_Activity->getRegisterCount(), PER_COUNT, $registerOffset, $registerPageUrl, 'reg_per_page');
		$registerList = $this->MIS_Activity->getRegisterList($registerOffset, PER_COUNT);
		$data['registerPageUrl'] = $registerPageUrl;
		$data['registerList'] = $registerList;
		//获取评论
		$commentOffset = 0;
		$commentPageUrl = '';
		page(formatUrl('activity/detail?type=2&id=').$id, $this->MIS_Activity->getCommentCount(), PER_COUNT, $commentOffset, $commentPageUrl, 'com_per_page');
		$commentList = $this->MIS_Activity->getCommentList($commentOffset, PER_COUNT);
		$data['commentPageUrl'] = $commentPageUrl;
		$data['commentList'] = $commentList;
		$this->showView('activityDetail', $data);
	}
	
	/**
	 * 
	 * 活动审核
	 */
	public function doAudit()
	{
		if(checkRight('activity_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$this->load->model('MIS_Activity');
		$this->MIS_Activity->update($data);
		redirect(formatUrl('activity/detail?id=').$data['activity_id']);
	}
	
	/**
	 * 
	 * 删除用户报名
	 */
	public function doDelRegister()
	{
		if(checkRight('activity_register_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$aid = $this->input->get('aid');
		$this->load->model('MIS_Activity');
		$this->MIS_Activity->delRegister($id);
		
		redirect(formatUrl('activity/detail?type=1&id=').$aid);
	}
	
	/**
	 * 
	 * 删除用户评论
	 */
	public function doDelComment()
	{
		if(checkRight('activity_comment_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		
		$id = $this->input->get('id');
		$aid = $this->input->get('aid');
		$this->load->model('MIS_Activity');
		$this->MIS_Activity->delComment($id);
		
		redirect(formatUrl('activity/detail?type=2&id=').$aid);
	}
}