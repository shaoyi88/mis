<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 信息管理<span class="c-gray en">&gt;</span> 文档管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	{if checkRight('dir_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('netdisk/dirAdd')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加目录</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无目录</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>目录名</th>
          			<th>目录描述</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['dir_name']}</td>
        			<td>{$item['dir_desc']}</td>
          			<td>
          				{if $userRole == 0 || in_array($userRole, explode(',', $item['dir_role']))}<a class="btn btn-primary radius" title="浏览" href="{formatUrl('netdisk/dir?id=')}{$item['dir_id']}" style="text-decoration:none">浏览</a>{/if}
          				{if checkRight('dir_edit') || $adminId == $item['admin_id'] || $userRole == 0 || in_array($userRole, explode(',', $item['dir_role'])) }<a class="btn btn-primary radius ml-5" title="编辑" href="{formatUrl('netdisk/dirAdd?id=')}{$item['dir_id']}" style="text-decoration:none">编辑</a>{/if}
          				{if checkRight('dir_del') || $adminId == $item['admin_id'] || $userRole == 0 || in_array($userRole, explode(',', $item['dir_role'])) }<a class="btn btn-primary radius ml-5 del" did="{$item['dir_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/netdisk.js"></script>
<input type="hidden" id="delUrl" value="{formatUrl('netdisk/dirDoDel')}"></input>