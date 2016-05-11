<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 企业服务<span class="c-gray en">&gt;</span> 项目需求管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('project/index')}" method="get">
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
      			{foreach $apply_status as $key=>$item}
      				<option value="{$key}" {if isset($keyword['status']) && $keyword['status'] != '' && $keyword['status'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜项目需求申请单</button>
    	</div>
	</form>
	<div class="mt-20"> 
	</div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无项目需求申请单</h2></div>
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
          					{if checkRight('project_apply_confirm') && $item['status'] == 0 && $item['follow_by'] == $userId}
          						<a did="{$item['apply_id']}" class="btn btn-primary radius ml-5 applyConfirm" title="跟进" href="javascript:;" style="text-decoration:none">跟进</a>
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
<div class="pd-20 text-c" style="display:none" id="applyWindow">
	<form class="Huiform" action="{formatUrl('project/doConfirmApply')}" method="post">
		<input type="hidden" name="apply_id" id="apply_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>跟进信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="msg" cols="" rows="" class="textarea" id="msg" nullmsg="跟进信息不能为空！" datatype="s"></textarea></td>
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
<script type="text/javascript" src="/public/mis/js/project.js""></script>