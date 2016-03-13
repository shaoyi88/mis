<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  俱乐部管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('club/userList')}">会员管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('club/userDoAdd')}" method="post">
		{if isset($info)}
		<input name="user_id" type="hidden" value="{$info['user_id']}">
		{/if}
		<input name="user_type" type="hidden" value="1">
		<table class="table table-border table-bordered table-bg">
			<tbody>
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
          		     <th class="text-r" width="180"><span class="c-red">*</span>等级：</th>
          			 <td>
          				<select class="select" id="user_level" name="user_level" nullmsg="等级不能为空！" datatype="*">
      						<option value="">请选择等级</option>
      						<option value="0">0</option>
      						<option value="1">1</option>
      						<option value="2">2</option>
      						<option value="3">3</option>
    					</select>
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
<script type="text/javascript" src="/public/mis/js/club.js"></script>