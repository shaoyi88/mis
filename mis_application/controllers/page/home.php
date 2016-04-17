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
		if(isset($weatherinfo[0]['status'])&&$weatherinfo[0]['status']=='ok'){
			$data['weatherNow'] = $weatherinfo[0]['now'];
			//$data['weatherAqi'] = $weatherinfo[0]['aqi'];
		}
		$data['week'] = array("日","一","二","三","四","五","六");
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
}