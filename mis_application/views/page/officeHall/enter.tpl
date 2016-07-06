<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;<a href="{formatUrl('officehall')}">办事大厅</a>&nbsp;>&nbsp;<span class="icon mif-enter"></span>&nbsp;申请入驻&nbsp;</div>
{if $msg}
<p class="fg-red">错误：{$msg}</p>
{/if}
<h3>请填写以下信息</h3>
<form name="form1" action="{formatUrl('officehall/do_application')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">企业名称</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="enterprise_name" id="enterprise_name" placeholder="请输入企业名称">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">注册时间</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="reg_time" id="reg_time" placeholder="请输入企业注册时间" data-field="date" readonly>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">注册资金</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="registered_funds" id="registered_funds" placeholder="请输入企业注册资金" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')">	    
			</div>
			<span>&nbsp;万元</span>
        </td>
    </tr>
    <tr>
        <th width="15%">上年营业收入</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="last_year_income" id="last_year_income" placeholder="请输入企业去年营业收入" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')">
			</div>
			<span>&nbsp;万元</span>
        </td>
    </tr>
    <tr>
        <th width="15%">上年年末职工数</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="last_year_workers" id="last_year_workers" placeholder="请输入企业去年年末职工数" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')">
			</div>
			<span>&nbsp;人</span>
        </td>
    </tr>
    <tr>
        <th width="15%">是否高新企业</th>
        <td width="85%">
				<label class="input-control radio small-check">
				    <input type="radio" name="is_high_tech" value="1">
				    <span class="check"></span>
				    <span class="caption">是</span>
				</label>
				&nbsp;&nbsp;
				<label class="input-control radio small-check">
				    <input type="radio" name="is_high_tech" value="0" checked>
				    <span class="check"></span>
				    <span class="caption">否</span>
				</label>
        </td>
    </tr>
    <tr>
        <th width="15%">上传营业执照</th>
        <td width="85%">
				<div class="input-control file" data-role="input">
				    <input type="file" name="enterprise_bussiness" placeholder="请上传副本扫描件">
				    <button class="button"><span class="mif-folder"></span></button>
				</div>
				<span>&nbsp;格式为jpg、png等图片格式，大小不超过2M</span>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="enterprise_contact" id="enterprise_contact" placeholder="请输入企业联系人">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人手机</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="enterprise_contact_mobile" id="enterprise_contact_mobile" placeholder="请输入企业联系人手机号码">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">提示</th>
        <td width="85%">
			<div class="input-control fg-darkRed">
			        如企业仍未获得营业执照，请在营业执照处上传一张说明自身情况的图片
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