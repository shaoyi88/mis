<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  用户管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('user/index')}">园区用户管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('user/doAdd')}" method="post">
		{if isset($info)}
		<input name="user_id" type="hidden" value="{$info['user_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">{if !isset($info)}<span class="c-red">*</span>{/if}用户类型：</th>
          			 <td>
          			 	{if !isset($info)}
          			 	<select class="select" id="user_type" name="user_type" nullmsg="用户类型不能为空！" datatype="*">
      						<option value="">请选择用户类型</option>
      						{foreach $user_type as $key=>$item}
      						<option value="{$key}">
      						{$item}
      						</option>
      						{/foreach}
    					</select>
    					{else}
    					{$user_type[$info['user_type']]}{if $info['user_second_type']}-{$user_second_type[$info['user_second_type']]}{/if}
    					{/if}
          			 </td>
        		</tr>
        		{if !isset($info)}
        		<tr style="display:none" id="td_user_second_type">
          		     <th class="text-r" width="180">{if !isset($info)}<span class="c-red">*</span>{/if}用户二级类型：</th>
          			 <td>
          			 	<select class="select" id="user_second_type" name="user_second_type" nullmsg="用户二级类型不能为空！" datatype="*">
      						<option value="">请选择用户二级类型</option>
      						{foreach $user_second_type as $key=>$item}
      						<option value="{$key}">
      						{$item}
      						</option>
      						{/foreach}
    					</select>
          			 </td>
        		</tr>
        		{/if}
				<tr>
          		     <th class="text-r" width="180">{if !isset($info)}<span class="c-red">*</span>{/if}账户：</th>
          			 <td><input name="user_account" type="text" {if isset($info)}disabled{/if} class="input-text" id="user_account" value="{if isset($info)}{$info['user_account']}{/if}" nullmsg="账户不能为空！" datatype="s"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">{if !isset($info)}<span class="c-red">*</span>{/if}密码{if isset($info)}(留空则不修改){/if}：</th>
          			 <td><input name="user_password" type="password" class="input-text" id="user_password" value="" {if !isset($info)}nullmsg="密码不能为空！" datatype="s"{/if}></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>昵称：</th>
          			 <td><input name="user_nickname" type="text" class="input-text" id="user_nickname" value="{if isset($info)}{$info['user_nickname']}{/if}" nullmsg="昵称不能为空！" datatype="s"></td>
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
<script type="text/javascript" src="/public/mis/js/user.js"></script>