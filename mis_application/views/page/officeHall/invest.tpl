
    <section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>投资申请</h2>
                <p class="lead">请填写以下信息</p>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form name="form1" action="{formatUrl('login/do_invest')}" method="post" data-role="validator" onsubmit="return checkform();">
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            <label>申请投资资金 *（单位：万）</label>
                            <input type="text" name="invest_sum" id="invest_sum" placeholder="请输入申请投资资金" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" required="required" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>资金用途概述 *</label>
                            <input type="text" name="usage" id="usage" placeholder="请输入资金用途概述" required="required" class="form-control">
                        </div> 
                        <div class="form-group">
                            <label>联系人 *</label>
                            <input type="text" class="form-control" name="contacts" id="contacts" placeholder="请输入企业联系人" required="required">
                        </div>
                        <div class="form-group">
                            <label>联系人手机 *</label>
                            <input type="text" class="form-control" name="contacts_phone" id="contacts_phone" placeholder="请输入企业联系人手机号码" required="required">
                        </div>                             
                        <div class="form-group center">
                            <button type="submit" name="submit" class="btn btn-primary btn-lg block-shadow-success" required="required">提交</button>&nbsp;&nbsp;
                        </div>
                    </div>
                </form> 
            </div>
        </div>
    </section>
<script type="text/javascript">	
function checkform(){
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
    return false;
}
</script>