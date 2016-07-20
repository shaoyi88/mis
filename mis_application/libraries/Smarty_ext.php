<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

define('SMARTY_VER', '3.1.11');
define('SMARTY_DIR', THIRD_PATH.'Smarty-'.SMARTY_VER.'/');
require SMARTY_DIR.'Smarty.class.php';

/**
 *
 * Smarty模板类，替代ci自身的模板功能
 *
 */
class Smarty_ext extends Smarty
{
	protected $ext = VIEW_EXT; //后缀名
	/**
	 * 为模板文件添加strip过滤模版空格，回车
	 *
	 * @param string $source
	 * @param object $smarty
	 * @return string
	 */
	public function addStrip($source, $smarty){
		return '{strip}'.$source.'{/strip}';
	}
	
	/**
	 * __construct
	 * smarty的参数初始化
	 */
	public function __construct()
	{
		parent::__construct();
		if(!file_exists(VIEW_DIR.'cache')){
			mkdir(VIEW_DIR.'cache', DIR_WRITE_MODE);
		}

		$this->template_dir = VIEW_DIR;
		$this->compile_dir = VIEW_DIR.'templates_c/';
		$this->config_dir = SMARTY_DIR.'configs/';
		$this->cache_dir = VIEW_DIR.'cache/';
		if(DEBUG_MODE){
			$this->force_compile = TRUE;
		}else{
			$this->compile_check = FALSE;
		}
		$this->debugging = FALSE;
		$this->caching = FALSE;
		$this->cache_lifetime = 6000;
	}
	
	/**
	 * 渲染模板核心逻辑
	 *
	 * @param string $template 模板路径
	 * @param string $layout 布局名称
	 * @param array $data 模板数据
	 */
	private function _renderLayout($template, $dir, &$data = array())
	{
		$this->registerFilter('pre', array($this, 'addStrip'));
		$this->loadFilter('output', 'trimwhitespace'); // 去掉空格
		$has_layout = isset($data['layout']) ? $data['layout'] : TRUE;
		$layoutName = isset($data['layoutName']) && !empty($data['layoutName']) ? $data['layoutName'] : 'layout';
		if($has_layout){
			$layout_path = VIEW_DIR.$dir.$layoutName.'.'.$this->ext;
			$this->assignByRef('LAYOUT_CONTENT', $this->fetch($template), TRUE);
			$this->display($layout_path);
		}else{
			$this->display($template);
		}
		
	}	
	
	/**
	 * 渲染模板
	 *
	 * @param string $template 模板路径
	 * @param string $theme 平台(phone/pc)
	 * @param array $data 模板数据
	 * 
	 */
	public function view($template, $dir, &$data='')
	{
		if(is_array($data)){
			foreach($data as $key=>$val){
				$this->assign($key, $val, TRUE);
			}
		}
		$ci =& get_instance();		
	    $userinfo['userId'] = $ci->userId = $ci->session->userdata('user_id'); 
	    $userinfo['userName'] = $ci->userName = $ci->session->userdata('user_name');
	    $userinfo['userType'] = $ci->userType = $ci->session->userdata('user_type');
	    $userinfo['userSecondType'] = '';
	    if($userinfo['userId']){
	    	$ci->load->model('MIS_User');
		    $uinfo = $ci->MIS_User->getInfo($userinfo['userId']);
		    $userinfo['userSecondType'] = $uinfo['user_second_type']?$uinfo['user_second_type']:'';
	    }
		$this->assign('userinfo', $userinfo, TRUE);
		$ci->load->model('MIS_Sys');
		$info = $ci->MIS_Sys->getInfo();
		$defaultConfig = $ci->config->item('default_sys_config');
		$web['website_title'] = isset($info['website_title']) && $info['website_title'] ? $info['website_title'] : $defaultConfig['website_title'];
		$web['website_copyright'] = isset($info['website_copyright']) && $info['website_copyright'] ? $info['website_copyright'] : $defaultConfig['website_copyright'];
		$web['website_record_no'] = isset($info['website_record_no']) && $info['website_record_no'] ? $info['website_record_no'] : $defaultConfig['website_record_no'];
		$this->assign('web', $web, TRUE);
		$homemenu = $ci->config->item('user_home_menu');
		$this->assign('homemenu', $homemenu, TRUE);
		$this->_renderLayout($template, $dir, $data);
	}
	
}
/* End of file Smarty_ext.php */
/* Location: ./application/libraries/Smarty_ext.php */