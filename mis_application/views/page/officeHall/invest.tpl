<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;<a href="{formatUrl('officehall')}">办事大厅</a>&nbsp;>&nbsp;<span class="icon mif-coins"></span>&nbsp;投资申请&nbsp;</div>
{if $msg}
<p class="fg-red">错误：{$msg}</p>
{/if}
<h3>请填写以下信息</h3>
<form name="form1" action="{formatUrl('officehall/do_invest')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">申请投资资金</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="invest_sum" id="invest_sum" placeholder="请输入申请投资资金" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')">	    
			</div>
			<span>&nbsp;万元</span>
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