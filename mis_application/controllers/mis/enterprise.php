<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Enterprise extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 入驻企业首页
	 */
	public function index()
	{
		$data = array();
		if(checkRight('enterprise_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
		}
		$this->load->model('MIS_Enterprise');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('enterprise/index').'?', $this->MIS_Enterprise->getCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Enterprise->getList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$this->showView('enterpriseList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑用户
	 */
	public function add()
	{
		$data = array();
		if($this->input->get('id')){
			if(checkRight('enterprise_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$id = $this->input->get('id');
			$this->load->model('MIS_Enterprise');
			$data['info'] = $this->MIS_Enterprise->getInfo($id);
			$data['typeMsg'] = '编辑';
		}else{
			if(checkRight('enterprise_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->showView('enterpriseAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑逻辑
	 */
	public function doAdd()
	{
		$data = array();
		if($this->input->post('enterprise_id')){
			if(checkRight('enterprise_edit') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			unset($data['file']);
			$data['enterprise_reg_time'] = strtotime($data['enterprise_reg_time']);
			$data['enterprise_enter_time'] = strtotime($data['enterprise_enter_time']);
			$this->load->model('MIS_Enterprise');
			$this->MIS_Enterprise->update($data);
			redirect(formatUrl('enterprise/index'));
		}else{
			if(checkRight('enterprise_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			unset($data['file']);
			$data['enterprise_reg_time'] = strtotime($data['enterprise_reg_time']);
			$data['enterprise_enter_time'] = strtotime($data['enterprise_enter_time']);
			$this->load->model('MIS_Enterprise');
			$msg = '';
			$info = $this->MIS_Enterprise->queryByName($data['enterprise_name']);
			if(empty($info)){
				if($this->MIS_Enterprise->add($data) === FALSE){
					$msg = '&msg='.urlencode('创建失败');
				}
			}else{
				$msg = '&msg='.urlencode('该入驻企业已存在，请勿重复新增');
			}
			redirect(formatUrl('enterprise/index?'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除
	 */
	public function doDel()
	{
		$data = array();
		if(checkRight('enterprise_del') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Enterprise');
		$this->MIS_Enterprise->del($id);
		redirect(formatUrl('enterprise/index'));
	}
	
	/**
	 * 
	 * 文件上传
	 */
	public function fileUpload()
	{
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Pragma: no-cache");
		header("Content-Type:text/html;charset=utf-8");
		
		if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    		exit; // finish preflight CORS requests here
		}

		@set_time_limit(5 * 60);
		$targetDir = 'upload_tmp';
		$uploadDir = 'upload/licence';
		$cleanupTargetDir = true; // Remove old files
		$maxFileAge = 5 * 3600; // Temp file age in seconds
		// Create target dir
		if (!file_exists($targetDir)) {
		    @mkdir($targetDir);
		}
		// Create target dir
		if (!file_exists($uploadDir)) {
		    @mkdir($uploadDir);
		}
		// Get a file name
		if (isset($_REQUEST["name"])) {
		    $fileName = $_REQUEST["name"];
		} elseif (!empty($_FILES)) {
		    $fileName = $_FILES["file"]["name"];
		} else {
		    $fileName = uniqid("file_");
		}
		$fileName = iconv("UTF-8", "GBK", $fileName); 
		$filePath = $targetDir . DIRECTORY_SEPARATOR . $fileName;
		$uploadPath = $uploadDir . DIRECTORY_SEPARATOR . $fileName;

		// Chunking might be enabled
		$chunk = isset($_REQUEST["chunk"]) ? intval($_REQUEST["chunk"]) : 0;
		$chunks = isset($_REQUEST["chunks"]) ? intval($_REQUEST["chunks"]) : 1;
		// Remove old temp files
		if ($cleanupTargetDir) {
		    if (!is_dir($targetDir) || !$dir = opendir($targetDir)) {
		        die('{"jsonrpc" : "2.0", "error" : {"code": 100, "message": "Failed to open temp directory."}, "id" : "id"}');
		    }
		    while (($file = readdir($dir)) !== false) {
		        $tmpfilePath = $targetDir . DIRECTORY_SEPARATOR . $file;
		        // If temp file is current file proceed to the next
		        if ($tmpfilePath == "{$filePath}_{$chunk}.part" || $tmpfilePath == "{$filePath}_{$chunk}.parttmp") {
		            continue;
		        }
		        // Remove temp file if it is older than the max age and is not the current file
		        if (preg_match('/\.(part|parttmp)$/', $file) && (@filemtime($tmpfilePath) < time() - $maxFileAge)) {
		            @unlink($tmpfilePath);
		        }
		    }
		    closedir($dir);
		}
		// Open temp file
		if (!$out = @fopen("{$filePath}_{$chunk}.parttmp", "wb")) {
		    die('{"jsonrpc" : "2.0", "error" : {"code": 102, "message": "Failed to open output stream."}, "id" : "id"}');
		}
		if (!empty($_FILES)) {
		    if ($_FILES["file"]["error"] || !is_uploaded_file($_FILES["file"]["tmp_name"])) {
		        die('{"jsonrpc" : "2.0", "error" : {"code": 103, "message": "Failed to move uploaded file."}, "id" : "id"}');
		    }
		    // Read binary input stream and append it to temp file
		    if (!$in = @fopen($_FILES["file"]["tmp_name"], "rb")) {
		        die('{"jsonrpc" : "2.0", "error" : {"code": 101, "message": "Failed to open input stream."}, "id" : "id"}');
		    }
		} else {
		    if (!$in = @fopen("php://input", "rb")) {
		        die('{"jsonrpc" : "2.0", "error" : {"code": 101, "message": "Failed to open input stream."}, "id" : "id"}');
		    }
		}
		while ($buff = fread($in, 4096)) {
		    fwrite($out, $buff);
		}
		@fclose($out);
		@fclose($in);
		rename("{$filePath}_{$chunk}.parttmp", "{$filePath}_{$chunk}.part");
		$index = 0;
		$done = true;
		for( $index = 0; $index < $chunks; $index++ ) {
		    if ( !file_exists("{$filePath}_{$index}.part") ) {
		        $done = false;
		        break;
		    }
		}
		if ( $done ) {
		    if (!$out = @fopen($uploadPath, "wb")) {
		        die('{"jsonrpc" : "2.0", "error" : {"code": 102, "message": "Failed to open output stream."}, "id" : "id"}');
		    }
		    if ( flock($out, LOCK_EX) ) {
		        for( $index = 0; $index < $chunks; $index++ ) {
		            if (!$in = @fopen("{$filePath}_{$index}.part", "rb")) {
		                break;
		            }
		            while ($buff = fread($in, 4096)) {
		                fwrite($out, $buff);
		            }
		            @fclose($in);
		            @unlink("{$filePath}_{$index}.part");
		        }
		        flock($out, LOCK_UN);
		    }
		    @fclose($out);
		}

		// Return Success JSON-RPC response
		$data['file_name'] = $this->input->post('name');
		$filePath = '/'.$uploadDir.'/'.$data["file_name"];
		die('{"jsonrpc" : "2.0", "result" : "'.$filePath.'", "id" : "id"}');
	}
	
	/**
	 * 
	 * 详情
	 */
	public function detail()
	{
		$data = array();
		if(checkRight('enterprise_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		$id = $this->input->get('id');
		$this->load->model('MIS_Enterprise');
		$data['info'] = $this->MIS_Enterprise->getInfo($id);
		$this->showView('enterpriseDetail', $data);
	}
	
	/**
	 * 
	 * 获取企业
	 */
	public function getEnterprise()
	{
		if($this->input->get('key')){
			$key = $this->input->get('key');
		}
		$this->load->model('MIS_Enterprise');
		$enterpriseList = $this->MIS_Enterprise->queryEnterpriseByKey($key);	
		if(empty($enterpriseList)){			
			$this->send_json(array('status'=>0));
		}else{
			$this->send_json(array('status'=>1,'enterpriseList'=>$enterpriseList));
		}
	}
}