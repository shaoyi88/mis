<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 工作台<span class="c-gray en">&gt;</span> 活动审批<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无待审批的活动</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>活动标题</th>
          			<th>活动时间</th>
          			<th>活动审核状态</th>
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
        			<td>{if $item['user_name']}{$item['user_name']}{else}{$item['admin_name']}{/if}</td>
          			<td>
          				<a class="btn btn-primary radius auditActivity" href="javascript:;" title="审核" did="{$item['activity_id']}" style="text-decoration:none">审核</a>
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<div class="pd-20 text-c" style="display:none" id="auditWindow">
	<form class="Huiform" action="{formatUrl('workbench/doAuditActivity')}" method="post">
		<input type="hidden" name="activity_id" id="activity_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">审核结果<span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="activity_status" value="1" nullmsg="审核结果不能为空！" datatype="*">通过
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="activity_status" value="2" nullmsg="审核结果不能为空！" datatype="*">驳回
          		     </td>
        		</tr>
        		<tr>
          		     <th class="text-r">审核意见<span class="c-red">*</span></th>
          		     <td>
          		     	<textarea style="width:300px;height:150px;" name="activity_audit_msg" nullmsg="审核意见不能为空！" datatype="*"></textarea>
          		     </td>
          		</tr> 
          		<tr>
        			<th></th>
      				<td colspan="2">
      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
      				</td>
      			</tr>
      	</table>
	</form>
</div>
<script type="text/javascript" src="/public/mis/js/workbench.js""></script>