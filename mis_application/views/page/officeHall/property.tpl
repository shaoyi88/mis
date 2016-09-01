<section id="contact-page" style="padding:10px 0 180px 0;">
        <div class="container">          
            <div class="center" style="padding-top:20px;padding-bottom:10px;">        
                <h2>物业相关</h2>
                {if isset($msg)&&$msg}<p>{$msg}</p>{/if}
                <p class="lead"><a href="{formatUrl('officehall/property?type=1')}" {if $type==1}style="color:#404040;"{/if}>报修</a>&nbsp;|&nbsp;<a href="{formatUrl('officehall/property?type=2')}" {if $type==2}style="color:#404040;"{/if}>投诉</a>&nbsp;|&nbsp;<a href="{formatUrl('officehall/property?type=3')}" {if $type==3}style="color:#404040;"{/if}>需求</a>&nbsp;</p>
            </div>             
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form name="form1" action="{formatUrl('officehall/do_property')}" method="post" data-role="validator" onsubmit="return checkform();">
                    <input type="hidden" name="type" value="{$type}">
                    <div class="col-xs-12 col-sm-2"></div>
                    <div class="col-xs-12 col-sm-8">
                        {if $type==1}
                        <div class="form-group">
                            <label>报修类型</label>
                            &nbsp;
						    <select name="repair_type">
						        <option value="">请选择报修类型</option>
						        {foreach $repair_type as $key=>$item}
						        <option value="{$key}">{$item}</option>
						        {/foreach}
						    </select>
                        </div>
                        <div class="form-group">
                            <label>报修内容 *</label>
                            <input type="text" class="form-control" name="repair_content"  placeholder="请填写报修内容详情" required="required">
                        </div>
                        {/if} 
                        {if $type==2}
                        <div class="form-group">
                            <label>投诉内容 *</label>
                            <input type="text" class="form-control" name="complain_content" placeholder="请填写投诉内容详情" required="required">
                        </div>
                        {/if}
                        {if $type==3}
                        <div class="form-group">
                            <label>报修类型</label>
                            &nbsp;
						    <select name="need_type">
						        <option value="">请选择需求类型</option>
						        {foreach $need_type as $key=>$item}
						        <option value="{$key}">{$item}</option>
						        {/foreach}
						    </select>
                        </div>
                        <div class="form-group">
                            <label>需求内容 *</label>
                            <input type="text" class="form-control" name="need_content"  placeholder="请填写需求内容详情" required="required">
                        </div>
                        {/if}
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