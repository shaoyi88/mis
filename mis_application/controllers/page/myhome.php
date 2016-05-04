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
		if($data['info']['enterprise_id']){
			$this->load->model('MIS_Enterprise');
			$data['enterprise'] = $this->MIS_Enterprise->getInfo($data['info']['enterprise_id']);
		}
		$data['user_type'] = $this->config->item('user_type');
		$data['user_second_type'] = $this->config->item('user_second_type');
		$data['unav'] = 1;
		$data['layoutName'] = "myhome";	
		$data['title'] = '我的园区';
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
	
	/**
	 *
	 * 入驻申请
	 */
	public function application()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 2;
		$data['layoutName'] = "myhome";
		$data['title'] = '入驻申请';
		$this->load->model('MIS_EnterprisePotential');
		$uid = $this->userId;
		$offset = 0;
		$pageUrl = '';
		$keyword = array();
		page(formatUrl('myhome/application').'?', $this->MIS_EnterprisePotential->getCount($keyword,$uid), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_EnterprisePotential->getList($keyword,$offset, PER_COUNT, $uid);
		$data['pageUrl'] = $pageUrl;
		$data['list'] = $dataList;
		$this->showView('/userHome/enter', $data);
	}
	
	/**
	 *
	 * 入驻申请详情
	 */
	public function applicationDetail()
	{
		$data = array();
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
		}
		if($this->input->get('aid')){
			$data['aid'] = $this->input->get('aid');
			$this->load->model('MIS_EnterprisePotential');
			$data['info'] = $this->MIS_EnterprisePotential->getInfo($data['aid']);
			if(!empty($data['info'])&&$this->userId!=$data['info']['app_by']){
				$data['msg'] = "该申请不存在";
				$data['info'] = array();
			}
		}else{
			$data['msg'] = "该申请不存在";
			$data['info'] = array();
		}
		$data['unav'] = 2;
		$data['layoutName'] = "myhome";
		$data['title'] = '入驻申请详情';		
		$this->showView('/userHome/enterDetail', $data);
	}
	
	/**
	 *
	 * 物业申请
	 */
	public function property()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 3;
		$data['layoutName'] = "myhome";
		$data['title'] = '我的物业';
		$uid = $this->userId;
		$offset = 0;
		$pageUrl1 = $pageUrl2 = $pageUrl3 = $pageUrl4 ='';
		$keyword = array();
		$this->load->model('MIS_Repair');
		page(formatUrl('myhome/property').'?', $this->MIS_Repair->getCount($keyword,$uid), PER_COUNT, $offset, $pageUrl1);
		$dataList1 = $this->MIS_Repair->getList($keyword,$offset, PER_COUNT, $uid);
		$data['pageUrl1'] = $pageUrl1;
		$data['list1'] = $dataList1;
		$this->load->model('MIS_Complain');
		page(formatUrl('myhome/property').'?', $this->MIS_Complain->getCount($keyword,$uid), PER_COUNT, $offset, $pageUrl2);
		$dataList2 = $this->MIS_Complain->getList($keyword,$offset, PER_COUNT, $uid);
		$data['pageUrl2'] = $pageUrl2;
		$data['list2'] = $dataList2;
		$this->load->model('MIS_Apply');
		page(formatUrl('myhome/property').'?', $this->MIS_Apply->getCount($keyword,$uid), PER_COUNT, $offset, $pageUrl3);
		$dataList3 = $this->MIS_Apply->getList($keyword,$offset, PER_COUNT, $uid);
		$data['pageUrl3'] = $pageUrl3;
		$data['list3'] = $dataList3;
		$this->load->model('MIS_User');
		$userinfo = $this->MIS_User->getInfo($uid);
		if($userinfo['user_second_type']==2){
			$this->load->model('MIS_Fee');
			page(formatUrl('myhome/property').'?', $this->MIS_Fee->getCount($keyword,$userinfo['enterprise_id']), PER_COUNT, $offset, $pageUrl4);
			$dataList4 = $this->MIS_Fee->getList($keyword,$offset, PER_COUNT, $userinfo['enterprise_id']);
			$data['pageUrl4'] = $pageUrl4;
			$data['list4'] = $dataList4;
		}
		$data['repair_type'] = $this->config->item('repair_type');
		$data['apply_type'] = $this->config->item('apply_type');
		$data['repair_status'] = $this->config->item('repair_status');
		$data['apply_status'] = $this->config->item('apply_status');
		$data['complain_status'] = $this->config->item('complain_status');
		$this->showView('/userHome/property', $data);
	}
	
	/**
	 *
	 * 公共资源申请
	 */
	public function resource()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 4;
		$data['layoutName'] = "myhome";
		$data['title'] = '公共资源申请';
		$this->load->model('MIS_Room');
		$uid = $this->userId;
		$offset = 0;
		$pageUrl = '';
		$keyword = array();
		page(formatUrl('myhome/resource').'?', $this->MIS_Room->getUidBookingCount($keyword,$uid), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Room->getBookingListByUid($keyword, $offset, PER_COUNT, $uid);
		$data['pageUrl'] = $pageUrl;
		$data['list'] = $dataList;
		$data['room_status'] = $this->config->item('room_booking_status');
		$this->showView('/userHome/resource', $data);
	}
	
	/**
	 *
	 * 项目需求申请
	 */
	public function project()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 6;
		$data['layoutName'] = "myhome";
		$data['title'] = '项目需求申请';
		$this->load->model('MIS_Project');
		$uid = $this->userId;
		$offset = 0;
		$pageUrl = '';
		$keyword = array();
		page(formatUrl('myhome/project').'?', $this->MIS_Project->getUidApplyCount($keyword,$uid), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Project->getApplyListByUid($keyword, $offset, PER_COUNT, $uid);
		$data['pageUrl'] = $pageUrl;
		$data['list'] = $dataList;
		$data['project_apply_status'] = $this->config->item('project_apply_status');
		$this->showView('/userHome/project', $data);
	}
	
	/**
	 *
	 * 投资需求申请
	 */
	public function invest()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 5;
		$data['layoutName'] = "myhome";
		$data['title'] = '投资需求申请';
		$this->load->model('MIS_Invest');
		$uid = $this->userId;
		$offset = 0;
		$pageUrl = '';
		$keyword = array();
		page(formatUrl('myhome/invest').'?', $this->MIS_Invest->getCount($keyword,$uid), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Invest->getList($keyword, $offset, PER_COUNT, $uid);
		$data['pageUrl'] = $pageUrl;
		$data['list'] = $dataList;
		$data['invest_apply_status'] = $this->config->item('invest_apply_status');
		$this->showView('/userHome/invest', $data);
	}
	
	/**
	 *
	 * 企业风采
	 */
	public function corporate()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 7;
		$data['layoutName'] = "myhome";
		$data['title'] = '企业风采';
		$this->load->model('MIS_EnterpriseStyle');
		$uid = $this->userId;
		$this->load->model('MIS_User');
		$userinfo = $this->MIS_User->getInfo($this->userId);
		$data['enterprise_id'] = $userinfo['enterprise_id'];
		$data['info'] = $this->MIS_EnterpriseStyle->getInfo($data['enterprise_id']);
		$this->showView('/userHome/style', $data);
	}
	
	/**
	 *
	 * 添加企业风采
	 */
	public function addCorporate()
	{
		$data = array();
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
		}
		$data['unav'] = 7;
		$data['layoutName'] = "myhome";
		$data['title'] = '添加企业风采';
		$this->showView('/userHome/addStyle', $data);
	}
	
	/**
	 *
	 * 企业风采
	 */
	public function do_addCorporate()
	{
		$data = array();
		$data = $this->input->post();
		if($data['enterprise_bussiness']){
			//上传头像
			$config['upload_path'] =   './upload/enterprise/cover/'; //存放路径
			$config['allowed_types'] = 'gif|jpg|jpeg|png|bmp';
			$config['max_size'] = '2048'; //最大2M
			$config['encrypt_name'] = TRUE;
			$this->load->library('upload', $config);
			if($this->upload->do_upload('style_cover')){
				$upload_data = $this->upload->data();  //文件信息
				$data['style_cover'] = $upload_data['file_name'];
			}else{
				$error = $this->upload->display_errors();
				redirect(formatUrl('myhome/addCorporate?msg=').$error);
			}
		}else{
			$error = '没上传封面图';
			redirect(formatUrl('myhome/addCorporate?msg=').$error);
		}
		$data['user_id'] = $this->userId;
		$this->load->model('MIS_User');
		$userinfo = $this->MIS_User->getInfo($this->userId);
		$data['enterprise_id'] = $userinfo['enterprise_id'];
		$data['add_time'] = time();
		$this->load->model('MIS_EnterpriseStyle');
		if($this->MIS_EnterpriseStyle->add($data)){
			redirect(formatUrl('myhome/corporate'));
		}
	}
	
	/**
	 *
	 * 我的活动
	 */
	public function activity()
	{
		$data = array();
		if($this->input->get('msg')){
			$data = getMsg($this->input->get('msg'));
		}
		$data['unav'] = 8;
		$data['layoutName'] = "myhome";
		$data['title'] = '我的活动';
		$this->load->model('MIS_Activity');
		$uid = $this->userId;
		$this->load->model('MIS_User');
		$userinfo = $this->MIS_User->getInfo($this->userId);
		$data['enterprise_id'] = $userinfo['enterprise_id'];
		$offset = 0;
		$pageUrl = '';
		$keyword = array();
		page(formatUrl('myhome/activity').'?', $this->MIS_Activity->getCount($keyword,$uid), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Activity->getList($keyword, $offset, PER_COUNT, $uid);
		$data['pageUrl'] = $pageUrl;
		$data['list'] = $dataList;
		$data['activity_audit_type'] = $this->config->item('activity_audit_type');
		$this->showView('/userHome/activity', $data);
	}
	
}