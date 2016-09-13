<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 招商管理<span class="c-gray en">&gt;</span> 潜在客户管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('investment/addPotential')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加潜在客户</a>
		</span>
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
			        <th>是否需要领导协助</th>
					<th>附件</th>
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
				        <td>{if $item['status'] != 0 && $item['need_help'] == 0}否{else if $item['status'] != 0 && $item['need_help'] == 1}是{/if}</td>
          				<td>
          				{if $item['attachment']}
          				<a class="c-primary" href="{$item['attachment']}" target="_blank"><u class="c-primar">附件下载</u></a>
          				{/if}
          				</td>
          				<td>
          					{if $item['status'] == 0 && checkRight('potential_add')}
          						<a class="btn btn-primary radius" title="编辑" href="{formatUrl('investment/addPotential?id=')}{$item['enterprise_id']}" style="text-decoration:none">编辑</a>
          					{/if}
          					{if $item['status'] == 0 && checkRight('potential_del')}
          						<a class="btn btn-primary radius ml-5 del" did="{$item['enterprise_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>
          					{/if}
          					{if $item['follow_by'] == 0 && $item['status'] == 0 && checkRight('potential_assign')}
          						<a class="btn btn-primary radius hiddenAssign ml-5" title="指派跟进人" href="javascript:;" did="{$item['enterprise_id']}" style="text-decoration:none">指派跟进人</a>
          					{elseif $item['status'] == 0 && $item['follow_by'] == $uid}
          						<a class="btn btn-primary radius hiddenFollow ml-5" title="跟进" href="javascript:;" did="{$item['enterprise_id']}" style="text-decoration:none">跟进</a>
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
          			 <td><textarea style="width:300px;height:140px;" name="msg" cols="" rows="" class="textarea" id="feedback" nullmsg="跟进信息不能为空！" datatype="*"></textarea></td>
        		</tr>
        		<tr>
					<th class="text-r" style="width:100px">是否需要领导协助 <span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="need_help" value="1" nullmsg="请选择是否需要领导协助！" datatype="*">是
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="need_help" value="0" nullmsg="请选择是否需要领导协助！" datatype="*">否
          		     </td>
        		</tr>
				<tr>
					<th class="text-r" style="width:100px">上传附件</th>
          			<td>
          		     	<div id="uploader">
          		     		<div class="btns"><div id="picker">选择文件</div></div>
							<p id="result"></p>
						</div>
						<input type="hidden" name="attachment" value="" id="attachment">
          		    </td>
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
<input type="hidden" id="uploadUrl" value="{formatUrl('file/upload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/file.js""></script>
<script type="text/javascript" src="/public/mis/js/hidden.js""></script>
<input type="hidden" id="delUrl" value="{formatUrl('investment/doDelPotential')}"></input>