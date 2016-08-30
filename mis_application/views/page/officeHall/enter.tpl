<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
    <section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>入驻申请</h2>
                <p class="lead">请填写以下信息</p>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form name="form1" action="{formatUrl('login/do_application')}" method="post" data-role="validator"  enctype="multipart/form-data" onsubmit="return checkform();">
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            <label>企业名称 *</label>
                            <input type="text" class="form-control" name="enterprise_name" id="enterprise_name" placeholder="请输入企业名称" required="required">
                        </div>
                        <div class="form-group">
                            <label>企业注册时间 *</label>
                            <input type="text" class="form-control" name="reg_time" id="reg_time" placeholder="请选择企业注册时间" required="required" data-field="date" readonly>
                        </div>
                        <div class="form-group">
                            <label>企业注册资金 *（单位：万）</label>
                            <input type="text" class="form-control" name="registered_funds" id="registered_funds" placeholder="请输入企业注册资金" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required">
                        </div>
                        <div class="form-group">
                            <label>企业注册资金 *（单位：万）</label>
                            <input type="text" class="form-control" name="registered_funds" id="registered_funds" placeholder="请输入企业注册资金" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required">
                        </div> 
                        <div class="form-group">
                            <label>去年营业收入 *（单位：万）</label>
                            <input type="text" class="form-control" name="last_year_income" id="last_year_income" placeholder="请输入企业去年营业收入" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required">
                        </div>
                        <div class="form-group">
                            <label>去年年末职工数 *</label>
                            <input type="text" class="form-control" name="last_year_workers" id="last_year_workers" placeholder="请输入企业去年年末职工数" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required">
                        </div>  
                        <div class="form-group">
                            <label>是否高新企业 *</label>
                            &nbsp;<input type="radio" name="is_high_tech" value="1">&nbsp;是&nbsp;&nbsp;<input type="radio"  name="is_high_tech" value="0">&nbsp;否
                        </div>
                        <div class="form-group">
                            <label>上传营业执照 </label>
                            <input type="file" name="enterprise_bussiness" placeholder="请上传副本扫描件">&nbsp;格式为jpg、png等图片格式，大小不超过2M
                        </div>
                        <div class="form-group">
                            <label>联系人 *</label>
                            <input type="text" class="form-control" name="enterprise_contact" id="enterprise_contact" placeholder="请输入企业联系人" required="required">
                        </div>
                        <div class="form-group">
                            <label>联系人手机 *</label>
                            <input type="text" class="form-control" name="enterprise_contact_mobile" id="enterprise_contact_mobile" placeholder="请输入企业联系人手机号码" required="required">
                        </div>                             
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
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
    return false;
}	
</script>