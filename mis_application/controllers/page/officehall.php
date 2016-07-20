<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class officehall extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkUserLogin();
	}
	
	/**
	 * 
	 * 办事大厅主页
	 */
	public function index()
	{
		$data = array();
		$this->load->model('MIS_User');
		$data['info'] = $this->MIS_User->getInfo($this->userId);
		$this->showView('officeHall/main', $data);
	}
	
	/**
	 *
	 * 办事大厅-入驻申请
	 */
	public function application()
	{
		$data = array();
		$data['msg'] = $this->input->get('msg');		
		$this->showView('officeHall/enter', $data);
	}
	
	/**
	 *
	 * 办事大厅-提交入驻申请
	 */
	public function do_application(){
		$data = array();		
		$data = $this->input->post();
		$this->load->model('MIS_EnterprisePotential');
		$data['app_by'] = $this->userId;
		$data['app_time'] = time();
		//上传营业执照
		$config['upload_path'] =   './upload/enterprise/licence/'; //存放路径
		$config['allowed_types'] = 'gif|jpg|jpeg|png|bmp';
		$config['max_size'] = '2048'; //最大2M
		$config['encrypt_name'] = TRUE;
		$this->load->library('upload', $config);
		if($this->upload->do_upload('enterprise_bussiness')){
			$upload_data = $this->upload->data();  //文件信息
			$data['enterprise_business_licence'] = $upload_data['file_name'];
		}else{
			 $error = $this->upload->display_errors();
			 redirect(formatUrl('officehall/application?msg=').$error);
		}
		$id = $this->MIS_EnterprisePotential->add($data);
		redirect(formatUrl('myhome/application'));
	}
	
	/**
	 *
	 * 办事大厅-我的物业
	 */
	public function property()
	{
		$data = array();
		$this->load->model('MIS_User');
		$info = $this->MIS_User->getInfo($this->userId);
		if($info['user_second_type']!=2){
			redirect(formatUrl('officehall/index'));
		}
		$data['msg'] = $this->input->get('msg');
		$data['type'] = 1;
		if($this->input->get('type')){
			$data['type'] = $this->input->get('type');
		}
		$data['repair_type'] = $this->config->item('repair_type');
		$data['apply_type'] = $this->config->item('apply_type');
		$this->showView('officeHall/property', $data);
	}
	
	/**
	 *
	 * 办事大厅-我的物业do
	 */
	public function do_property()
	{
		$data = array();
		$this->load->model('MIS_User');
		$info = $this->MIS_User->getInfo($this->userId);
		if($info['user_second_type']!=2){
			redirect(formatUrl('officehall/index'));
		}
		if($this->input->post('type')){
			$type = $this->input->post('type');
			$data = $this->input->post();
			unset($data['type']);
			$data['user_id'] = $this->userId;
			$data['add_time'] = time();
			if($type==1){
				$this->load->model('MIS_Repair');
				$this->MIS_Repair->add($data);
			}else if($type==2){
				$this->load->model('MIS_Complain');
				$this->MIS_Complain->add($data);
			}else if($type==3){
				$this->load->model('MIS_Apply');				
				$this->MIS_Apply->add($data);
			}else{
				redirect(formatUrl('officehall/property'));
			}
			redirect(formatUrl('myhome/property?t='.$type));
		}else{
			redirect(formatUrl('officehall/property'));
		}
	}
	
	/**
	 *
	 * 办事大厅-公共资源
	 */
	public function resource()
	{
		$data = array();
		$this->load->model('MIS_User');
		$info = $this->MIS_User->getInfo($this->userId);
		if($info['user_second_type']!=2){
			redirect(formatUrl('officehall/index'));
		}
		$data['msg'] = $this->input->get('msg');
		$this->load->model('MIS_Room');
		$keyword = array();
		$data['roomInfo'] = $this->MIS_Room->search($keyword);
		$data['room_type'] = $this->config->item('room_type');
		$this->showView('officeHall/resource', $data);
	}
	
	/**
	 *
	 * 办事大厅-公共资源do
	 */
	public function do_resource()
	{
		$data = array();
		$this->load->model('MIS_User');
		$info = $this->MIS_User->getInfo($this->userId);
		if($info['user_second_type']!=2){
			redirect(formatUrl('officehall/index'));
		}
		$data = $this->input->post();
		$data['user_id'] = $this->userId;
		$data['start_time'] = strtotime($data['start_time']);
		$data['end_time'] = strtotime($data['end_time']);
		$data['status'] = 0;
		$data['add_time'] = time();
		$this->load->model('MIS_Room');
		if($this->MIS_Room->addBooking($data)){
			redirect(formatUrl('myhome/resource'));
		}
	}
	
	/**
	 *
	 * 办事大厅-项目需求
	 */
	public function project()
	{
		$data = array();
		$data['msg'] = $this->input->get('msg');
		$this->showView('officeHall/project', $data);
	}
	
	/**
	 *
	 * 办事大厅-项目需求do
	 */
	public function do_project()
	{
		$data = array();
		$data = $this->input->post();
		$data['user_id'] = $this->userId;
		$data['status'] = 0;
		$data['add_time'] = time();
		$this->load->model('MIS_Project');
		if($this->MIS_Project->addApply($data)){
			redirect(formatUrl('myhome/project'));
		}
	}
	
	/**
	 *
	 * 办事大厅-投资申请
	 */
	public function invest()
	{
		$data = array();
		$this->load->model('MIS_User');
		$info = $this->MIS_User->getInfo($this->userId);
		if($info['user_second_type']!=2){
			redirect(formatUrl('officehall/index'));
		}
		$data['msg'] = $this->input->get('msg');
		$this->showView('officeHall/invest', $data);
	}
	
	/**
	 *
	 * 办事大厅-投资申请do
	 */
	public function do_invest()
	{
		$data = array();
		$this->load->model('MIS_User');
		$info = $this->MIS_User->getInfo($this->userId);
		if($info['user_second_type']!=2){
			redirect(formatUrl('officehall/index'));
		}
	    $data = $this->input->post();
		$data['user_id'] = $this->userId;
		$this->load->model('MIS_User');
		$userinfo = $this->MIS_User->getInfo($this->userId);
		$data['enterprise_id'] = $userinfo['enterprise_id'];
		$data['status'] = 0;
		$data['add_time'] = time();
		$this->load->model('MIS_Invest');
		if($this->MIS_Invest->add($data)){
			redirect(formatUrl('myhome/invest'));
		}
	}
	
	/**
	 *
	 * 办事大厅-表格下载
	 */
	public function form()
	{
		$data = array();
		$data['msg'] = $this->input->get('msg');
		$this->showView('officeHall/form', $data);
	}
	
	/**
	 *
	 * 办事大厅-表格下载
	 */
	public function formdown()
	{
		$data = array();
	    $data = $this->input->get();
	    if(!empty($data)){
	        $path = "./upload/form/".$data['fno'].".pdf";
	        if(file_exists($path)){
	        	$file_name = date('Ymdhis').rand(11,99).'.pdf';
	        	header( "Cache-Control: public" );
	        	header( "Pragma: public" );
	        	header("Content-Disposition:attachment;filename=".$file_name);
	        	header('Content-Type:APPLICATION/OCTET-STREAM');
	        	$objWriter->save('php://output');
	        }else{
	        	redirect(formatUrl('officehall/form'));
	        }
	    }else{
	    	redirect(formatUrl('officehall/form'));
	    }
	}
	
}