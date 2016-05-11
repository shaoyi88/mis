<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('property/feeList')}"> 费用管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('property/doAddFee')}" method="post">
		{if isset($info)}
		<input name="fee_id" type="hidden" value="{$info['fee_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">企业<span class="c-red">*</span>：</th>
          			 <td>
          			 	<input style="width:200px" type="text" class="input-text" id="enterprise_key" value="{if isset($info)}{$info['enterprise_name']}{/if}" nullmsg="企业不能为空！" datatype="*" autocomplete="off">
          			 	<div style="position:relative;">
      						<div class="auto-complete-result"></div>
      					</div>
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">费用月份<span class="c-red">*</span>：</th>
          			 <td>
          			 	<input nullmsg="请输入费用月份！" datatype="*" class="input-text" style="width:250px" type="text" id="fee_date" value="{if isset($info)}{date('Y-m', $info['fee_date'])}{/if}" placeholder="输入费用月份">
          			 	<input id="fee_date_str" name="fee_date" type="hidden" value="{if isset($info)}{$info['fee_date']}{/if}">
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">物业单位费用<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入物业单位费用！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="property_fee_unit_price" id="property_fee_unit_price" type="text" value="{if isset($info)}{$info['property_fee_unit_price']}{/if}" placeholder="输入物业单位费用">元/平方</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">物业面积<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入物业面积！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="property_fee_num" id="property_fee_num" type="text" value="{if isset($info)}{$info['property_fee_num']}{/if}" placeholder="输入物业面积">平方</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">物业费<span class="c-red">*</span>：</th>
          			 <td><input readonly nullmsg="请输入物业费！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="property_fee_amount" id="property_fee_amount" type="text" value="{if isset($info)}{$info['property_fee_amount']}{/if}" placeholder="输入物业费">元</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">水费<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入水费！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="water_fee_amount" id="water_fee_amount" type="text" value="{if isset($info)}{$info['water_fee_amount']}{/if}" placeholder="输入水费">元</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">电费<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入电费！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="elec_fee_amount" id="elec_fee_amount" type="text" value="{if isset($info)}{$info['elec_fee_amount']}{/if}" placeholder="输入电费">元</td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>         
          				<input name="enterprise_id" id="enterprise_id" type="hidden" value="{if isset($info)}{$info['enterprise_id']}{/if}">	
          				{if isset($info)}
          				<button id="submitFee" type="submit" class="btn btn-success radius"><i class="icon-ok"></i> {$typeMsg}</button>
          				{else}			
            			<button id="submitFee" type="submit" class="btn btn-success radius disabled"><i class="icon-ok"></i> {$typeMsg}</button>
            			{/if}
          			</td>
        		</tr>
        	</tbody>
        </table>
	</form>
</div>
<script type="text/template" id="enterpriseTpl">
<ul>
<%#enterpriseList%>
<li eid="<%enterprise_id%>"><%enterprise_name%></li>
<%/enterpriseList%>
</ul>
</script>
<script type="text/javascript" src="/public/common/js/hogan-2.0.0.min.js"></script>
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<input type="hidden" id="getEnterpriseUrl" value="{formatUrl('enterprise/getEnterprise')}"></input>
<script type="text/javascript" src="/public/mis/js/fee.js""></script>