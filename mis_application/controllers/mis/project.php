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
	 * 项目需求列表
	 */
	public function index()
	{
		$data = array();
		if(checkRight('project_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Apply');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('project/index').'?', $this->MIS_Apply->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Apply->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['apply_status'] = $this->config->item('project_apply_status');
		$data['apply_type'] = $this->config->item('apply_type');
		$data['userId'] = $this->userId;
		//获取可跟进用户
		$this->load->model('MIS_Admin');
		$adminList = array();
		$list = $this->MIS_Admin->getAll();
		foreach($list as $item){
			if($item['admin_role'] == 0){
				$adminList[] = $item;
			}else{
				$rightsArr = explode(',', $item['role_rights']);
				if(in_array('project_apply_confirm', $rightsArr)){
					$adminList[] = $item;
				}
			}
		}
		$data['adminList'] = $adminList;
		$this->showView('projectList', $data);
	}
	
	/**
	 * 
	 * 确认申请
	 */
	public function doConfirmApply()
	{
		$data = $this->input->post();
		if(!$data['follow_by'] && checkRight('project_apply_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('project_apply_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if(!$data['follow_by']){
			$data['status'] = 1;
		}
		$this->load->model('MIS_Apply');
		$msg = '';
		$this->MIS_Apply->update($data);
		redirect(formatUrl('project/index'));
	}
}