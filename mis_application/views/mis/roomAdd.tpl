<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  企业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('room/roomList?t=')}{$t}"> {$room_type[$t]}管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('room/doAdd')}" method="post">
		{if isset($info)}
		<input name="room_id" type="hidden" value="{$info['room_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
        		<tr>
          		     <th class="text-r" width="180">{$room_type[$t]}名字<span class="c-red">*</span>：</th>
          			 <td>
          			 	<input nullmsg="请输入{$room_type[$t]}名字！" datatype="s" class="input-text" style="width:250px" name="room_name" id="room_name" type="text" value="{if isset($info)}{$info['room_name']}{/if}" placeholder="输入{$room_type[$t]}名字">
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">{$room_type[$t]}位置<span class="c-red">*</span>：</th>
          			 <td>
          			 	<input nullmsg="请输入{$room_type[$t]}位置！" datatype="*" class="input-text" style="width:250px" name="room_address" id="room_address" type="text" value="{if isset($info)}{$info['room_address']}{/if}" placeholder="输入{$room_type[$t]}位置">
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">容纳人数<span class="c-red">*</span>：</th>
          			 <td>
          			 	<input nullmsg="请输入容纳人数！" errormsg="请输入数字" datatype="n" class="input-text" style="width:250px" name="room_capacity" id="room_capacity" type="text" value="{if isset($info)}{$info['room_capacity']}{/if}" placeholder="输入容纳人数">
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90">描述<span class="c-red">*</span></th>
          			 <td>
          			 	<textarea style="width:1000px;height:240px;" name="room_desc" cols="" rows="" class="textarea" id="room_desc" nullmsg="描述不能为空！" datatype="*">{if isset($info)}{$info['room_desc']}{/if}</textarea>
          			 </td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>         				
          				<input name="room_type" type="hidden" value="{$t}">
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
<script type="text/javascript" src="/public/mis/js/room.js""></script>