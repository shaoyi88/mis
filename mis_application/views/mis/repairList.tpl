<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 物业服务<span class="c-gray en">&gt;</span> 物业报修管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('property/repair')}" method="get">
		<div class="text-c"> 
			<select class="select" id="repair_type" name="repair_type" style="width:200px">
      			<option value="">请选择类型</option>
      			{foreach $repair_type as $key=>$item}
      				<option value="{$key}" {if isset($keyword['repair_type']) && $keyword['repair_type'] != '' && $keyword['repair_type'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="select" id="status" name="status" style="width:200px">
      			<option value="">请选择状态</option>
      			{foreach $repair_status as $key=>$item}
      				<option value="{$key}" {if isset($keyword['status']) && $keyword['status'] != '' && $keyword['status'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜物业报修单</button>
    	</div>
	</form>
	<div class="mt-20"> 
	</div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无物业报修信息</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>报修类型</th>
          			<th>报修内容</th>
					<th>房号</th>
          			<th>联系人</th>
          			<th>报修时间</th>
					<th>状态</th>
					<th>是否需要领导协助</th>
					<th>附件</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$repair_type[$item['repair_type']]}</td>
          				<td>{$item['repair_content']}</td>
						<td>{$item['room_no']}</td>
          				<td>{$item['contacts']}</td>
          				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>{$repair_status[$item['status']]}</td>
          				<td>{if $item['status'] != 0 && $item['need_help'] == 0}否{else if $item['status'] != 0 && $item['need_help'] == 1}是{/if}</td>
          				<td>
          				{if $item['attachment']}
          				<a class="c-primary" href="{$item['attachment']}" target="_blank"><u class="c-primar">附件下载</u></a>
          				{/if}
          				</td>
          				<td>
          					<a class="btn btn-primary radius" title="查看" href="{formatUrl('property/repairDetail?did=')}{$item['repair_id']}" style="text-decoration:none">查看</a>
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>