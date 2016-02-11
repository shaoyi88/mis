<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  系统管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('feedback/index')}">投诉建议管理</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('feedback/doReply')}" method="post">
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">类型：</th>
          			 <td>{$feedback_type[$info['feedback_type']]}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">内容：</th>
          			 <td>{$info['feedback_content']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">用户：</th>
          			 <td>{$info['user_name']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">添加时间：</th>
          			 <td>{date('Y-m-d H:i:s',$info['add_time'])}</td>
        		</tr>
        		{if $info['feedback_status'] == 1}
        		<tr>
          		     <th class="text-r" width="180">回复内容：</th>
          			 <td>{$info['reply_content']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">回复时间：</th>
          			 <td>{date('Y-m-d H:i:s',$info['reply_time'])}</td>
        		</tr>
        		{/if}
        		{if $info['feedback_status'] == 0 && checkRight('feedback_reply')}
        		<tr>
          		     <th class="text-r" width="180">回复：</th>
          			 <td><textarea style="width:1000px;height:240px;" name="reply_content" cols="" rows="" class="textarea" id="reply_content" nullmsg="回复不能为空！" datatype="*"></textarea></td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
          				<input name="feedback_id" value="{$info['feedback_id']}" type="hidden"></input>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
        		{/if}
        	</tbody>
		</table>
	</form>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/mis/js/feedback.js""></script>