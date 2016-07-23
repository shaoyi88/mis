<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Building extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 楼宇列表
	 */
	public function index()
	{
		$data = array();
		if(checkRight('building_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		$this->load->model('MIS_Building');
		$keyword = $this->input->get();
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('building/index').'?', $this->MIS_Building->getCount($keyword), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Building->getList($keyword, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['keyword'] = $keyword;
		$data['building_type'] = $this->config->item('building_type');
		$this->showView('buildingList', $data);
	}
	
	/**
	 * 
	 * 楼宇信息添加/编辑
	 */
	public function add()
	{
		$data = array();
		$data['building_type'] = $this->config->item('building_type');
		$data['init_fee'] = $this->config->item('init_fee');
		if($this->input->get('did')){
			if(checkRight('building_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$did = $this->input->get('did');
			$this->load->model('MIS_Building');
			$data['info'] = $this->MIS_Building->getInfo($did);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('building_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('buildingAdd', $data);
	}
	
	/**
	 * 
	 * 楼宇信息添加/编辑逻辑
	 */
	public function doAdd()
	{
		$data = array();
		if($this->input->post('building_id')){
			if(checkRight('building_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Building');
			$msg = '';
			$info = $this->MIS_Building->getInfoByBuildingRoom($data['building_floor'],$data['building_room']);
			if($info && $info['building_id'] != $data['building_id']){
				$msg = '?msg='.urlencode('同一楼层不可创建相同房号信息');
			}else{
				$this->MIS_Building->update($data);
			}
		}else{
			if(checkRight('building_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$this->load->model('MIS_Building');
			$msg = '';
			$info = $this->MIS_Building->getInfoByBuildingRoom($data['building_floor'], $data['building_room']);
			if($info){
				$msg = '?msg='.urlencode('同一楼层不可创建相同房号信息');
			}else{
				$id = $this->MIS_Building->add($data);
				if($id === FALSE){
					$msg = '?msg='.urlencode('创建失败');
				}
			}
		}
		redirect(formatUrl('building/index'.$msg));
	}
	
	/**
	 * 
	 * 删除楼宇信息
	 */
	public function doDel()
	{
		$data = array();
		if(checkRight('building_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Building');
		$this->MIS_Building->del($id);
		redirect(formatUrl('building/index'));
	}
}