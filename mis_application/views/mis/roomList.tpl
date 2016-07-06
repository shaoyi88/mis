<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 企业服务<span class="c-gray en">&gt;</span> {$room_type[$keyword['t']]}管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		{if checkRight('room_add')}
		<span class="l">
			<a href="{formatUrl('room/add?t=')}{$keyword['t']}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加{$room_type[$keyword['t']]}</a>
		</span>
		{/if}
		{if checkRight('room_used_export')}
		<span class="l">
			&nbsp;&nbsp;
			<a href="{formatUrl('room/export?t=')}{$keyword['t']}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 导出{$room_type[$keyword['t']]}使用情况登记表</a>
		</span>
		{/if}
	 </div>
	 
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无{$room_type[$keyword['t']]}信息</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>名称</th>
          			<th>位置</th>
          			<th>容纳人数</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$item['room_name']}</td>
          				<td>{$item['room_address']}</td>
          				<td>{$item['room_capacity']}</td>
          				<td>
          					<a class="btn btn-primary radius" title="查看预订情况" href="{formatUrl('room/detail?did=')}{$item['room_id']}&t={$keyword['t']}" style="text-decoration:none">查看预订情况</a>
          					{if checkRight('room_edit')}<a class="ml-5 btn btn-primary radius" title="编辑" href="{formatUrl('room/add?did=')}{$item['room_id']}&t={$keyword['t']}" style="text-decoration:none">编辑</a>{/if}
          					{if checkRight('room_del')}<a title="删除" href="javascript:;" class="ml-5 del btn btn-primary radius" did="{$item['room_id']}" style="text-decoration:none">删除</a>{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/room.js""></script>
<input type="hidden" id="delUrl" value="{formatUrl('room/doDel?t=')}{$keyword['t']}"></input>