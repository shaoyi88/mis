<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class incubator extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 * 
	 * 孵化器主页
	 */
	public function index()
	{
		$data = array();
		$this->load->model('MIS_Article');
		$data['articleInfo'] = $this->MIS_Article->getLatest();
		$data['articleComment'] = $this->MIS_Article->getCommentList($data['articleInfo']['article_id']);
		$data['articleCommentCount'] = count($data['articleComment']);
		$this->load->model('MIS_Enterprise');
		$data['elogo'] = $this->MIS_Enterprise->getLogo();
		$this->showView('incubator', $data);
	}
	
}