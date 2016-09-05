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
                            <label>邮箱 *</label>
                            <input type="email" class="form-control" name="user_email" id="user_email" placeholder="请输入邮箱" required="required">
                            <input type="button" class="btn btn-primary getCode" style="background:#404040;" value="获取验证码">
                        </div>
                        <div class="form-group">
                            <label>验证码 *</label>
                            <input type="number" class="form-control" name="verify" id="verify" placeholder="请输入验证码" required="required">
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
                            <input type="hidden" id="getCodeUrl" value="{formatUrl('home/getCode')}">
                            <button type="button" name="button" class="btn btn-primary dosubmit">注册</button>&nbsp;&nbsp;
                            <button type="button" class="btn btn-primary" style="background:#404040;" onclick="location.href='{formatUrl('login/')}'">登录</button>
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
    $(".getCode").click(getCode);
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
    var code = $('#verify').val();
    var mail = $('#user_email').val();
    var checkAccount = $('#checkAccountUrl').val()+'?account='+user_account+'&mail='+mail+'&code='+code;
    $.ajax({
        type: "GET",
        url: checkAccount,
        dataType: "json",
        success: function(data){
        	if(data.status == -3){
        		$('.uname').html('该登录账号已存在');
        		redrag();
                return false;
        	}else if(data.status == -2){
        		$('.uname').html('该邮箱已注册');
        		redrag();
                return false;
        	}else if(data.status == -1){
        		$('.uname').html('验证码不正确');
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
var countdown=60;
function getCode(){
    var mail = $('#user_email').val();
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(!reg.test(mail)){
		alert('电子邮箱格式不正确');
		return false;
	}
	if(countdown == 60){
	    $(".getCode").attr("disabled", true); 
		$(".getCode").val("重新发送" + countdown); 		
	    var getCodeUrl = $('#getCodeUrl').val()+'?account='+mail;
	    $.ajax({
	        type: "GET",
	        url: getCodeUrl,
	        dataType: "json",
        });
        countdown--; 
	}else if(countdown == 0){ 
		$(".getCode").removeAttr("disabled");  
		$(".getCode").val("获取验证码");
		countdown = 60;
		return false; 		
	}else{	    
		$(".getCode").attr("disabled", true); 
		$(".getCode").val("重新发送" + countdown); 
		countdown--; 
	} 
	var t=setTimeout(function(){ 
	getCode() 
	},1000) 
} 	
</script>