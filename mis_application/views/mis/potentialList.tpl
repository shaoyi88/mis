<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 招商管理<span class="c-gray en">&gt;</span> 潜在客户管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div class="mt-20"> 
	</div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无潜在客户</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
        			<th>公司名</th>
			        <th>联系人</th>
			        <th>联系电话</th>
			        <th>提交时间</th>
			        <th>状态</th>
			        <th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$item['enterprise_name']}</td> 
				        <td>{$item['enterprise_contact']}</td> 
				        <td>{$item['enterprise_contact_mobile']}</td> 
				        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td> 
				        <td>{if $item['status'] == 0}待跟进{else}已跟进{/if}</td>
          				<td>
          					{if $item['follow_by'] == 0 && $item['status'] == 0 && checkRight('potential_assign')}
          						<a class="btn btn-primary radius hiddenAssign" title="指派跟进人" href="javascript:;" did="{$item['enterprise_id']}" style="text-decoration:none">指派跟进人</a>
          					{elseif $item['status'] == 0 && $item['follow_by'] == $uid}
          						<a class="btn btn-primary radius hiddenFollow" title="跟进" href="javascript:;" did="{$item['enterprise_id']}" style="text-decoration:none">跟进</a>
          					{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<div class="pd-20 text-c" style="display:none" id="hiddenFollowWindow">
	<form class="Huiform" action="{formatUrl('investment/doFollowPotential')}" method="post">
		<input type="hidden" name="enterprise_id" id="enterprise_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>跟进信息：</th>
          			 <td><textarea style="width:300px;height:140px;" name="msg" cols="" rows="" class="textarea" id="feedback" nullmsg="跟进信息不能为空！" datatype="s"></textarea></td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
          				<input name="status" value="1" type="hidden">
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
      	</table>
	</form>
</div>
<div class="pd-20 text-c" style="display:none" id="hiddenAssignWindow">
	<form class="Huiform" action="{formatUrl('investment/doFollowPotential')}" method="post">
		<input type="hidden" name="enterprise_id" id="f_enterprise_id" value="" />
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
<script type="text/javascript" src="/public/mis/js/hidden.js""></script>