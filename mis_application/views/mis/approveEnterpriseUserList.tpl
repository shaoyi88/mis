<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 工作台<span class="c-gray en">&gt;</span> 企业审批<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无待审批的企业用户</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>企业</th>
          			<th>姓名</th>
          			<th>职位</th>
          			<th>申请时间</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['enterprise_name']}</td>
        			<td>{$item['user_name']}</td>
        			<td>{$item['user_position']}</td>
        			<td>{date('Y-m-d H:i:s', $item['add_time'])}</td>
          			<td>
          				{if $item['follow_by'] == 0}
          				<a class="btn btn-primary radius enterpriseUserFollow" href="javascript:;" title="指派跟进人" aid="{$item['apply_id']}" style="text-decoration:none">指派跟进人</a>
          				{else}
          				<a class="btn btn-primary radius enterpriseUserApprove" href="javascript:;" title="审核" eid="{$item['enterprise_id']}" aid="{$item['apply_id']}" uid="{$item['user_id']}" style="text-decoration:none">审核</a>
          				{/if}
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<div class="pd-20 text-c" style="display:none" id="enterpriseUserFollowWindow">
	<form class="Huiform" action="{formatUrl('workbench/doEnterpriseUserFollow')}" method="post">
		<input type="hidden" name="apply_id" id="f_apply_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">跟进人<span class="c-red">*</span></th>
          			<td>
          		     	<select name="follow_by" nullmsg="请选择跟进人" datatype="*">
          		     		<option value="">请选择跟进人</option>
          		     		{foreach $adminList as $item}
          		     			<option value="{$item['admin_id']}">{$item['admin_name']}</option>
          		     		{/foreach}
          		     	</select>
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
<div class="pd-20 text-c" style="display:none" id="enterpriseUserApproveWindow">
	<form class="Huiform" action="{formatUrl('workbench/doApproveEnterpriseUser')}" method="post">
		<input type="hidden" name="apply_id" id="apply_id" value="" />
		<input type="hidden" name="user_id" id="user_id" value="" />
		<input type="hidden" name="enterprise_id" id="enterprise_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">审核结果<span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="status" value="1" nullmsg="审核结果不能为空！" datatype="*">通过
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="status" value="2" nullmsg="审核结果不能为空！" datatype="*">驳回
          		     </td>
        		</tr>
        		<tr>
          		     <th class="text-r">审核意见<span class="c-red">*</span></th>
          		     <td>
          		     	<textarea style="width:300px;height:150px;" name="msg" nullmsg="审核意见不能为空！" datatype="*"></textarea>
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