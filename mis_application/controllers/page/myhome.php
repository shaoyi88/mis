<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class myhome extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkUserLogin();
	}
	
	/**
	 *
	 * 用户控制台主页
	 */
	public function index()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$this->load->model('MIS_User');
		$data['info'] = $this->MIS_User->getInfo($this->userId);
		$data['unav'] = 1;
		$data['layoutName'] = "myhome";		
		$this->showView('/userHome/main', $data);
	}
	
	/**
	 *
	 * 用户账户设置
	 */
	public function user_setting()
	{
		$data = array();
	    if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$this->load->model('MIS_User');
		$data['info'] = $this->MIS_User->getInfo($this->userId);
		$data['unav'] = 1;
		$data['user_type'] = $this->config->item('user_type');
		$data['user_second_type'] = $this->config->item('user_second_type');
		$data['layoutName'] = "myhome";
		$this->showView('/userHome/user', $data);
	}
	
	/**
	 *
	 * 保存用户账户信息
	 */
	public function do_user_setting()
	{
		$data = array();
		$data = $this->input->post();
		$data['user_id'] = $this->userId;
		$this->load->model('MIS_User');
		$this->MIS_User->update($data);
		$msg = "保存个人信息成功|成功";
		redirect(formatUrl('myhome/user_setting?msg=').urlencode($msg));
	}
	
	/**
	 *
	 * 用户密码设置
	 */
	public function password()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 1;
		$data['layoutName'] = "myhome";
		$this->showView('/userHome/password', $data);
	}
	
	/**
	 *
	 * 用户更改密码
	 */
	public function change_password()
	{
		$data = array();
		$data = $this->input->post();
		$data['user_id'] = $this->userId;
		$this->load->model('MIS_User');
		$info = $this->MIS_User->getInfo($this->userId);
		if($info['user_password']!=md5($data['old_password'])){
			$msg = "初始密码不正确，修改密码失败|失败";
			redirect(formatUrl('myhome/password?msg=').urlencode($msg));
		}
		if($data['new_password']!=$data['new_password_re']){
			$msg = "两次输入的新密码不一致，修改密码失败|失败";
			redirect(formatUrl('myhome/password?msg=').urlencode($msg));
		}
		if($info['user_password']==md5($data['new_password'])){
			$msg = "新密码不能和旧密码一样，修改密码失败|失败";
			redirect(formatUrl('myhome/password?msg=').urlencode($msg));
		}
		$data['user_password'] = md5($data['new_password']);
		unset($data['old_password']);
		unset($data['new_password']);
		unset($data['new_password_re']);
		$this->MIS_User->update($data);
		$this->session->sess_destroy();
		redirect(formatUrl('login'));
	}
	
}