<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 物业服务<span class="c-gray en">&gt;</span> 入驻申请管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('property/apply')}" method="get">
		<div class="text-c"> 
			<select class="select" id="apply_type" name="apply_type" style="width:200px">
      			<option value="">请选择类型</option>
      			{foreach $apply_type as $key=>$item}
      				<option value="{$key}" {if isset($keyword['apply_type']) && $keyword['apply_type'] != '' && $keyword['apply_type'] == $key}selected{/if}>
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
    		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜入驻申请单</button>
    	</div>
	</form>
	<div class="mt-20"> 
	</div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无入驻申请单</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>申请类型</th>
          			<th>申请内容</th>
          			<th>联系人</th>
          			<th>申请时间</th>
					<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$apply_type[$item['apply_type']]}</td>
          				<td>{$item['apply_content']}</td>
          				<td>{$item['contacts']}</td>
          				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>{$apply_status[$item['status']]}</td>
          				<td>
          					{if $item['status'] == 0 && checkRight('apply_confirm')}<a class="btn btn-primary radius" id="confirm" title="确认" href="javascript:;" did="{$item['apply_id']}" style="text-decoration:none">确认</a>{/if}
          					{if $item['status'] == 1 && checkRight('apply_confirm')}<a class="btn btn-primary radius" id="finish" title="完成" href="javascript:;" did="{$item['apply_id']}" style="text-decoration:none">完成</a>{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<input type="hidden" id="confirmUrl" value="{formatUrl('property/applyConfirm')}"></input>
<script type="text/javascript" src="/public/mis/js/apply.js""></script>