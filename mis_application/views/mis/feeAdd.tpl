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
          		     <th class="text-r" width="180">租金<span class="c-red">*</span>：</th>
          			 <td>
          			 	<span id="rent_fee_txt">{if isset($info)}{$info['rent_fee']}元{else}0{/if}</span>元
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">物业费<span class="c-red">*</span>：</th>
          			 <td>
          			 	<span id="property_fee_txt">{if isset($info)}{$info['property_fee']}元{else}0{/if}</span>元
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">水费<span class="c-red">*</span>：</th>
          			 <td>
          			 <input nullmsg="请输入用水数量！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="water_fee_num" id="water_fee_num" type="text" value="{if isset($info)}{$info['water_fee_num']}{/if}" placeholder="输入用水数量">吨
          			 *
          			 <input nullmsg="请输入水费单价！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="water_fee_unit_price" id="water_fee_unit_price" type="text" value="{if isset($info)}{$info['water_fee_unit_price']}{else}{$init_fee['water_fee']}{/if}" placeholder="输入水费单价">元/吨
          			 <span id="water_fee_amount">{if isset($info)}（水费：{$info['water_fee_num']*$info['water_fee_unit_price']}元）{/if}</span>
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">电费<span class="c-red">*</span>：</th>
          			 <td>
          			 <input nullmsg="请输入用电数量！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="elec_fee_num" id="elec_fee_num" type="text" value="{if isset($info)}{$info['elec_fee_num']}{/if}" placeholder="输入用电数量">度
          			 *
          			 <input nullmsg="请输入电费单价！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="elec_fee_unit_price" id="elec_fee_unit_price" type="text" value="{if isset($info)}{$info['elec_fee_unit_price']}{else}{$init_fee['elec_fee']}{/if}" placeholder="输入电费单价">元/度
          			 <span id="elec_fee_amount">{if isset($info)}（电费：{$info['elec_fee_num']*$info['elec_fee_unit_price']}元）{/if}</span>
          			 </td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>     
          				<input name="rent_fee" id="rent_fee" type="hidden" value="{if isset($info)}{$info['rent_fee']}{/if}">	
          				<input name="property_fee" id="property_fee" type="hidden" value="{if isset($info)}{$info['property_fee']}{/if}">	    
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
<li eid="<%enterprise_id%>" rent_fee="<%rent_fee%>" property_fee="<%property_fee%>"><%enterprise_name%></li>
<%/enterpriseList%>
</ul>
</script>
<script type="text/javascript" src="/public/common/js/hogan-2.0.0.min.js"></script>
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<input type="hidden" id="getEnterpriseUrl" value="{formatUrl('enterprise/getEnterprise')}"></input>
<script type="text/javascript" src="/public/mis/js/fee.js""></script>