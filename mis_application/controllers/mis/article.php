<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Article extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 资讯类别列表
	 */
	public function type()
	{
		$data = array();
		if(checkRight('article_type_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$this->load->model('MIS_Article');
		$data['dataList'] = $this->MIS_Article->getTypeListTree(0);
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
		}
		$this->showView('articleType', $data);
	}
	
	/**
	 * 
	 * 资讯类别添加/编辑
	 */
	public function addType()
	{
		$data = array();
		if($this->input->get('did')){
			if(checkRight('article_type_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$did = $this->input->get('did');
			$this->load->model('MIS_Article');
			$data['info'] = $this->MIS_Article->getTypeInfo($did);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('article_type_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->load->model('MIS_Article');
		$data['dataList'] = $this->MIS_Article->getTypeListTree(0);
		$this->showView('articleTypeAdd', $data);
	}
	
	/**
	 * 
	 * 资讯类别添加/编辑逻辑
	 */
	public function doAddType()
	{
		$data = array();
		if($this->input->post('type_id')){
			if(checkRight('article_type_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['parent_id'] = $data['parent_id'] ? $data['parent_id'] : 0;
			$this->load->model('MIS_Article');
			$msg = '';
			$info = $this->MIS_Article->getTypeInfoByName($data['parent_id'], $data['type_name']);
			if(!empty($info) && $info['type_id'] != $data['type_id']){
				$msg = '?msg='.urlencode('已存在该资讯类别');
			}else{
				$this->MIS_Article->updateType($data);
			}
		}else{
			if(checkRight('article_type_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['parent_id'] = $data['parent_id'] ? $data['parent_id'] : 0;
			$this->load->model('MIS_Article');
			$msg = '';
			$info = $this->MIS_Article->getTypeInfoByName($data['parent_id'], $data['type_name']);
			if(!empty($info)){
				$msg = '?msg='.urlencode('已存在该资讯类别');
			}else{
				$id = $this->MIS_Article->addType($data);
				if($id === FALSE){
					$msg = '?msg='.urlencode('创建失败');
				}
			}
		}
		redirect(formatUrl('article/type'.$msg));
	}
	
	/**
	 * 
	 * 删除类别
	 */
	public function doDelType()
	{
		$data = array();
		if(checkRight('article_type_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Article');
		$subList = $this->MIS_Article->getTypeListTree($id);
		$idList = array();
		$idList[] = $id;
		foreach($subList as $item){
			$idList[] = $item['type_id'];
		}
		$articleList = $this->MIS_Article->getInfoByTypes($idList);
		if(empty($articleList)){
			$this->MIS_Article->delType($idList);
			redirect(formatUrl('article/type'));
		}else{
			redirect(formatUrl('article/type?msg='.urlencode('该资讯类别下存在'.count($articleList).'篇资讯，暂时不可删除')));
		}
	}
	
	/**
	 * 
	 * 资讯列表
	 */
	public function index()
	{
		$data = array();
		if(checkRight('article_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
		}
		$this->load->model('MIS_Article');
		$type = '';
		if($this->input->get('type')){
			$type = $this->input->get('type');
		}
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('article/index').'?', $this->MIS_Article->getCount($type), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Article->getList($type, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['type'] = $type;
		$data['typeList'] = $this->MIS_Article->getTypeListTree(0);
		$typeNameList = array();
		foreach($data['typeList'] as $item){
			$typeNameList[$item['type_id']] = $item['type_name'];
		}
		$data['typeNameList'] = $typeNameList;
		$this->showView('articleList', $data);
	}
	
	/**
	 * 
	 * 资讯添加
	 */
	public function add()
	{
		$data = array();
		if($this->input->get('did')){
			if(checkRight('article_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$did = $this->input->get('did');
			$this->load->model('MIS_Article');
			$data['info'] = $this->MIS_Article->getInfo($did);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('article_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->load->model('MIS_Article');
		$data['typeList'] = $this->MIS_Article->getTypeListTree(0);
		$this->showView('articleAdd', $data);
	}
	
  	/**
     *
     * 增加/编辑逻辑
     */
    public function doAdd()
    {
    	$data = $this->input->post();
    	$this->load->model('MIS_Article');
    	if(isset($data['article_id'])&&is_numeric($data['article_id'])){
    		if(checkRight('article_edit') === FALSE){
    			$this->showView('denied', $data);
    			exit;
    		}
    		$data['update_time'] = strtotime('now');
    		$this->MIS_Article->update($data);
    		redirect(formatUrl('article/index'));
    	}else{
    		if(checkRight('article_add') === FALSE){
    			$this->showView('denied', $data);
    			exit;
    		}
    		$data['add_time'] = $data['update_time'] = strtotime('now');
			$data['admin_id'] = $this->userId; 
			$data['admin_name'] = $this->userName;
    		$msg = '';
    		if($this->MIS_Article->add($data) === FALSE){
    			$msg = '?msg='.urlencode('创建失败');
    		}
    		redirect(formatUrl('article/index'.$msg));
    	}
    }
    
    /**
     * 
     * 删除
     */
	public function doDel()
	{
		$data = array();
		if(checkRight('article_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('did');
		$this->load->model('MIS_Article');
		$this->MIS_Article->del($id);
		redirect(formatUrl('article/index'));
	}
	
	/**
	 * 
	 * 详情
	 */
	public function detail()
	{
		$data = array();
		if(checkRight('article_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$did = $this->input->get('did');
		$this->load->model('MIS_Article');
		$data['info'] = $this->MIS_Article->getInfo($did);
		$typeList = $this->MIS_Article->getTypeListTree(0);
		$typeNameList = array();
		foreach($typeList as $item){
			$typeNameList[$item['type_id']] = $item['type_name'];
		}
		$data['typeNameList'] = $typeNameList;
		$this->showView('articleDetail', $data);
	}
}