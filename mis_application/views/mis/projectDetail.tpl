<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  企业服务<span class="c-gray en">&gt;</span> <a href="{formatUrl('project/index')}">项目需求管理</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
		<div class="tabBar"><span>项目需求详情</span><span class="tabBar">项目申请情况</span></div>
		<div class="tabCon">
				<table class="table table-border table-bordered table-bg">
					<tbody>
						<tr>
		          		     <th class="text-r" width="180">项目名称：</th>
		          			 <td>{$info['project_name']}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">项目描述：</th>
		          			 <td>{$info['project_desc']}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">添加时间：</th>
		          			 <td>{date('Y-m-d',$info['add_time'])}</td>
		        		</tr>
		        	</tbody>
				</table>
			</form>
		</div>
		<div class="tabCon">
			{if empty($dataList)}
	 			<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无申请</h2></div>
	 		{else}
	 			<table class="table table-border table-bg table-bordered table-hover">
					<thead>
        				<tr class="text-c">
          					<th>用户</th>
          					<th>联系电话</th>
          					<th>联系邮箱</th>
          					<th>申请时间</th>
          					<th>状态</th>
          					<th>操作</th>
        				</tr>
      				</thead>
      				<tbody>
      				{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$item['contacts']}</td>
      					<td>{$item['contacts_phone']}</td>
      					<td>{$item['contacts_email']}</td>
        				<td>{date('Y-m-d',$item['add_time'])}</td>
        				<td>{$project_apply_status[$item['status']]}</td>
        				<td>
          					{if checkRight('project_apply_confirm') && $item['status'] == 0 && $item['follow_by'] == $userId}
          						<a did="{$item['apply_id']}" class="btn btn-primary radius ml-5 applyConfirm" title="确认" href="javascript:;" style="text-decoration:none">确认</a>
          					{/if}
          					{if checkRight('project_apply_assign') && $item['status'] == 0 && $item['follow_by'] == 0}
          						<a did="{$item['apply_id']}" class="btn btn-primary radius ml-5 applyFollow" title="指派跟进人" href="javascript:;" style="text-decoration:none">指派跟进人</a>
          					{/if}
          				</td>
          			</tr>
      				{/foreach}
					</tbody>
				</table>
	 		{/if}
	 		{if isset($pageUrl)}{$pageUrl}{/if}
		</div>
	</div>
</div>
<div class="pd-20 text-c" style="display:none" id="applyWindow">
	<form class="Huiform" action="{formatUrl('project/doConfirmApply')}" method="post">
		<input type="hidden" name="apply_id" id="apply_id" value="" />
		<input type="hidden" name="project_id" id="project_id" value="{$info['project_id']}" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>确认信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="feedback" cols="" rows="" class="textarea" id="feedback" nullmsg="确认信息不能为空！" datatype="s"></textarea></td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
      	</table>
	</form>
</div>
<div class="pd-20 text-c" style="display:none" id="followWindow">
	<form class="Huiform" action="{formatUrl('project/doConfirmApply')}" method="post">
		<input type="hidden" name="apply_id" id="f_apply_id" value="" />
		<input type="hidden" name="project_id" value="{$info['project_id']}" />
		<table class="table table-bg table-border table-bordered">
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
          			<td>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
      	</table>
	</form>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="{formatUrl('project/index')}" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/mis/js/project.js""></script>
<script type="text/javascript">
$(function(){
	$.Huitab("#tab-system .tabBar span","#tab-system .tabCon","current","click","{if $type}{$type}{else}0{/if}");
});
</script>