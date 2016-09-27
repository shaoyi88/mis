<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class home extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
	}
	
	/**
	 * 
	 * 主页
	 */
	public function index()
	{
		$data = array();
		$this->load->model('MIS_Enterprise');
		$data['elogo'] = $this->MIS_Enterprise->getLogo();
		$data['ename'] = $this->MIS_Enterprise->getList(0,20);
		$data['layoutName'] = 'lwLayout';
		$data['nav'] = 1;
		$this->load->model('MIS_Article');
		$type = '';
		$offset = 0;
		$articleList = $this->MIS_Article->getList($type, $offset, 5);
		$data['articleList'] = $articleList;
		$data['pattern'] = "/<img.*?src=[\'|\"](.*?(?:[\.gif|\.jpg]))[\'|\"].*?[\/]?>/";
		$this->load->model('MIS_Activity');
		$activityList = $this->MIS_Activity->getList(array(), $offset, 4);
		$data['activityList'] = $activityList;
		$this->showView('index', $data);
	}
	
	/**
	 *
	 * 简介
	 */
	public function zs()
	{
		$data = array();
		$data['nav'] = 2;
		$data['layoutName'] = 'lwLayout';
		$this->showView('rycenter', $data);
	}
	
	/**
	 *
	 * 联系我们
	 */
	public function contact()
	{
		$data = array();
		$data['layoutName'] = 'lwLayout';
		$data['nav'] = 6;
		$this->showView('contact', $data);
	}
	
	/**
	 *
	 * 易创客
	 */
	public function maker()
	{
		$data = array();
		$data['layoutName'] = 'lwLayout';
		$data['nav'] = 4;
		$this->showView('maker', $data);
	}
	
	/**
	 *  集团介绍
	 */
	public function group(){
	    $data = array();
		$data['layoutName'] = 'lwLayout';
		$data['nav'] = 5;
		$data['headTitle'] = '融易集团介绍';
		$this->showView('group', $data);
	}
	
	/**
	 *
	 * 退出
	 */
	public function logout()
	{
		$this->session->sess_destroy();
		redirect(formatUrl('home/index'));
	}
	
	/**
	 *
	 * 投诉建议
	 */
	public function advice()
	{
		checkUserLogin();
		$data = array();
		$data['msg'] = $this->input->get('msg');
		$data['feedback_type'] = $this->config->item('feedback_type');
		$this->showView('advice', $data);
	}
	
	/**
	 *
	 * 投诉建议do
	 */
	public function do_advice()
	{
		checkUserLogin();
		$data = array();
		$data = $this->input->post();
		$this->load->model('MIS_Feedback');
		$data['user_id'] = $this->userId;
		$this->load->model('MIS_User');
		$userInfo = $this->MIS_User->getInfo($data['user_id']);
		$data['user_name'] = $userInfo['user_name'];
		$data['add_time'] = time();
		$this->MIS_Feedback->add($data);
		redirect(formatUrl('home/index'));
	}
	
	/**
	 *
	 * 注册页
	 */
	public function register()
	{
		if($this->userId){
			redirect(formatUrl('home/index'));
		}else{
			$data = array();
			$data['msg'] = $this->input->get('msg');
			$data['uri'] = $this->input->get('uri');
			$data['layoutName'] = 'nlwLayout';
		    $data['nav'] = 0;
		    $data['headTitle'] = '注册';
			$this->showView('register', $data);
		}
	}
	
	
	/**
	 *
	 * 注册处理
	 */
	public function doRegister(){
		if($this->userId){
			redirect(formatUrl('home/index'));
		}else{
			if(($data['user_account'] = $this->input->post('user_account', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请填写账户')));
			}
			if(($data['user_name'] = $this->input->post('user_name', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请填写姓名')));
			}
			if(($data['user_email'] = $this->input->post('user_email', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请填写邮箱')));
			}
			if(($data['user_password'] = $this->input->post('user_password', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请填写密码')));
			}
			if(($userPasswordRe = $this->input->post('user_password_re', TRUE)) == FALSE){
				redirect(formatUrl('home/register?msg='.urlencode('请确认密码密码')));
			}
			if($data['user_password']!=$userPasswordRe){
				redirect(formatUrl('home/register?msg='.urlencode('两次输入密码不相同')));
			}			
			$data['user_password'] = md5($data['user_password']);
			$data['reg_time'] = time();
			$data['user_type'] = 0;
			$ecode = $this->input->post('ecode');
			if(!empty($ecode)){
				$this->load->model('MIS_Enterprise');
				$ep = $this->MIS_Enterprise->checkCode($ecode);
				if(!empty($ep)){
					$data['user_second_type'] = 2;
					$data['enterprise_id'] = $ep['enterprise_id'];
				}
			}
			$this->load->model('MIS_User');
			if($uid=$this->MIS_User->add($data)){ 
				$info = array(
						'user_id' => $uid,
						'user_name' => $data['user_name'],
						'user_type' => $data['user_type'],
				);
				$this->session->set_userdata($info);
				redirect(formatUrl('myhome/index'));
			}else{
				redirect(formatUrl('home/register?msg='.urlencode('注册失败')));
			}
		}
	}
	
	/**
	 *
	 * 检查账号重复
	 */
	public function checkAccount(){
		$data = array();
		$account = $this->input->get('account');
		$mail = $this->input->get('mail');
		$code = $this->input->get('code');
		$this->load->model('MIS_User');
		$data['status'] = 1;
		if($this->MIS_User->getInfoByName(trim($account))){
			$data['status'] = -3;
		}
		if($this->MIS_User->getInfoByEmail(trim($mail))){
			$data['status'] = -2;
		}
		$ci =& get_instance();
	    $emailCode = $ci->session->userdata('emailCode');
	    if(trim($code)!=$emailCode){
	    	$data['status'] = -1;
	    }
		$this->send_json($data);
	}
	
	
	
	/**
	 * 404、错误页面
	 */
	public function none(){
		$data = array();
		$data['msg'] = $this->input->get('msg');
		$data['layoutName'] = 'nlwLayout';
		$data['nav'] = 0;
		$data['headTitle'] = '提示';
		$this->showView('none', $data);
	}
	
	/**
	 *
	 */
	public function find(){
	if($this->userId){
			redirect(formatUrl('home/index'));
		}else{
			$data = array();
			$data['layoutName'] = 'nlwLayout';
		    $data['nav'] = 0;
		    $data['headTitle'] = '找回密码';
		    $data['msg'] = '请填写您注册时的邮箱账号';
			$this->showView('find', $data);
		}
	}
	
	/**
	 *
	 * 检查邮箱是否存在
	 */
	public function checkEmail(){
		$data = array();
		$account = $this->input->get('account');
		$this->load->model('MIS_User');
		$data['status'] = 0;
		if($this->MIS_User->getInfoByEmail(trim($account))){
			$data['status'] = 1;
		}
		$this->send_json($data);
	}
	
	/**
	 *
	 */
	public function sendFind(){
		$data = array();
		$mail = $this->input->get('account');
		$str = 'ZMRY2016'.$mail;
		$url = 'http://www.rycenter.com/page/home/reset?id='.md5($str).'&uid='.$mail;
		$txt = '<a href="'.$url.'" target=_blank>'.$url.'点击链接重设密码</a>';
		$title = '找回密码';
		$data['msg'] = $this->sendemail($txt,$mail,$title);
		$this->send_json($data);
	}
	
	/**
	 *
	 * 重设密码
	 */
	public function reset(){
		if($this->userId){
			redirect(formatUrl('home/index'));
		}else{
			$data = array();
			$id = $this->input->get('id');
			$mail = $this->input->get('uid');
			if(empty($id)||empty($mail)){
				redirect(formatUrl('home/index'));
			}
			$str = 'ZMRY2016'.$mail;
			if(md5($str)!=$id){
				redirect(formatUrl('home/index'));
			}
			$data['id'] = $id;
			$data['uid'] = $mail;
			$data['layoutName'] = 'nlwLayout';
			$data['nav'] = 0;
			$data['headTitle'] = '重设密码';
			$data['msg'] = '您的邮箱账号是'.$mail;
			if($this->input->get('msg')){
				$data['msg'] = $this->input->get('msg');
			}
			$this->showView('reset', $data);
		}
	}
	
	/**
	 *
	 * 重设密码do
	 */
	public function doReset(){
	if($this->userId){
			redirect(formatUrl('home/index'));
		}else{
			$data['user_email'] = $this->input->post('user_email');
			if(($data['user_password'] = $this->input->post('user_password', TRUE)) == FALSE){
				redirect(formatUrl('home/reset?id='.$this->input->post('id').'&uid='.$data['user_email'].'msg='.urlencode('请填写密码')));
			}
			if(($userPasswordRe = $this->input->post('user_password_re', TRUE)) == FALSE){
				redirect(formatUrl('home/reset?id='.$this->input->post('id').'&uid='.$data['user_email'].'msg='.urlencode('请确认密码密码')));
			}
			if($data['user_password']!=$userPasswordRe){
				redirect(formatUrl('home/reset?id='.$this->input->post('id').'&uid='.$data['user_email'].'msg='.urlencode('两次输入密码不相同')));
			}			
			$data['user_password'] = md5($data['user_password']);
			$this->load->model('MIS_User');
			$this->MIS_User->updateByEmail($data);
			$this->session->sess_destroy();
		    redirect(formatUrl('login'));
		}
	}
	
	/**
	 * 
	 */
	public function getCode(){
		$data = array();
		$code = rand(100000,999999);
		$mail = $this->input->get('account');
		$info = array(
			'emailCode' => $code,
		);
		$this->session->set_userdata($info);
        $txt = '本次邮箱验证码为：'.$code;
        $title = '注册验证码';
        $data['msg'] = $this->sendemail($txt,$mail,$title);
        $this->send_json($data);
	}
	
	/**
	 *
	 * 团队简介
	 */
	public function team()
	{
		$data = array();
		$data['nav'] = 2;
		$data['layoutName'] = 'lwLayout';
		$this->showView('team', $data);
	}
	
	/**
	 *
	 * 单点邮件发送
	 *
	 */
	private function sendemail($text,$touser,$title){
		$config['protocol'] = 'smtp';
		$config['smtp_host'] = 'smtp.exmail.qq.com';
		$config['smtp_user'] = 'system@ry168.cn';
		$config['smtp_pass'] = 'Rongyi2016';
		$config['smtp_port'] = '25';  
        $config['charset'] = 'utf-8';  
        $config['wordwrap'] = TRUE;  
        $config['mailtype'] = 'html';
        $config['crlf']="\r\n"; 
        $config['newline']="\r\n";
        $this->load->library('email');
	
		$this->email->initialize($config);
	
		$this->email->from('system@ry168.cn', iconv('UTF-8','GB2312','中美融易系统邮件'));
		$this->email->to($touser);
	    
		$this->email->subject($title);
		$this->email->message($text);
		$this->email->send();
	}
}