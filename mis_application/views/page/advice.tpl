<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;投诉建议&nbsp;</div>
{if $msg}
<p class="fg-red">错误：{$msg}</p>
{/if}
<h3>请填写以下信息</h3>
<form name="form1" action="{formatUrl('home/do_advice')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">投诉/建议</th>
        <td width="85%">
			<div class="input-control select">
			    <select name="feedback_type">
			        <option value="">请选择类型</option>
			        {foreach $feedback_type as $key=>$item}
			        <option value="{$key}">{$item}</option>
			        {/foreach}
			    </select>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">内容</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="feedback_content" id="feedback_content" style="width:600px;" placeholder="请输入投/建议具体内容">
			</div>
        </td>
    </tr>   
    <tr>
        <th>&nbsp;</th>
        <td><button class="button primary block-shadow-success dosubmit">提交</button></td>
    </tr>
</table>
</form>
<div class="padding20" style="min-height:200px;">&nbsp;</div>
<div id="dtBox"></div>
<script type="text/javascript">	
$(document).ready(function(){
	$("#dtBox").DateTimePicker();
});	
function checkform(){
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
    alert("感谢您对我们的宝贵意见!");
    return false;
}	
</script>