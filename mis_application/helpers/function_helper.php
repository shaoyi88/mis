<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 *
 * 重定向
 * @param unknown_type $uri
 */
function redirect($uri = '')
{
	header("Location: ".$uri, TRUE, 302);
	exit;
}

/**
 * 
 * 获取当前链接
 * @param unknown_type $noparam
 * @param unknown_type $stripParams
 */
function get_current_uri()
{
	$s = !isset($_SERVER['HTTPS']) ? '' : ($_SERVER['HTTPS'] == 'on' ? 's' : '');
	$protocol = strtolower($_SERVER['SERVER_PROTOCOL']);
	$protocol = substr($protocol, 0, strpos($protocol, '/')) . $s . '://';
	$port = $_SERVER['SERVER_PORT'] == 80 ? '' : ':'.$_SERVER['SERVER_PORT'];
	$server_name = !empty($_SERVER['HTTP_HOST']) ? strtolower($_SERVER['HTTP_HOST']) :
		(!empty($_SERVER['SERVER_NAME']) ? $_SERVER['SERVER_NAME'].$port : getenv('SERVER_NAME').$port);

	$request_uri = $_SERVER['REQUEST_URI'];
	return $protocol.$server_name.$request_uri;
}

/**
 *
 * 格式化url
 * @param unknown_type $uri
 */
function formatUrl($uri = '')
{
	$ci =& get_instance();
	return base_url().config_item('index_page').$ci->rtrDir.$uri;
}

/**
 *
 * 检测后台登录
 */
function checkMisLogin()
{
	$ci =& get_instance();
	$ci->userId = $ci->session->userdata('admin_id');
	$ci->userName = $ci->session->userdata('admin_name');
	$ci->userRights = $ci->session->userdata('admin_rights');
	$ci->userRole = $ci->session->userdata('admin_role');
	if($ci->userId == ''){
		if(strtolower($ci->rtrClass) !== 'login'){
			redirect(formatUrl('login/index'));
		}
	}else{
		if(strtolower($ci->rtrClass) === 'login'){
			redirect(formatUrl('home/index'));
		}
	}
}

/**
 * Format size in special unit
 *
 * @param int $size
 * @param int $unit
 * @param boolean $onlyNum
 * @param int $precision
 * @return mixed
 */
function format_size_str($size, $unit = 0, $onlyNum = FALSE, $precision = 2)
{
	$sizeDef = array(1=>'B', 2=>'K', 3=>'M', 4=>'G', 5=>'T');
	if($size <= 0)
		return $onlyNum ? 0 : (isset($sizeDef[$unit]) ? '0'.$sizeDef[$unit] : '0B');
	if(isset($sizeDef[$unit])){
		$key = $unit;
	}else{
		$key = floor(log($size, 1024)) + 1;
	}

	$key = max(1, min($key, count($sizeDef)));

	return round($size/pow(1024, $key-1), $precision).(!$onlyNum ? $sizeDef[$key] : '');
}

/**
 *
 * 检测前台登录
 */
function checkUserLogin()
{
	$ci =& get_instance();
	$ci->userId = $ci->session->userdata('user_id');
	$ci->userName = $ci->session->userdata('user_name');
	$ci->userRights = $ci->session->userdata('user_rights');
	$ci->userType = $ci->session->userdata('user_type');
	if($ci->userId == ''){
		if(strtolower($ci->rtrClass) !== 'login'){
			redirect(formatUrl('login/index'));
		}
	}else{
		if(strtolower($ci->rtrClass) === 'login'){
			redirect(formatUrl('home/index'));
		}
	}
}

/**
 *
 * 检测权限
 * @param unknown_type $key
 */
function checkRight($key)
{
	if($key == ''){
		return TRUE;
	}
	$ci =& get_instance();
	if($ci->userRights == 'all'){
		return TRUE;
	}else{
		$rightsArr = explode(',', $ci->userRights);
		if(is_string($key) && in_array($key, $rightsArr)){
			return TRUE;
		}
		if(is_array($key)){
			foreach($key as $item){
				if(in_array($item, $rightsArr)){
					return TRUE;
				}
			}
		}
	}
	return FALSE;
}

