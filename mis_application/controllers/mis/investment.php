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
	 * 投资申请列表
	 */
	public function index(){
		$data = array();
		if(checkRight('project_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Invest');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('investment/index').'?', $this->MIS_Invest->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Invest->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['invest_status'] = $this->config->item('invest_apply_status');
		$this->showView('investList', $data);
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
		$this->load->model('MIS_EnterprisePotential');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('investment/potential').'?', $this->MIS_EnterprisePotential->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_EnterprisePotential->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$this->showView('applyList', $data);
	}	
	
	/**
	 *
	 * 潜在客户详情
	 */
	public function applyDetail()
	{
		$data = array();
		if(checkRight('apply_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_EnterprisePotential');
		if(is_numeric($this->input->get('id'))){
			$data['id'] = $this->input->get('id');			
			$data['info'] = $this->MIS_EnterprisePotential->getInfo($data['id']);
			if($data['info']['deal_status']>1){
				$data['approval'] = $this->MIS_EnterprisePotential->getApprovalInfo($data['id']);
			}
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
					if(in_array('apply_audit', $rightsArr)){
						$adminList[] = $item;
					}
				}
			}
			$data['adminList'] = $adminList;
			$data['apply_deal_status'] = $this->config->item('apply_deal_status');
			$this->showView('applyDetail', $data);
		}else{
			redirect(formatUrl('investment/apply'));
		}
	}
	
	/**
	 * 
	 * 入驻申请审核
	 */
	public function doAuditApply()
	{
		$data = $this->input->post();
		unset($data['file']);
		if(!$data['follow_by'] && checkRight('apply_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('apply_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_EnterprisePotential');
		$msg = '';
		$this->MIS_EnterprisePotential->update($data);
		switch($data['deal_status']){
			case 1:
				redirect(formatUrl('investment/apply'));
				break;
			case 2:
				redirect(formatUrl('investment/approval?id='.$data['enterprise_id']));
				break;
			case 4:
				//立项审核不通过，转为潜在客户
				$this->doChangeApply($data['enterprise_id']);
				redirect(formatUrl('investment/applyDetail?id='.$data['enterprise_id']));
				break;
			default:
				redirect(formatUrl('investment/applyDetail?id='.$data['enterprise_id']));				
		}
	}
	
	/**
	 *
	 * 立项申请
	 */
	public function approval(){
		$data = array();
		if(checkRight('apply_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_EnterprisePotential');
		$data['info'] = $this->MIS_EnterprisePotential->getInfo($id);
		$this->showView('applyApproval', $data);
	}
	
	/**
	 *
	 * 立项申请do
	 */
	public function doApproval(){
		$data = array();
		if(checkRight('apply_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$data = $this->input->post();
		$this->load->model('MIS_EnterprisePotential');
		$this->MIS_EnterprisePotential->addApproval($data);
		redirect(formatUrl('investment/applyDetail?id='.$data['potential_id']));
	}
	
	/**
	 * 入驻转为潜在用户
	 * Enter description here ...
	 */
	private function doChangeApply($id)
	{
		$data = array();
		if(checkRight('activity_audit') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_EnterprisePotential');
		$msg = '';
		$data['enterprise_id'] = $id;
		$data['is_change'] = 1;
		$this->MIS_EnterprisePotential->update($data);
		
		$info = $this->MIS_EnterprisePotential->getInfo($id);
		$this->load->model('MIS_EnterpriseHidden');
		$addData = array();
		$addData['enterprise_name'] = $info['enterprise_name'];
		$addData['enterprise_contact'] = $info['enterprise_contact'];
		$addData['enterprise_contact_mobile'] = $info['enterprise_contact_mobile'];
		$addData['add_time'] = time();
		$this->MIS_EnterpriseHidden->add($addData);
		
		redirect(formatUrl('investment/applyDetail?id='.$data['enterprise_id']));
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
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		$this->load->model('MIS_EnterpriseHidden');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('investment/potential').'?', $this->MIS_EnterpriseHidden->getCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_EnterpriseHidden->getList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['uid'] = $this->userId;
		//获取可跟进用户
		$this->load->model('MIS_Admin');
		$adminList = array();
		$list = $this->MIS_Admin->getAll();
		foreach($list as $item){
			if($item['admin_role'] == 0){
				$adminList[] = $item;
			}else{
				$rightsArr = explode(',', $item['role_rights']);
				if(in_array('potential_follow', $rightsArr)){
					$adminList[] = $item;
				}
			}
		}
		$data['adminList'] = $adminList;
		$this->showView('potentialList', $data);
	}
	
	public function doFollowPotential()
	{
		$data = $this->input->post();
		unset($data['file']);
		if(!$data['follow_by'] && checkRight('potential_follow') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($data['follow_by'] && checkRight('potential_assign') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_EnterpriseHidden');
		$msg = '';
		$this->MIS_EnterpriseHidden->update($data);
		redirect(formatUrl('investment/potential'));
	}
	
	public function addPotential()
	{
		$data = array();
		if($this->input->get('id')){
			$id = $this->input->get('id');
			$this->load->model('MIS_EnterpriseHidden');
			$data['info'] = $this->MIS_EnterpriseHidden->getInfo($id);
			$data['info']['building'] = $this->MIS_EnterpriseHidden->getEnterpriseBuildingInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			$data['typeMsg'] = '新增';
		}
		$this->load->model('MIS_Building');
		$data['buildInfo'] = $this->MIS_Building->getAllList();
		$this->showView('potentialAdd', $data);
	}
	
	/**
	 * 
	 * 删除
	 */
	public function doDelPotential()
	{
		$data = array();
		if(checkRight('potential_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_EnterpriseHidden');
		$this->MIS_EnterpriseHidden->del($id);
		$this->MIS_EnterpriseHidden->delEnterpriseBuildingInfo($id);
		redirect(formatUrl('investment/potential'));
	}
	
	public function doAddPotential()
	{
		$data = array();
		if($this->input->post('enterprise_id')){
			$data = $this->input->post();
			$enterprise_building = $data['enterprise_building'];
			unset($data['enterprise_building']);
			$this->load->model('MIS_EnterpriseHidden');
			$this->MIS_EnterpriseHidden->update($data);
			// 删除意向办公地点
			$this->MIS_EnterpriseHidden->delEnterpriseBuildingInfo($data['enterprise_id']);
			// 新增意向办公地点
			$addList = array();
			foreach($enterprise_building as $item){
				$addItem = array();
				$addItem['building_id'] = $item;
				$addItem['enterprise_id'] = $data['enterprise_id'];
				$addList[] = $addItem;
			}
			$this->MIS_EnterpriseHidden->batchAddEnterpriseBuilding($addList);
			redirect(formatUrl('investment/potential'));
		}else{
			if(checkRight('potential_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$enterprise_building = $data['enterprise_building'];
			unset($data['enterprise_building']);
			$data['add_time'] = time();
			$this->load->model('MIS_EnterpriseHidden');
			$msg = '';
			if(($id = $this->MIS_EnterpriseHidden->add($data)) === FALSE){
				$msg = 'msg='.urlencode('创建失败');
			}else{
				// 新增企业所在办公地点
				$addList = array();
				foreach($enterprise_building as $item){
					$addItem = array();
					$addItem['building_id'] = $item;
					$addItem['enterprise_id'] = $id;
					$addList[] = $addItem;
				}
				$this->MIS_EnterpriseHidden->batchAddEnterpriseBuilding($addList);
				$msg = 'msg='.urlencode('创建成功');
			}
			redirect(formatUrl('investment/potential?'.$msg));
		}
	}
}