
    <section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>企业成员认证</h2>
                <p class="lead">{if isset($msg)&&$msg}{$msg}{else}请填写以下信息{/if}</p>
            </div> 
            <form name="form1" action="{formatUrl('home/do_identify')}" method="post" enctype="multipart/form-data">
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            <label>企业邀请码 *</label>
                            <input type="number" name="code" id="code" placeholder="请输入企业邀请码" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>请向企业账号负责人索取邀请码</label>
                        </div>                 
                        <div class="form-group center">
                            <button type="buton" class="btn btn-primary btn-lg block-shadow-success" required="required">确定</button>&nbsp;&nbsp;
                        </div>
                    </div>
            </div>
            </form>
        </div>
    </section>
    <input type="hidden" id="checkEmailUrl" value="{formatUrl('home/checkEmail')}">
    <input type="hidden" id="sendUrl" value="{formatUrl('home/sendFind')}">
<script type="text/javascript">
$(document).ready(function(){
    $(".block-shadow-success").click(findpwd);
});		
function findpwd(){
    var code = $('#code').val();
	if(code==''){
		alert('请输入验证码');
		return false;
	}
	$(".block-shadow-success").attr('disabled',true);
	document.form1.submit();
}
</script>