<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/public/new/css/officehall.css">
<script src="/public/common/js/jupload/js/vendor/jquery.ui.widget.js"></script>
<script src="/public/common/js/jupload/js/jquery.iframe-transport.js"></script>
<script src="/public/common/js/jupload/js/jquery.fileupload.js"></script>
    <section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>入驻申请</h2>
                <p class="lead">请填写以下信息</p>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form name="form1" action="{formatUrl('officehall/do_application')}" method="post" data-role="validator"  enctype="multipart/form-data" onsubmit="return checkform();">
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            <label>企业/团队名称 *</label>
                            <input type="text" class="form-control" name="enterprise_name" id="enterprise_name" placeholder="请输入企业/团队名称" required="required">
                        </div>
                        <div class="form-group">
                            <label>企业注册/团队成立时间 *</label>
                            <input type="text" class="form-control" name="reg_time" id="reg_time" placeholder="请选择企业注册/团队成立时间" required="required" data-field="date" readonly>
                        </div>
                        <div class="form-group">
                            <label>企业注册资金 *（单位：万）</label>
                            <input type="text" class="form-control" name="registered_funds" id="registered_funds" placeholder="请输入企业注册资金（如为团队此项请填写0）" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required">
                        </div>
                        <div class="form-group">
                            <label>去年营业收入 *（单位：万）</label>
                            <input type="text" class="form-control" name="last_year_income" id="last_year_income" placeholder="请输入企业去年营业收入" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required">
                        </div>
                        <div class="form-group">
                            <label>去年年末员工数 *</label>
                            <input type="text" class="form-control" name="last_year_workers" id="last_year_workers" placeholder="请输入企业去年年末员工数" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required">
                        </div>  
                        <div class="form-group">
                            <label>是否高新企业 *</label>
                            &nbsp;<input type="radio" name="is_high_tech" value="1">&nbsp;是&nbsp;&nbsp;<input type="radio"  name="is_high_tech" value="0">&nbsp;否
                        </div>
                        <div class="form-group">
                            <label>上传营业执照（如为团队申请或企业未拿到执照请留空） </label>
                            <br/>
                            <a class="input-file-a btn btn-primary" href="javascript:;">
                            <input class="input-file-f" id="mainPicupload" type="file" name="image" data-url="{formatUrl('officehall/uploadPic')}">点击上传副本扫描件                           
                            </a>
                            &nbsp;格式为jpg、png等图片格式，大小不超过2M
                        </div>
                        <div class="form-group">
	                        <div class="files">
	          			    </div>
						    <div class="up_progress">
						        <div class="progress-bar"></div>
						    </div>					    
						    <div style="clear:both;"></div>
					    </div>
                        <div class="form-group">
                            <label>意向面积 *</label>
                            <input type="number" class="form-control" name="enterprise_square_intent" id="enterprise_square_intent" placeholder="请输入意向面积" required="required">
                        </div>
                        <div class="form-group">
                            <label>联系人 *</label>
                            <input type="text" class="form-control" name="enterprise_contact" id="enterprise_contact" placeholder="请输入企业联系人" required="required">
                        </div>
                        <div class="form-group">
                            <label>联系人手机 *</label>
                            <input type="text" class="form-control" name="enterprise_contact_mobile" id="enterprise_contact_mobile" placeholder="请输入企业联系人手机号码" required="required">
                        </div>
                        {if isset($msg)&&$msg}
                        <div class="form-group">{$msg}</div>
                        {/if}                             
                        <div class="form-group center">
                            <button type="submit" name="submit" class="btn btn-primary btn-lg block-shadow-success" required="required">提交</button>&nbsp;&nbsp;
                        </div>
                    </div>
                </form> 
            </div>
        </div>
    </section>
<div id="dtBox"></div>    
<script type="text/javascript">	
$(document).ready(function(){
	$("#dtBox").DateTimePicker();
});	
function checkform(){
    var tel = $("#enterprise_contact_mobile").val();
	var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
	if(!reg.test(tel)) {
	   alert("请输入正确的手机号"); 
	   $("#enterprise_contact_mobile").focus();
	   return false;
	}
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
    return false;
}
$("#mainPicupload").fileupload({
    dataType: 'json',
    add: function (e, data) {
      if(e.isDefaultPrevented()) {
         return false;
      }
      var numItems = $('.files .images_zone').length;
      if(numItems>=1){
        alert('提交图片不能超过1张');
        return false;
      }
      $('.up_progress .progress-bar').css('width','0px');
      $('.up_progress').show();
      $('.up_progress .progress-bar').html('正在上传...');
      data.submit();
    },
    done: function (e, data) {
      $('.up_progress').hide();
      $('.upl').remove();
      var d = data.result;
      if(d.status==0){
        alert(d.msg);
      }else{
        var imgshow = '<div class="images_zone"><input type="hidden" name="enterprise_business_licence" value="'+d.msg+'" /><span><img src="'+d.msg+'"  /></span><a href="javascript:;">删除</a></div>';
        $('.files').append(imgshow);
      }
	  $('.images_zone a').on('click',function(){
	    $(this).parent().remove();
	  });
    },
    progressall: function (e, data) {
      console.log(data);
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('.up_progress .progress-bar').css('width',progress + '%');
    }
  });	
</script>