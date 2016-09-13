<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 信息管理<span class="c-gray en">&gt;</span> 园区活动管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('activity/index')}" method="get">
		<div class="text-c"> 
			<select class="select" id="activity_status" name="activity_status" style="width:200px">
      			<option value="">请选择园区活动审核状态</option>
      			{foreach $activity_audit_type as $key=>$item}
      				<option value="{$key}" {if isset($keyword['activity_status']) && $keyword['activity_status'] != '' && $keyword['activity_status'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜园区活动</button>
		</div>
	</form>
	{if checkRight('activity_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('activity/add')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加园区活动</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无园区活动</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>活动标题</th>
          			<th>活动时间</th>
          			<th>活动审核状态</th>
          			<th>是否需要领导协助</th>
          			<th>附件</th>
          			<th>添加人</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['activity_title']}</td>
        			<td>{date('Y-m-d',$item['activity_start_time'])}~{date('Y-m-d',$item['activity_end_time'])}</td>
        			<td>{$activity_audit_type[$item['activity_status']]}</td>
        			<td>{if $item['activity_status'] != 0 && $item['need_help'] == 0}否{else if $item['activity_status'] != 0 && $item['need_help'] == 1}是{/if}</td>
        			<td>{if $item['attachment']}<a class="c-primary" href="{$item['attachment']}" target="_blank"><u class="c-primar">附件下载</u></a>{/if}</td>
        			<td>{if $item['user_name']}{$item['user_name']}{else}{$item['admin_name']}{/if}</td>
          			<td>
          				<a class="btn btn-primary radius" title="查看/审核" href="{formatUrl('activity/detail?id=')}{$item['activity_id']}" style="text-decoration:none">查看/审核</a>
          				{if checkRight('activity_edit') && $item['admin_id'] == $admin_id}<a class="btn btn-primary radius ml-5" title="编辑" href="{formatUrl('activity/add?id=')}{$item['activity_id']}" style="text-decoration:none">编辑</a>{/if}
          				{if checkRight('activity_del') && $item['admin_id'] == $admin_id}<a class="btn btn-primary radius ml-5 del" did="{$item['activity_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/activity.js"></script>
<input type="hidden" id="delUrl" value="{formatUrl('activity/doDel')}"></input>