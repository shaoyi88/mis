<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Investment extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 申请列表
	 */
	public function apply()
	{
		$data = array();
		if(checkRight('apply_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Apply');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('investment/apply').'?', $this->MIS_Apply->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Apply->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['apply_status'] = $this->config->item('apply_status');
		$data['apply_type'] = $this->config->item('apply_type');
		$this->showView('applyList', $data);
	}	
	
	/**
	 * 
	 * 申请确认
	 */
	public function applyConfirm()
	{
		$data = array();
		if(checkRight('apply_confirm') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->get();
		$this->load->model('MIS_Apply');
		$msg = '';
		$this->MIS_Apply->update($data);
		redirect(formatUrl('investment/apply'));
	}
	
	/**
	 * 
	 * 流程列表
	 */
	public function flow()
	{
		$data = array();
		if(checkRight('flow_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Flow');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('investment/flow').'?', $this->MIS_Flow->getCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Flow->getList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('flowList', $data);
	}	
	
	/**
	 * 
	 * 添加编辑流程
	 */
	public function addFlow()
	{
		$data = array();
		if($this->input->get('did')){
			if(checkRight('flow_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$did = $this->input->get('did');
			$this->load->model('MIS_Flow');
			$data['info'] = $this->MIS_Flow->getInfo($did);
			$data['stepInfo'] = $this->MIS_Flow->getStepInfo($did);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('flow_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('flowAdd', $data);
	}
	
	/**
	 * 
	 * 添加编辑逻辑
	 */
	public function doAddFlow()
	{
		$data = array();
		$this->load->model('MIS_Flow');
		if($this->input->post('flow_id')){
			if(checkRight('flow_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$updateData = array();
			$updateData['flow_id'] = $data['flow_id'];
			$updateData['flow_name'] = $data['flow_name'];
			$updateData['is_default'] = $data['is_default'];
			$id = $this->MIS_Flow->update($updateData);
			if($updateData['is_default'] == 1){
				// 更新其他流程
				$this->MIS_Flow->unsetDefaultFlow($data['flow_id']);
			}
			// 删除原步骤
			$this->MIS_Flow->delStep($data['flow_id']);
			// 添加新步骤
			$stepList = array();
			foreach($data['step_content'] as $step){
				$tmp = array();
				$tmp['flow_id'] = $data['flow_id'];
				$tmp['step_content'] = $step;
				$stepList[] = $tmp;
			}
			$this->MIS_Flow->addStep($stepList);
		}else{
			if(checkRight('flow_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$addData = array();
			$addData['flow_name'] = $data['flow_name'];
			$addData['is_default'] = $data['is_default'];
			$addData['add_time'] = time();
			$id = $this->MIS_Flow->add($addData);
			if($addData['is_default'] == 1){
				// 更新其他流程
				$this->MIS_Flow->unsetDefaultFlow($id);
			}
			$stepList = array();
			foreach($data['step_content'] as $step){
				$tmp = array();
				$tmp['flow_id'] = $id;
				$tmp['step_content'] = $step;
				$stepList[] = $tmp;
			}
			$this->MIS_Flow->addStep($stepList);
		}
		redirect(formatUrl('investment/flow'));
	}
	
	/**
	 * 
	 * 删除流程
	 */
	public function doDelFlow()
	{
		$data = array();
		if(checkRight('flow_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Flow');
		$this->MIS_Flow->del($id);
		$this->MIS_Flow->delStep($id);
		redirect(formatUrl('investment/flow'));
	}
	
	public function flowDetail()
	{
		$data = array();
		if(checkRight('flow_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Flow');
		$did = $this->input->get('did');
		$data['info'] = $this->MIS_Flow->getInfo($did);
		$data['stepInfo'] = $this->MIS_Flow->getStepInfo($did);
		$this->showView('flowDetail', $data);
	}
	
	/**
	 *
	 * 潜在客户列表
	 */
	public function potential()
	{
		$data = array();
		if(checkRight('potential_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_EnterprisePotential');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('investment/potential').'?', $this->MIS_EnterprisePotential->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_EnterprisePotential->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$this->showView('potentialList', $data);
	}
	/**
	 *
	 * 潜在客户详情
	 */
	public function potentialDetail()
	{
		$data = array();
		if(checkRight('potential_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_EnterprisePotential');
		if(is_numeric($this->input->get('id'))){
			$data['id'] = $this->input->get('id');			
			$data['info'] = $this->MIS_EnterprisePotential->getInfo($data['id']);
			$this->showView('potentialDetail', $data);
		}else{
			redirect(formatUrl('investment/potential'));
		}
	}
}