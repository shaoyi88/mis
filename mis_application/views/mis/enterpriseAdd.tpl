<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  招商管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('enterprise/index')}"> 入驻企业管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('enterprise/doAdd')}" method="post">
		{if isset($info)}
		<input name="enterprise_id" type="hidden" value="{$info['enterprise_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">企业名称<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入企业名称！" datatype="s" class="input-text" style="width:250px" name="enterprise_name" id="enterprise_name" type="text" value="{if isset($info)}{$info['enterprise_name']}{/if}" placeholder="输入企业名称"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业注册时间<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入企业注册时间！" datatype="*" class="input-text" style="width:250px" name="enterprise_reg_time" id="enterprise_reg_time" type="text" value="{if isset($info)}{date('Y-m-d',$info['enterprise_reg_time'])}{/if}" placeholder="输入企业注册时间"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">注册资金<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入注册资金！" datatype="n" class="input-text" style="width:250px" name="enterprise_registered_funds" id="enterprise_registered_funds" type="text" value="{if isset($info)}{$info['enterprise_registered_funds']}{/if}" placeholder="输入注册基金">万</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业营业执照<span class="c-red">*</span>：</th>
          			 <td>
          			 	<div>
    						<div id="filePicker">选择企业营业执照</div>
    						<img width="50" {if !isset($info)}style="display:none"{/if} height="50" id="previewImg" src="{if isset($info)}{$info['enterprise_business_licence']}{/if}">
    						<input nullmsg="请选择企业营业执照！" datatype="*" class="input-text" style="width:250px" name="enterprise_business_licence" id="enterprise_business_licence" type="hidden" value="{if isset($info)}{$info['enterprise_business_licence']}{/if}">
						</div>
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业入驻时间<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入企业入驻时间！" datatype="*" class="input-text" style="width:250px" name="enterprise_enter_time" id="enterprise_enter_time" type="text" value="{if isset($info)}{date('Y-m-d',$info['enterprise_enter_time'])}{/if}" placeholder="输入企业入驻时间"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业法人<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入企业法人！" datatype="s" class="input-text" style="width:250px" name="enterprise_artificial" id="enterprise_artificial" type="text" value="{if isset($info)}{$info['enterprise_artificial']}{/if}" placeholder="输入企业法人"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业联系人<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入企业联系人！" datatype="s" class="input-text" style="width:250px" name="enterprise_contact" id="enterprise_contact" type="text" value="{if isset($info)}{$info['enterprise_contact']}{/if}" placeholder="输入企业联系人"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="80">企业联系人手机<span class="c-red">*</span>：</th>
          			 <td><input style="width:250px" name="enterprise_mobile" type="text" class="input-text" id="enterprise_mobile" value="{if isset($info)}{$info['enterprise_mobile']}{/if}" errormsg="请输入正确的手机号码！" nullmsg="企业联系人手机不能为空！" datatype="m" placeholder="输入企业联系人手机"></td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>         				
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> {$typeMsg}</button>
          			</td>
        		</tr>
        	</tbody>
        </table>
	</form>
</div>
<input type="hidden" id="uploadUrl" value="{formatUrl('enterprise/fileUpload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="/public/mis/js/enterprise.js""></script>