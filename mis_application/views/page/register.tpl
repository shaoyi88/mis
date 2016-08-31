<link rel="stylesheet" type="text/css" href="/public/common/js/drag/drag.css">
<script type="text/javascript" src="/public/common/js/drag/drag.js"></script>
    <section id="contact-page" style="padding:10px 0;">
        <div class="container">          
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form name="form1" action="{formatUrl('home/doRegister')}" method="post" enctype="multipart/form-data">
                    <div class="col-xs-12 col-sm-6">
                        <img src="/public/new/images/regP.jpg" width="100%">
                        <p class="uname" style="text-align:right;color:#D00139;"></p>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                            <label>账户 *</label>
                            <input type="text" class="form-control" name="user_account" id="user_account" placeholder="请输入登录账号" required="required">
                        </div>
                        <div class="form-group">
                            <label>姓名 *</label>
                            <input type="text" class="form-control" name="user_name" id="user_name" placeholder="请输入姓名" required="required">
                        </div>
                        <div class="form-group">
                            <label>登录密码 *</label>
                            <input type="password" class="form-control" name="user_password" id="user_password" placeholder="请输入密码" required="required">
                        </div>   
                        <div class="form-group">
                            <label>确认密码 *</label>
                            <input type="password" class="form-control" name="user_password_re" id="user_password_re" placeholder="请再次输入密码" required="required">
                        </div>
                        <div class="form-group dragTxt">
                            <label>请拖动验证</label>
				            <div class="input-control">
							    <div id="drag"></div>
							</div>
							&nbsp;<span class="errorMsg dodrag"></span>
                        </div>                       
                        <div class="form-group">
                            <input type="hidden" name="uri" value="{$uri}">
                            <input type="hidden" id="checkAccountUrl" value="{formatUrl('home/checkAccount')}">
                            <button type="button" name="button" class="btn btn-primary dosubmit">注册</button>&nbsp;&nbsp;
                            <button type="button" class="btn btn-primary" style="background:#404040;" required="required" onclick="location.href='{formatUrl('login/')}'">登录</button>
                        </div>
                    </div>
                </form> 
            </div>
        </div>
    </section>
<script type="text/javascript">
var dragTxt = $('.dragTxt').html(); 	
$(document).ready(function(){
	$('#drag').drag(); 
	$('.dosubmit').click(checkform);
});	
function redrag(){
    $('.dragTxt').html(dragTxt); 
    $('#drag').drag(); 
}
function checkform(){     
    $(".errorMsg").empty(); 
    $('.uname').empty();
    var user_account = $("#user_account").val();
    if(user_account==''){
        $('.uname').html('登录账号不能为空');
        $("#user_account").focus();
        redrag();
        return false;
    }
    if(user_account.length<4){
        $('.uname').html('登录账号至少为4个字符');
        $("#user_account").focus();
        redrag();
        return false;
    }
    var user_name = $("#user_name").val();
    if(user_name==''){
        $('.username').html('姓名不能为空');
        $("#user_name").focus();
        redrag();
        return false;
    }
    var user_password = $("#user_password").val();
    if(user_password==''){
        $('.upwd').html('密码不能为空');
        $("#user_password").focus();
        redrag();
        return false;
    }
    var user_password_re = $("#user_password_re").val();
    if(user_password_re==''){
        $('.upwdre').html('请确认密码');
        $("#user_password_re").focus();
        redrag();
        return false;
    }
    if(user_password!=user_password_re){
        $('.upwd').html('两次输入的密码不一致');       
        $("#user_password").val('');
        $("#user_password_re").val('');
        $("#user_password").focus();
        redrag();
        return false;
    }
    var dragok = $("#drag").children().is(".handler_ok_bg");
    if(!dragok){
        $('.dodrag').html('请拖动验证');
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
        		redrag();
                return false;
        	}else{
        	    $(".dosubmit").attr('disabled',true);
        	    document.form1.submit();
        	}
        }
    }); 
    return false;      
} 	
</script>