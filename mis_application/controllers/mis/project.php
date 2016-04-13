<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Project extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 项目列表
	 */
	public function index()
	{
		$data = array();
		if(checkRight('project_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Project');
		$offset = 0;
		$pageUrl = '';
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		page(formatUrl('project/index').'?', $this->MIS_Project->getCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Project->getList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('projectList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑项目需求
	 */
	public function add()
	{
		$data = array();
		if($this->input->get('did')){
			if(checkRight('project_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$id = $this->input->get('did');
			$this->load->model('MIS_Project');
			$data['info'] = $this->MIS_Project->getInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('project_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('projectAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑逻辑
	 */
	public function doAdd()
	{
		$data = array();
		if($this->input->post('project_id')){
			if(checkRight('project_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Project');
			$this->MIS_Project->update($data);
			redirect(formatUrl('project/index'));
		}else{
			if(checkRight('project_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['add_time'] = time();
			$this->load->model('MIS_Project');
			$msg = '';
			if($this->MIS_Project->add($data) === FALSE){
				$msg = '?msg='.urlencode('创建失败');
			}
			redirect(formatUrl('project/index'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除
	 */
	public function doDel()
	{
		$data = array();
		if(checkRight('project_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Project');
		$info = $this->MIS_Project->getApplyInfo($id);
		if(isset($info['apply_id'])){
			redirect(formatUrl('project/index?msg=').urlencode('该项目下已有用户进行申请，暂不可删除'));
		}else{
			$this->MIS_Project->del($id);
			redirect(formatUrl('project/index'));
		}
	}
	
	/**
	 * 
	 * 项目查看
	 */
	public function detail()
	{
		$data = array();
		if(checkRight('project_detail') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Project');
		$data['info'] = $this->MIS_Project->getInfo($id);
		$data['type'] = $this->input->get('type') ? $this->input->get('type') : 0;
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('project/detail?did='.$id.'&type=1').'&', $this->MIS_Project->getApplyCount($id), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Project->getApplyList($id, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['project_apply_status'] = $this->config->item('project_apply_status');
		$this->showView('projectDetail', $data);
	}
	
	/**
	 * 
	 * 确认申请
	 */
	public function doConfirmApply()
	{
		$data = array();
		if(checkRight('project_apply_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$project_id = $data['project_id'];
		unset($data['project_id']);
		$data['status'] = 1;
		$this->load->model('MIS_Project');
		$msg = '';
		$this->MIS_Project->updateApply($data);
		redirect(formatUrl('project/detail?did='.$project_id.'&type=1'));
	}
}