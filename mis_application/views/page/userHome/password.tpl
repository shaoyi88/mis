<h3>密码设置</h3>
<form name="form1" action="{formatUrl('myhome/change_password')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">原密码</th>
        <td width="85%">
			<div class="input-control password">
			    <input type="password" name="old_password" id="old_password" placeholder="请输入原来密码">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">新密码</th>
        <td width="85%">
			<div class="input-control password">
			    <input type="password" name="new_password" id="new_password" placeholder="请输入新密码">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">确认新密码</th>
        <td width="85%">
			<div class="input-control password">
			    <input type="password" name="new_password_re" id="new_password_re" placeholder="请再次输入新密码">
			</div>
        </td>
    </tr>
    <tr>
        <th>&nbsp;</th>
        <td><button class="button primary block-shadow-success">保存</button></td>
    </tr>
</table>
</form>
<script>
function checkform(){
    var opwd = $("#old_password").val();
    $(".error").removeClass("error");
    if(opwd==''){
        pushMessage("原来密码不能为空","alert");
        $("#old_password").addClass('error');
        return false;
    }
    var npwd = $("#new_password").val();
    if(npwd==''){
        pushMessage("新密码不能为空","alert");
        $("#new_password").addClass('error');
        return false;
    }
    var npwdr = $("#new_password_re").val();
    if(npwdr==''){
        pushMessage("新密码确认不能为空","alert");
        $("#new_password_re").addClass('error');
        return false;
    }
    if(npwd!=npwdr){
        pushMessage("新密码两次输入不一致","alert");
        $("#new_password").addClass('error');
        return false;
    }
    document.form1.submit();
    return false;
}
</script>