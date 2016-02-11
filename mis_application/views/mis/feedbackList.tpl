<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 系统管理<span class="c-gray en">&gt;</span> 投诉建议管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('feedback/index')}" method="get">
		<div class="text-c"> 
			<select class="select" id="feedback_type" name="feedback_type" style="width:200px">
      			<option value="">请选择类型</option>
      			{foreach $feedback_type as $key=>$val}
      				<option value="{$key}" {if isset($keyword['feedback_type']) && $keyword['feedback_type'] == $key}selected{/if}>
      				{$val}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<select class="select" id="feedback_status" name="feedback_status" style="width:200px">
      			<option value="">请选择状态</option>
      			{foreach $feedback_status as $key=>$val}
      				<option value="{$key}" {if isset($keyword['feedback_status']) && $keyword['feedback_status'] == $key}selected{/if}>
      				{$val}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</form>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray mt-20"><h2 class="text-c">暂无投诉建议</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover mt-20">
			<thead>
        		<tr class="text-c">
          			<th>类型</th>
          			<th>内容</th>
          			<th>用户</th>
          			<th>添加时间</th>
          			<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$feedback_type[$item['feedback_type']]}</td>
        			<td>{$item['feedback_content']|mb_substr:0:50}</td>
        			<td>{$item['user_name']}</td>
        			<td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
        			<td style="color:{if $item['feedback_status']==0}red{else}green{/if}">{$feedback_status[$item['feedback_status']]}</td>
          			<td>
          				<a class="btn btn-primary radius" title="查看" href="{formatUrl('feedback/detail?did=')}{$item['feedback_id']}" style="text-decoration:none">查看</a>
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
</div>