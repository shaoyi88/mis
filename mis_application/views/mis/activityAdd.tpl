<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  信息管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('activity/index')}">园区活动管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('activity/doAdd')}" method="post">
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
          		     <th class="text-r" width="90"><span class="c-red">*</span>活动限制人数(0为无限制)：</th>
          			 <td>
          			 	 <input name="activity_limit" type="text" class="input-text" id="activity_limit" value="{if isset($info)}{$info['activity_limit']}{/if}" nullmsg="活动限制人数不能为空！" datatype="n">
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90"><span class="c-red">*</span>活动时间：</th>
          			 <td>
          			 	<input value="{if isset($info)}{date('Y-m-d',$info['activity_start_time'])}~{date('Y-m-d',$info['activity_end_time'])}{/if}" type="text" class="input-text" style="width:250px" id="dateRange" nullmsg="活动时间不能为空！" datatype="*">
          			 	<input type="hidden" name="activity_start_time" id="activity_start_time" value="{if isset($info)}{$info['activity_start_time']}{/if}">
          			 	<input type="hidden" name="activity_end_time" id="activity_end_time" value="{if isset($info)}{$info['activity_end_time']}{/if}">
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
<link href="/public/common/css/daterangepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/public/common/js/moment.min.js"></script>
<script type="text/javascript" src="/public/common/js/jquery.daterangepicker.js"></script>
<script type="text/javascript" src="/public/mis/js/activity.js"></script>