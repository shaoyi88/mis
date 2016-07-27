<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;<a href="{formatUrl('officehall')}">办事大厅</a>&nbsp;>&nbsp;<span class="icon mif-filter"></span>&nbsp;企业需求</div>
{if $msg}
<p class="fg-red">错误：{$msg}</p>
{/if}
<form name="form1" action="{formatUrl('officehall/do_project')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<h3>企业需求</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">需求类型</th>
        <td width="85%">
			<div class="input-control select">
			    <select name="apply_type">
			        <option value="">请选择类型</option>
			        {foreach $apply_type as $key=>$item}
			        <option value="{$key}">{$item}</option>
			        {/foreach}
			    </select>
			</div>
        </td>
    </tr> 
    <tr>
        <th width="15%">需求内容</th>
        <td width="85%">
			<div class="input-control textarea">
			    <textarea name="apply_content" placeholder="请填写需求内容"></textarea>
			</div>
        </td>
    </tr>   
    <tr>
        <th width="15%">联系人</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="contacts" id="contacts" placeholder="请输入联系人姓名">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人电话</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="contacts_phone" id="contacts_phone" placeholder="请输入联系人电话">
			</div>
        </td>
    </tr>
    <tr>
        <th>&nbsp;</th>
        <td><button class="button primary block-shadow-success dosubmit">提交</button></td>
    </tr>
</table>
</form>
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