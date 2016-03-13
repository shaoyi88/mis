<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  俱乐部管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('club/activityList')}">活动管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('club/activityDoAdd')}" method="post">
		{if isset($info)}
		<input name="activity_id" type="hidden" value="{$info['activity_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="250"><span class="c-red">*</span>活动标题：</th>
          			 <td><input name="activity_title" type="text" class="input-text" id="activity_title" value="{if isset($info)}{$info['activity_title']}{/if}" nullmsg="活动标题不能为空！" datatype="s"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90"><span class="c-red">*</span>活动内容：</th>
          			 <td>
          			 	<textarea style="width:900px;height:240px;" name="activity_content" cols="" rows="" class="textarea" id="activity_content" nullmsg="活动内容不能为空！" datatype="*">{if isset($info)}{$info['activity_content']}{/if}</textarea>
          			 </td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> {$typeMsg}</button>
          			</td>
        		</tr>
        	</tbody>
		</table>
	</form>
</div>
<link href="/public/common/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="/public/common/js/umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="/public/mis/js/club.js"></script>