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
		$data = $weather = $weatherinfo = array();
		//获取东莞实时天气
		$ch = curl_init();
		$url = 'http://apis.baidu.com/heweather/weather/free?cityid=CN101281601';
		$header = array(
				'apikey: b65d28287acf1ad5ab79501fb7f51636',
		);
		// 添加apikey到header
		curl_setopt($ch, CURLOPT_HTTPHEADER  , $header);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		// 执行HTTP请求
		curl_setopt($ch , CURLOPT_URL , $url);
		$res = curl_exec($ch);
		$weather = json_decode($res);
		$weather = object_array($weather);
		$weatherinfo = $weather['HeWeather data service 3.0'];
		$data['weatherNow'] = array();
		if(isset($weatherinfo[0]['status'])&&$weatherinfo[0]['status']=='ok'){
			$data['weatherNow'] = $weatherinfo[0]['now'];
			//$data['weatherAqi'] = $weatherinfo[0]['aqi'];
		}
		$data['week'] = array("日","一","二","三","四","五","六");
		$data['hideNav'] = 1;
		$this->showView('index', $data);
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
			$data['hideNav'] = 1;
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
		$this->load->model('MIS_User');
		$data['status'] = 1;
		if($this->MIS_User->getInfoByName(trim($account))){
			$data['status'] = 0;
		}
		$this->send_json($data);
	}
}