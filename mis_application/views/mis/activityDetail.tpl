<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  信息管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('activity/index')}">园区活动管理</a> <span class="c-gray en">&gt;</span> 查看/审核</nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
		<div class="tabBar cl"><span>活动详情</span><span>活动报名</span><span>活动评论</span></div>
		<div class="tabCon">
			<form class="Huiform" id="form-role-add" action="{formatUrl('activity/doAudit')}" method="post">
				<table class="table table-border table-bordered table-bg">
					<tbody>
						<tr>
		          		     <th class="text-r" width="180">活动标题：</th>
		          			 <td>{$info['activity_title']}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">活动内容：</th>
		          			 <td>{$info['activity_content']}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">活动限制人数：</th>
		          			 <td>{$info['activity_limit']}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">活动时间：</th>
		          			 <td>{date('Y-m-d',$info['activity_start_time'])}~{date('Y-m-d',$info['activity_end_time'])}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">审核状态：</th>
		          			 <td>{$activity_audit_type[$info['activity_status']]}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">是否需要领导协助：</th>
		          			 <td>{if $info['activity_status'] != 0 && $info['need_help'] == 0}否{else if $info['activity_status'] != 0 && $info['need_help'] == 1}是{/if}</td>
		        		</tr>
		        		{if $info['attachment']}
		        		<tr>
		          		     <th class="text-r" width="180">附件：</th>
		          			 <td><a class="c-primary" href="{$info['attachment']}" target="_blank"><u class="c-primar">附件下载</u></a></td>
		        		</tr>
		        		{/if}
		        		{if $info['activity_audit_msg']}
		        		<tr>
		          		     <th class="text-r" width="180">审核意见：</th>
		          			 <td>{$info['activity_audit_msg']}</td>
		        		</tr>
		        		{/if}
		        		<tr>
		          		     <th class="text-r" width="180">添加人：</th>
							 <td>{if $info['user_name']}{$info['user_name']}{else}{$info['admin_name']}{/if}</td
						</tr>
		        		{if checkRight('activity_audit') && $info['activity_status'] == 0 && $info['follow_by'] == $userId}
		        		<tr>
		          		     <th class="text-r" style="width:100px">审核结果<span class="c-red">*</span></th>
		          			<td>
		          		     	<input type="radio" name="activity_status" value="1" nullmsg="审核结果不能为空！" datatype="*">通过
		          		     	&nbsp;&nbsp;
		          		     	<input type="radio" name="activity_status" value="2" nullmsg="审核结果不能为空！" datatype="*">驳回
		          		     </td>
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
		          		     <th class="text-r">审核意见<span class="c-red">*</span></th>
		          		     <td>
		          		     	<textarea style="width:300px;height:150px;" name="activity_audit_msg" nullmsg="审核意见不能为空！" datatype="*"></textarea>
		          		     </td>
		          		</tr> 
		          		<tr>
		        			<th></th>
		      				<td colspan="2">
		      					<input name="activity_id" type="hidden" value="{$info['activity_id']}">
		      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
		      				</td>
		      			</tr>
		        		{/if}
		        		{if checkRight('activity_assign') && $info['activity_status'] == 0 && $info['follow_by'] == 0}
		        		<tr>
		          		     <th class="text-r" style="width:100px">指派跟进人<span class="c-red">*</span></th>
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
		      					<input name="activity_id" type="hidden" value="{$info['activity_id']}">
		      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
		      				</td>
		      			</tr>
		        		{/if}
		        	</tbody>
				</table>
			</form>
		</div>
		<div class="tabCon">
			{if empty($registerList)}
	 			<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无报名</h2></div>
	 		{else}
	 			<table class="table table-border table-bg table-bordered table-hover">
					<thead>
        				<tr class="text-c">
          					<th>用户</th>
          					<th>报名时间</th>
          					<th>操作</th>
        				</tr>
      				</thead>
      				<tbody>
      				{foreach $registerList as $item}
      				<tr class="text-c">
      					<td>{$item['user_name']}</td>
        				<td>{date('Y-m-d',$item['add_time'])}</td>
        				<td>
          					{if checkRight('activity_register_del')}<a class="btn btn-primary radius delRegister" did="{$item['register_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          				</td>
          			</tr>
      				{/foreach}
					</tbody>
				</table>
	 		{/if}
	 		{if isset($registerPageUrl)}{$registerPageUrl}{/if}
		</div>
		<div class="tabCon">
			{if empty($commentList)}
	 			<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无评论</h2></div>
	 		{else}
	 			<table class="table table-border table-bg table-bordered table-hover">
					<thead>
        				<tr class="text-c">
          					<th>用户</th>
          					<th>评论内容</th>
          					<th>评论时间</th>
          					<th>操作</th>
        				</tr>
      				</thead>
      				<tbody>
      				{foreach $commentList as $item}
      				<tr class="text-c">
      					<td>{$item['user_name']}</td>
      					<td>{$item['comment']}</td>
        				<td>{date('Y-m-d',$item['add_time'])}</td>
        				<td>
          					{if checkRight('activity_comment_del')}<a class="btn btn-primary radius delComment" did="{$item['comment_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          				</td>
          			</tr>
      				{/foreach}
					</tbody>
				</table>
	 		{/if}
	 		{if isset($commentPageUrl)}{$commentPageUrl}{/if}
		</div>
	</div>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="{formatUrl('activity/index')}" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/mis/js/activity.js""></script>
<script type="text/javascript">
$(function(){
	$.Huitab("#tab-system .tabBar span","#tab-system .tabCon","current","click","{if $type}{$type}{else}0{/if}");
});
</script>
<input type="hidden" id="delRegisterUrl" value="{formatUrl('activity/doDelRegister?aid=')}{$info['activity_id']}"></input>
<input type="hidden" id="delCommentUrl" value="{formatUrl('activity/doDelComment?aid=')}{$info['activity_id']}"></input>
<input type="hidden" id="uploadUrl" value="{formatUrl('file/upload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/file.js""></script>