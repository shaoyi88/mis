<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 信息管理<span class="c-gray en">&gt;</span> 文档管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<div id="uploader">
    		<div id="thelist" class="uploader-list"></div>
    			<div class="btns">
       				<div id="picker">选择文件</div>
    			</div>
			</div>
	 </div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无文件</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>文件名</th>
          			<th>文件大小</th>
          			<th>创建时间</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['file_name']}</td>
        			<td>{format_size_str($item['file_size'])}</td>
        			<td>{date('Y-m-d',$item['add_time'])}</td>
          			<td>
          				<a class="btn btn-primary radius ml-5" title="下载" href="{$item['file_path']}" style="text-decoration:none">下载</a>
          				<a class="btn btn-primary radius ml-5 del" did="{$item['file_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<input type="hidden" id="uploadUrl" value="{formatUrl('netdisk/fileUpload')}"></input>
<input type="hidden" id="delUrl" value="{formatUrl('netdisk/fileDoDel?did=')}{$did}"></input>
<input type="hidden" id="did" value="{$did}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/netdisk.js"></script>