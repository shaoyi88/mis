<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('property/feeList?t=')}{$t}"> {$fee_type[$t]}</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('property/doAddFee')}" method="post">
		{if isset($info)}
		<input name="fee_id" type="hidden" value="{$info['fee_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">企业用户<span class="c-red">*</span>：</th>
          			 <td>
          			 	<select class="select" id="user_id" name="user_id" nullmsg="企业用户不能为空！" datatype="*">
      						<option value="">请选择企业用户</option>
      						{foreach $userList as $user}
      							<option value="{$user['user_id']}" {if isset($info) && $info['user_id'] == $user['user_id']}selected{/if}>{$user['enterprise_name']}</option>
      						{/foreach}
    					</select>
    					<input id="enterprise_name" name="enterprise_name" type="hidden" value="{if isset($info)}{$info['enterprise_name']}{/if}">
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
          		     <th class="text-r" width="180">费用金额<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="费用金额！" datatype="s" class="input-text" style="width:250px" name="fee_amount" type="text" value="{if isset($info)}{$info['fee_amount']}{/if}" placeholder="输入费用金额"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">支付状态<span class="c-red">*</span>：</th>
          			 <td>
          			 	<select class="select" id="pay_status" name="pay_status" nullmsg="支付状态不能为空！" datatype="*">
      						<option value="">请选择支付状态</option>
      						<option value="0" {if isset($info) && $info['pay_status'] == 0}selected{/if}>
      							未支付
      						</option>
      						<option value="1" {if isset($info) && $info['pay_status'] == 1}selected{/if}>
      							已支付
      						</option>
    					</select>
          			 </td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>         				
          				<input name="fee_type" type="hidden" value="{$t}">
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> {$typeMsg}</button>
          			</td>
        		</tr>
        	</tbody>
        </table>
	</form>
</div>
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="/public/mis/js/fee.js""></script>