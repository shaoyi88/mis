
    <section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>找回密码</h2>
                <p class="lead">{if isset($msg)&&$msg}{$msg}{else}请填写以下信息{/if}</p>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            <label>邮箱 *</label>
                            <input type="text" name="user_email" id="user_email" placeholder="请输入邮箱账号" class="form-control">
                        </div>                
                        <div class="form-group center">
                            <button type="buton" class="btn btn-primary btn-lg block-shadow-success" required="required">确定</button>&nbsp;&nbsp;
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <input type="hidden" id="checkEmailUrl" value="{formatUrl('home/checkEmail')}">
    <input type="hidden" id="sendUrl" value="{formatUrl('home/sendFind')}">
<script type="text/javascript">
$(document).ready(function(){
    $(".block-shadow-success").click(findpwd);
});		
function findpwd(){
    var mail = $('#user_email').val();
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(!reg.test(mail)){
		alert('电子邮箱格式不正确');
		return false;
	}
	$(".block-shadow-success").attr('disabled',true);
	var checkUrl = $('#checkEmailUrl').val()+'?account='+mail;
    $.ajax({
        type: "GET",
        url: checkUrl,
        dataType: "json",
        success: function(data){
        	if(data.status != 1){
        		$('.uname').html('该邮箱不存在');
        		$(".block-shadow-success").removeAttr('disabled');
                return false;
        	}else{
		        var sendUrl = $('#sendUrl').val()+'?account='+mail;
			    $.ajax({
			        type: "GET",
			        url: sendUrl,
			        dataType: "json",			        
		        });
        	    alert('找回密码邮件已发送到您邮箱，请查收');
        	}
        }
    });
}
</script>