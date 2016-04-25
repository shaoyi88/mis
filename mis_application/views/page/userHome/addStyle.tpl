<link href="/public/common/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="/public/common/js/umeditor/lang/zh-cn/zh-cn.js"></script>
{if isset($msg)}
<p class="padding10 fg-red">{$msg}</p>
{/if}
<h3>添加企业风采</h3>
<form name="form1" action="{formatUrl('officehall/do_application')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<div class="padding10">
    <div class="input-control file" data-role="input">
	        <input type="file" name="style_cover" placeholder="请上传封面图片">
	    <button class="button"><span class="mif-folder"></span></button>
	</div>
	<span>&nbsp;格式为jpg、png等图片格式，大小不超过2M</span>
</div>
<div class="padding10">
<textarea style="width:1000px;height:240px;" name="enterprise_style" cols="" rows="" class="textarea" id="enterprise_style" nullmsg="描述不能为空！" datatype="*"></textarea>
</div>
<div class="padding10">
<button class="button primary block-shadow-success dosubmit">保存</button>
</div>
</form>
<script type="text/javascript">
var um = UM.getEditor('enterprise_style');
function checkform(){
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
    return false;
}	
</script>