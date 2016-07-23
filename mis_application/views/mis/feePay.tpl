<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('property/feeList')}"> 费用管理</a> <span class="c-gray en">&gt;</span> 费用支付</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('property/doPayFee')}" method="post">
		<input name="fee_id" type="hidden" value="{$info['fee_id']}">
		<input name="enterprise_id" type="hidden" value="{$info['enterprise_id']}">
		<input name="total" type="hidden" value="{$total}">
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">企业：</th>
					 <td>{$info['enterprise_name']}</td>
				</tr>			
				<tr>
          		     <th class="text-r" width="180">日期：</th>
					 <td>{date('Y-m',$info['fee_date'])}</td>
				</tr>
				<tr>
          		     <th class="text-r" width="180">租金：</th>
					 <td>{$info['rent_fee']}元</td>
				</tr>
				<tr>
          		     <th class="text-r" width="180">物管费：</th>
					 <td>{$info['property_fee']}元</td>
				</tr>
				<tr>
          		     <th class="text-r" width="180">水费：</th>
					 <td>{$info['water_fee_unit_price']*$info['water_fee_num']}元</td>
				</tr>
				<tr>
          		     <th class="text-r" width="180">电费：</th>
					 <td>{$info['elec_fee_unit_price']*$info['elec_fee_num']}元</td>
				</tr>
				<tr>
          		     <th class="text-r" width="180">总费用：</th>
					 <td>{$total}元</td>
				</tr>
				<tr>
          		     <th class="text-r" width="180">支付金额：</th>
					 <td><input nullmsg="支付金额不能为空！" datatype="num"  name="pay_amount" type="text" class="input-text" id="pay_amount" value="" ></td>
				</tr>
				<tr>
          			<th></th>
          			<td>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
          			</td>
        		</tr>
			</tbody>
		</table>
	</form>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/mis/js/fee.js""></script>