
    <section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>重设密码</h2>
                <p class="lead">{if isset($msg)&&$msg}{$msg}{else}请填写新的密码{/if}</p>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                    <form name="form1" action="{formatUrl('home/doReset')}" method="post" enctype="multipart/form-data">
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            <label>登录密码 *</label>
                            <input type="password" class="form-control" name="user_password" id="user_password" placeholder="请输入密码" required="required">
                        </div>
                        <div class="form-group">
                            <label>确认密码 *</label>
                            <input type="password" class="form-control" name="user_password_re" id="user_password_re" placeholder="请再次输入密码" required="required">
                        </div>                  
                        <div class="form-group center">
                            <input type="hidden" name="id" value="{$id}">
                            <input type="hidden" name="user_email" value="{$uid}">
                            <button type="buton" class="btn btn-primary btn-lg block-shadow-success" required="required">确定</button>&nbsp;&nbsp;
                        </div>
                    </div>
                    </form>
            </div>
        </div>
    </section>
    <input type="hidden" id="checkEmailUrl" value="{formatUrl('home/checkEmail')}">
    <input type="hidden" id="sendUrl" value="{formatUrl('home/sendFind')}">
<script type="text/javascript">
$(document).ready(function(){
    $(".block-shadow-success").click(dosubmit);
});		
function dosubmit(){
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
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
}
</script>