/**
 *
 * 分页帮助类
 * @param unknown_type $baseUrl
 * @param unknown_type $totalNum
 * @param unknown_type $perNum
 * @param unknown_type $offset
 * @param unknown_type $pageUrl
 */
function page($baseUrl, $totalNum, $perNum, &$offset, &$pageUrl, $query_string_segment=NULL)
{
	$ci =& get_instance();
	$ci->load->library('pagination');
	$config['base_url'] = $baseUrl;
	$config['total_rows'] = $totalNum;
	$config['per_page'] = $perNum;
	$config['page_query_string'] = TRUE;
	$config['use_page_numbers'] = TRUE;
	$config['num_links'] = 5;
	$config['full_tag_open'] = '<div class="page">';
	$config['full_tag_close'] = '</div>';
	$config['prev_link'] = '&lt;上一页';
	$config['next_link'] = '下一页&gt;';
	$config['first_link'] = '首页';
	$config['last_link'] = '末页';
	if($query_string_segment !== NULL){
		$config['query_string_segment'] = $query_string_segment;
	}
	$ci->pagination->initialize($config);
	$pageUrl = $ci->pagination->create_links();
	
	$curPage = 1;
	if($ci->input->get('per_page')){
		$curPage = $ci->input->get('per_page');
	}
	$offset = ($curPage-1)*$perNum;
}

//object转化为array
function object_array($array)
{
	if(is_object($array))
	{
		$array = (array)$array;
	}
	if(is_array($array))
	{
		foreach($array as $key=>$value)
		{
			$array[$key] = object_array($value);
		}
	}
	return $array;
}

/*
 * 前台获取提示信息msg
 * 类型：成功-success；失败-alert；提醒-warning；默认-info
 * 
 */
function getMsg($msg){
	$data = $msgarr = array();
	$data['msg'] = $msg;
	$data['msg'] = urldecode($data['msg']);	
	$msgarr = explode('|',$data['msg']);
    $msgType = array(
    		'成功'=>'success',
    		'失败'=>'alert',
    		'提醒'=>'warning',
    );
	$data['msgType'] = isset($msgType[$msgarr[1]])?$msgType[$msgarr[1]]:'info';
	return $data;
}

/**
 * 
 * 定时提醒
 */
