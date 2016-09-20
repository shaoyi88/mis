<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Netdisk extends MIS_Controller 
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}
	
	/**
	 * 
	 * 文档管理首页
	 */
	public function dirList()
	{
		$data = array();
		if(checkRight('dir_list') === FALSE){
			$this->showView('denied', $data);
			exit;
		}
		if($this->input->get('msg')){
			$data['msg'] = $this->input->get('msg');
			unset($_GET['msg']);
		}
		$this->load->model('MIS_Netdisk');
		$offset = 0;
		$pageUrl = '';
		page(formatUrl('netdisk/dirList').'?', $this->MIS_Netdisk->getDirCount(), PER_COUNT, $offset, $pageUrl);
		$dataList = $this->MIS_Netdisk->getDirList($offset, PER_COUNT);
		$data['pageUrl'] = $pageUrl;
		$data['dataList'] = $dataList;
		$data['userRole'] = $this->userRole;
		$data['adminId'] = $this->userId;
		$this->showView('dirList', $data);
	}
	
	/**
	 * 
	 * 增加/编辑目录
	 */
	public function dirAdd()
	{
		$data = array();
		if($this->input->get('id')){
			$id = $this->input->get('id');
			$this->load->model('MIS_Netdisk');
			$info = $this->MIS_Netdisk->getDirInfo($id);
			if(checkRight('dir_edit') || $this->userId == $info['admin_id'] || $this->userRole == 0 || in_array($this->userRole, explode(',', $info['dir_role']))){
				$data['info'] = $info;
				$data['roles'] = explode(',', $info['dir_role']);
				$data['typeMsg'] = '编辑';
			}else{
				$this->showView('denied', $data);
				exit;
			}
		}else{
			if(checkRight('dir_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data['typeMsg'] = '新增';
		}
		$this->load->model('MIS_Role');
		$data['roleList'] = $this->MIS_Role->getAll();
		$this->showView('dirAdd', $data);
	}
	
	/**
	 * 
	 * 增加/编辑目录逻辑
	 */
	public function dirDoAdd()
	{
		$data = array();
		if($this->input->post('dir_id')){
			$id = $this->input->post('dir_id');
			$this->load->model('MIS_Netdisk');
			$info = $this->MIS_Netdisk->getDirInfo($id);
			if(checkRight('dir_edit') || $this->userId == $info['admin_id'] || $this->userRole == 0 || in_array($this->userRole, explode(',', $info['dir_role']))){
				$data = $this->input->post();
				$data['dir_role'] = implode(',', $data['dir_role']);
				$this->MIS_Netdisk->updateDir($data);
				redirect(formatUrl('netdisk/dirList'));
			}else{
				$this->showView('denied', $data);
				exit;
			}
		}else{
			if(checkRight('dir_add') === FALSE){
				$this->showView('denied', $data);
				exit;
			}
			$data = $this->input->post();
			$data['dir_role'] = implode(',', $data['dir_role']);
			$data['admin_id'] = $this->userId;
			
			$this->load->model('MIS_Netdisk');
			$msg = '';
			if($this->MIS_Netdisk->addDir($data) === FALSE){
				$msg = '&msg='.urlencode('创建失败');
			}
			redirect(formatUrl('netdisk/dirList?'.$msg));
		}
	}
	
	/**
	 * 
	 * 删除目录
	 */
	public function dirDoDel()
	{
		$data = array();
		$id = $this->input->get('id');
		$this->load->model('MIS_Netdisk');
		$info = $this->MIS_Netdisk->getDirInfo($id);
		if(checkRight('dir_del') || $this->userId == $info['admin_id'] || $this->userRole == 0 || in_array($this->userRole, explode(',', $info['dir_role']))){
			$fileConut = $this->MIS_Netdisk->getFileCount($id);
			if($fileConut > 0){
				redirect(formatUrl('netdisk/dirList?msg='.urlencode('该目录下存在'.$fileConut.'个文件，暂时不可删除')));
			}else{
				$this->MIS_Netdisk->delDir($id);
				redirect(formatUrl('netdisk/dirList'));
			}
			
		}else{
			$this->showView('denied', $data);
			exit;
		}
	}
	
	/*
	 * 浏览目录
	 */
	public function dir()
	{
		$data = array();
		if(($id = $this->input->get('id')) !== FALSE){
			$this->load->model('MIS_Netdisk');
			$info = $this->MIS_Netdisk->getDirInfo($id);
			if($this->userId == $info['admin_id'] || $this->userRole == 0 || in_array($this->userRole, explode(',', $info['dir_role']))){
				$offset = 0;
				$pageUrl = '';
				page(formatUrl('netdisk/dir?id=').$id.'&', $this->MIS_Netdisk->getFileCount($id), PER_COUNT, $offset, $pageUrl);
				$dataList = $this->MIS_Netdisk->getFileList($id, $offset, PER_COUNT);
				$data['pageUrl'] = $pageUrl;
				$data['dataList'] = $dataList;
				$data['did'] = $id;
				$this->showView('dir', $data);
				exit;
			}
		}
		$this->showView('denied', $data);
		exit;
	}
	
	/**
	 * 
	 * 删除文件
	 */
	public function fileDoDel()
	{
		$data = array();
		$did = $this->input->get('did');
		$fid = $this->input->get('id');
		$this->load->model('MIS_Netdisk');
		$info = $this->MIS_Netdisk->getDirInfo($did);
		if($this->userId == $info['admin_id'] || $this->userRole == 0 || in_array($this->userRole, explode(',', $info['dir_role']))){
			$this->MIS_Netdisk->delFile($fid);
			redirect(formatUrl('netdisk/dir?id=').$did);
		}else{
			$this->showView('denied', $data);
			exit;
		}
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
		$uploadDir = 'upload/file';
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
		$fileName = uniqid("file_");
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
		$this->load->model('MIS_Netdisk');
		$data = array();
		$data['dir_id'] = $this->input->post('dirId');
		$data['file_name'] = $fileName;
		$data['file_size'] = $this->input->post('size');
		$data['file_path'] = '/'.$uploadDir.'/'.$data['file_name'];
		$data['add_time'] = time();
		$data['admin_id'] = $this->userId;
		$this->MIS_Netdisk->addFile($data);
		
		// Return Success JSON-RPC response
		die('{"jsonrpc" : "2.0", "result" : null, "id" : "id"}');
	}
}