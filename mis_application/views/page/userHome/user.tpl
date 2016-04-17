<h3>账户设置</h3>
<form action="{formatUrl('myhome/do_user_setting')}" method="post" enctype="multipart/form-data">
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">昵称</th>
        <td width="85%">
			<div class="input-control text">
			    <input type="text" name="user_nickname" value="{$info['user_nickname']}">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">登录账号</th>
        <td width="85%">
			<div class="input-control text">
			    <input type="text" name="user_account" value="{$info['user_account']}">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">姓名</th>
        <td width="85%">
			<div class="input-control text">
			    <input type="text" name="user_name" value="{$info['user_name']}">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">手机号码</th>
        <td width="85%">
			<div class="input-control text">
			    <input type="text" name="user_mobile" value="{$info['user_mobile']}">
			</div>
        </td>
    </tr>
    <tr>
        <th>&nbsp;</th>
        <td><button class="button primary block-shadow-success" type="submit">保存</button></td>
    </tr>
</table>
</form>