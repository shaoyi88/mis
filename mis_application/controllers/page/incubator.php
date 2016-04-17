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
		$browser = $_SERVER["HTTP_USER_AGENT"];		
		if(strpos($browser,"MSIE")){			
		  $v = substr($browser,strpos($browser,"MSIE")+5,1);
		  if($v<9){
		  	echo "您的浏览器太旧了，是时候 <a href='http://browsehappy.com/'>更换一个更好的浏览器</a> 来提升用户体验";
		  	return;
		  }
		}
		$data = array();
		$this->showView('incubator', $data);
	}
	
}