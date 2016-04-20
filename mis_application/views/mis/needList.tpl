<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 物业服务<span class="c-gray en">&gt;</span> 企业需求管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('property/need')}" method="get">
		<div class="text-c"> 
			<select class="select" id="need_type" name="need_type" style="width:200px">
      			<option value="">请选择类型</option>
      			{foreach $need_type as $key=>$item}
      				<option value="{$key}" {if isset($keyword['need_type']) && $keyword['need_type'] != '' && $keyword['need_type'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="select" id="status" name="status" style="width:200px">
      			<option value="">请选择状态</option>
      			{foreach $need_status as $key=>$item}
      				<option value="{$key}" {if isset($keyword['status']) && $keyword['status'] != '' && $keyword['status'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜企业需求</button>
    	</div>
	</form>
	<div class="mt-20"> 
	</div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无入企业需求</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
        			<th>企业</th>
          			<th>需求类型</th>
          			<th>提交时间</th>
					<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$item['enterprise_name']}</td>
          				<td>{$need_type[$item['need_type']]}</td>
          				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>{$need_status[$item['status']]}</td>
          				<td>
          					<a class="btn btn-primary radius" title="查看" href="{formatUrl('property/needDetail?id=')}{$item['need_id']}" style="text-decoration:none">查看</a>
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>