<link rel="stylesheet" type="text/css" href="/public/common/js/drag/drag.css">
<script type="text/javascript" src="/public/common/js/drag/drag.js"></script>
{if $msg}
<p class="fg-red">错误：{$msg}</p>
{/if}
<form name="form1" action="{formatUrl('home/doRegister')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">*登录账号</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="user_account" id="user_account" placeholder="请输入登录账号">
			</div>
			&nbsp;<span class="errorMsg uname"></span>
        </td>
    </tr>
    <tr>
        <th width="15%">*姓名</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="user_name" id="user_name" placeholder="请输入姓名">
			</div>
			&nbsp;<span class="errorMsg username"></span>
        </td>
    </tr>
    <tr>
        <th width="15%">*登录密码</th>
        <td width="85%">
			<div class="input-control">
			    <input type="password" name="user_password" id="user_password" placeholder="请输入密码" >    
			</div>
			&nbsp;<span class="errorMsg upwd"></span>
        </td>
    </tr>
    <tr>
        <th width="15%">*确认密码</th>
        <td width="85%">
			<div class="input-control">
			    <input type="password" name="user_password_re" id="user_password_re" placeholder="请再次输入密码"> 
			</div>
			&nbsp;<span class="errorMsg upwdre"></span>
        </td>
    </tr>
    <tr>
        <th width="15%">*请拖动验证</th>
        <td width="85%">
			<div class="input-control">
			    <div id="drag"></div>
			</div>
			&nbsp;<span class="errorMsg dodrag"></span>
        </td>
    </tr>
    <tr>
        <th>&nbsp;</th>
        <td><button class="button primary block-shadow-success dosubmit">提交</button></td>
    </tr>
</table>
</form>
<div style="min-height:200px;">&nbsp;</div>
<input type="hidden" id="checkAccountUrl" value="{formatUrl('home/checkAccount')}">
<script type="text/javascript">	
$(document).ready(function(){
	$('#drag').drag(); 
});	
function checkform(){
    $('.errorMsg').empty();    
    var user_account = $("#user_account").val();
    if(user_account==''){
        $('.uname').html('登录账号不能为空');
        $("#user_account").focus();
        return false;
    }
    if(user_account.length<4){
        $('.uname').html('登录账号至少为4个字符');
        $("#user_account").focus();
        return false;
    }
    var checkAccount = $('#checkAccountUrl').val()+'?account='+user_account;
    $.ajax({
        type: "GET",
        url: checkAccount,
        dataType: "json",
        success: function(data){
        	if(data.status != 1){
        		$('.uname').html('该登录账号已存在');
                return false;
        	}
        }
    });
    var user_name = $("#user_name").val();
    if(user_name==''){
        $('.username').html('姓名不能为空');
        $("#user_name").focus();
        return false;
    }
    var user_password = $("#user_password").val();
    if(user_password==''){
        $('.upwd').html('密码不能为空');
        $("#user_password").focus();
        return false;
    }
    var user_password_re = $("#user_password_re").val();
    if(user_password_re==''){
        $('.upwdre').html('请确认密码');
        $("#user_password_re").focus();
        return false;
    }
    if(user_password!=user_password_re){
        $('.upwd').html('两次输入的密码不一致');       
        $("#user_password").val('');
        $("#user_password_re").val('');
        $("#user_password").focus();
        return false;
    }
    var dragok = $("#drag").children().is(".handler_ok_bg");
    if(!dragok){
        $('.dodrag').html('请拖动验证');
        return false;
    }
    $(".dosubmit").attr('disabled',true);
    document.form1.submit();
    return false;
}	
</script>