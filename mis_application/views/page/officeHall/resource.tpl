
    <section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>投资申请</h2>
                <p class="lead">请填写以下信息</p>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form name="form1" action="{formatUrl('login/do_resource')}" method="post" data-role="validator" onsubmit="return checkform();">
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group">
                            <label>类型</label>
			                &nbsp;<select id="room_type" onchange="getroom(this.value);">
						        <option value="">请选择类型</option>
						        {foreach $room_type as $key=>$item}
						        <option value="{$key}">{$item}</option>
						        {/foreach}
						    </select>
                        </div>
                        <div class="form-group">
                            <label>预订开始时间 *</label>
                            <input type="text" class="form-control" name="start_time" id="start_time" placeholder="请输入预订开始时间" data-field="datetime" readonly>
                        </div>
                        <div class="form-group">
                            <label>预订结束时间 *</label>
                            <input type="text" class="form-control" name="end_time" id="end_time" placeholder="请输入预订结束时间" data-field="datetime" readonly>
                        </div> 
                        <div class="form-group">
                            <label>使用用途 *</label>
                            <input type="text" name="meeting_title" id="meeting_title" placeholder="请输入使用用途" required="required" class="form-control">
                        </div> 
                        <div class="form-group">
                            <label>使用描述 *</label>
                            <input type="text" name="meeting_desc" placeholder="请填写描述使用概要" required="required" class="form-control">
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