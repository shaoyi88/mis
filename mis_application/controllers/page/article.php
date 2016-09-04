<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class article extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 *
	 * 资讯首页
	 */
	public function index()
	{
		$data = array();
		$this->load->model('MIS_Article');
		$type = '';
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('article/index').'?', $this->MIS_Article->getCount($type), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Article->getList($type, $offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('article', $data);
	}
	
	/**
	 * 
	 * 资讯详情
	 */
	public function info()
	{
		$data = array();
		$this->load->model('MIS_Article');
		$id = $this->input->get('id');
		$data['articleInfo'] = $this->MIS_Article->getInfo($id);
		$data['articleComment'] = $this->MIS_Article->getCommentList($id);
		$data['articleCommentCount'] = count($data['articleComment']);
		$type = '';
		$data['list'] = $this->MIS_Article->getList($type, 0, 10);
		$data['nav'] = 0;
		$data['layoutName'] = 'lwLayout';
		$this->showView('articleinfo', $data);
	}
	
	
	/**
	 *
	 * 评论页面
	 */
	public function comment()
	{
		$data = array();
		$this->load->model('MIS_Article');
		$id = $this->input->get('id');
		$data['articleInfo'] = $this->MIS_Article->getInfo($id);
		$data['articleComment'] = $this->MIS_Article->getCommentList($id);
		$data['articleCommentCount'] = count($data['articleComment']);
		$this->showView('comment', $data);
	}
	
	public function addComment(){
		$data = array();
		$data['status'] = 0;
		$ci =& get_instance();
		$userId = $ci->session->userdata('user_id');
		$userName = $ci->session->userdata('user_name');
		if($userId==''){
			$data['status'] = -1;
		}else{
			$postdata = $this->input->post();
			$postdata['user_id'] = $userId;
			$this->load->model('MIS_User');
			$userInfo = $this->MIS_User->getInfo($postdata['user_id']);
			$postdata['comment_time'] = time();
			$this->load->model('MIS_Article');
			if($this->MIS_Article->addComment($postdata)){
				$data['status'] = 1;
				$data['info'] = $postdata;
				$data['info']['comment_time'] = date('Y-m-d H:i:s',$postdata['comment_time']);
				$data['info']['user_name'] = $userName;
			}
		}
		$this->send_json($data);
	}
	
}