function remind()
{
	$ci =& get_instance();
	$ci->load->model('MIS_Activity');
	$ci->load->model('MIS_User');
	$ci->load->model('MIS_EnterprisePotential');	
	$ci->load->model('MIS_Repair');
	$ci->load->model('MIS_Complain');	
	$ci->load->model('MIS_Apply');
	$ci->load->model('MIS_Room');
	$ci->load->model('MIS_EnterpriseHidden');
	
	
	
	$activityFirstNum = $userFirstNum = $propertyFirstNum = $businessFirstNum = 
	$activitySecondNum = $userSecondNum = $propertySecondNum = $businessSecondNum = 0;
	$msgFirst = $msgSecond = '';
	
	// 获取第一次提醒数据
	$activityFirstNum += $ci->MIS_Activity->getRemindFirstNum();
	$userFirstNum += $ci->MIS_User->getRemindFirstNum();
	$userFirstNum += $ci->MIS_EnterprisePotential->getRemindFirstNum();	
	$propertyFirstNum += $ci->MIS_Repair->getRemindFirstNum();
	$propertyFirstNum += $ci->MIS_Complain->getRemindFirstNum();	
	$businessFirstNum += $ci->MIS_Apply->getRemindFirstNum();
	$businessFirstNum += $ci->MIS_Room->getRemindFirstNum();
	$businessFirstNum += $ci->MIS_EnterpriseHidden->getRemindFirstNum();

	// 发送第一次提醒通知 TODO
	$msgFirst .= $activityFirstNum > 0 ? $activityFirstNum.'项待审批活动,' : '';
	$msgFirst .= $userFirstNum > 0 ? $userFirstNum.'个待审批企业用户,' : '';
	$msgFirst .= $propertyFirstNum > 0 ? $propertyFirstNum.'条待审批物业服务信息,' : '';
	$msgFirst .= $businessFirstNum > 0 ? $businessFirstNum.'条待审批企业服务信息,' : '';
	$msgFirst = $msgFirst != '' ? '您有以下待处理事项:'.substr($msgFirst,0,strlen($msgFirst)-1): '';
	
	
	// 发送成功更新第一次提醒
	/*
	$ci->MIS_Activity->updataRemindFitst();
	$ci->MIS_User->updataRemindFitst();
	$ci->MIS_EnterprisePotential->updataRemindFitst();
	$ci->MIS_Repair->updataRemindFitst();
	$ci->MIS_Complain->updataRemindFitst();
	$ci->MIS_Apply->updataRemindFitst();
	$ci->MIS_Room->updataRemindFitst();
	$ci->MIS_EnterpriseHidden->updataRemindFitst();
	*/
	
	// 获取第二次提醒数据
	$activitySecondNum += $ci->MIS_Activity->getRemindSecondNum();
	$userSecondNum += $ci->MIS_User->getRemindSecondNum();
	$userSecondNum += $ci->MIS_EnterprisePotential->getRemindSecondNum();
	$propertySecondNum += $ci->MIS_Repair->getRemindSecondNum();
	$propertySecondNum += $ci->MIS_Complain->getRemindSecondNum();
	$businessSecondNum += $ci->MIS_Apply->getRemindSecondNum();
	$businessSecondNum += $ci->MIS_Room->getRemindSecondNum();
	$businessSecondNum += $ci->MIS_EnterpriseHidden->getRemindSecondNum();

	// 发送第二次提醒通知 TODO
	$msgSecond .= $activitySecondNum > 0 ? $activitySecondNum.'项待审批活动,' : '';
	$msgSecond .= $userSecondNum > 0 ? $userSecondNum.'个待审批企业用户,' : '';
	$msgSecond .= $propertySecondNum > 0 ? $propertySecondNum.'条待审批物业服务信息,' : '';
	$msgSecond .= $businessSecondNum > 0 ? $businessSecondNum.'条待审批企业服务信息,' : '';
	$msgSecond = $msgSecond != '' ? '您有以下待处理事项:'.substr($msgSecond,0,strlen($msgSecond)-1): '';
	
	// 发送成功更新第二次提醒
	/*
	$ci->MIS_Activity->updataRemindSecond();
	$ci->MIS_User->updataRemindSecond();
	$ci->MIS_EnterprisePotential->updataRemindFitst();
	$ci->MIS_Repair->updataRemindSecond();
	$ci->MIS_Complain->updataRemindSecond();
	$ci->MIS_Apply->updataRemindSecond();
	$ci->MIS_Room->updataRemindSecond();
	$ci->MIS_EnterpriseHidden->updataRemindSecond();
	*/
}

/**
 * 
 * 人民币转大写
 * @param unknown_type $ns
 */
function cny($ns) { 
	$cnums = array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖");
    $cnyunits = array("圆","角","分");
    $grees = array("拾","佰","仟","万","拾","佰","仟","亿"); 
    $result = explode(".",$ns,2); 
    $ns1 = $result[0];
   	if(isset($result[1])){
   		$ns2 = $result[1];
   		$ns2=isset($ns2[1]) ? array($ns2[1],$ns2[0]) : array($ns2[0]);
    	$ret=array_merge($ns2,array(implode("",_cny_map_unit(str_split($ns1),$grees)),"")); 
   	}else{
   		$ret=array(implode("",_cny_map_unit(str_split($ns1),$grees)),""); 
   	}
    $ret=implode("",array_reverse(_cny_map_unit($ret,$cnyunits))); 
    return str_replace(array_keys($cnums),$cnums,$ret); 
}

/**
 * 
 * 人民币转大写辅助函数
 * @param unknown_type $ns
 */
function _cny_map_unit($list,$units) { 
    $ul=count($units); 
    $xs=array(); 
    foreach (array_reverse($list) as $x) { 
        $l=count($xs); 
        if ($x!="0" || !($l%4)) {
        	$n=($x=='0'?'':$x).(isset($units[($l-1)%$ul])?$units[($l-1)%$ul]:''); 
        }else {
        	$n=is_numeric($xs[0][0])?$x:''; 
        }
        array_unshift($xs,$n); 
    } 
    return $xs; 
}