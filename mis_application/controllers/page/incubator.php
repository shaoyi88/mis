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
		$id = 3;
		$data['articleInfo'] = $this->MIS_Article->getInfo($id);
		$data['articleComment'] = $this->MIS_Article->getCommentList($id);
		$data['articleCommentCount'] = count($data['articleComment']);
		$this->showView('incubator', $data);
	}
	
}