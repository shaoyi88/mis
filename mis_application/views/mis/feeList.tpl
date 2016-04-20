<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 物业服务<span class="c-gray en">&gt;</span> 费用管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('property/feeList')}" method="get">
		<div class="text-c"> 
			<select class="select" id="pay_status" name="pay_status" style="width:200px">
      			<option value="">请选择支付状态</option>
      			<option value="0" {if isset($keyword['pay_status']) && $keyword['pay_status'] != '' && $keyword['pay_status'] == 0}selected{/if}>
      				未支付
      			</option>
      			<option value="1" {if isset($keyword['pay_status']) && $keyword['pay_status'] != '' && $keyword['pay_status'] == 1}selected{/if}>
      				已支付
      			</option>
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜费用信息</button>
    	</div>
	</form>
	{if checkRight('fee_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('property/addFee')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加费用信息</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无费用信息</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>企业</th>
          			<th>日期</th>
          			<th>物业单位费用</th>
          			<th>物业面积</th>
          			<th>物业费</th>
          			<th>水费</th>
          			<th>电费费</th>
          			<th>支付状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$item['enterprise_name']}</td>
          				<td>{date('Y-m',$item['fee_date'])}</td>
          				<td>{$item['property_fee_unit_price']}元/平方</td>
          				<td>{$item['property_fee_num']}平方</td>
						<td>{$item['property_fee_amount']}元</td>
						<td>{$item['water_fee_amount']}元</td>
          				<td>{$item['elec_fee_amount']}元</td>
          				<td>{if $item['pay_status'] == 0}未支付{else}已支付{/if}</td>
          				<td>
          					{if checkRight('fee_edit')}<a class="btn btn-primary radius" title="编辑" href="{formatUrl('property/addFee?did=')}{$item['fee_id']}" style="text-decoration:none">编辑</a>{/if}
          					{if checkRight('fee_del')}<a title="删除" href="javascript:;" class="ml-5 del btn btn-primary radius" did="{$item['fee_id']}" style="text-decoration:none">删除</a>{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/fee.js""></script>
<input type="hidden" id="delUrl" value="{formatUrl('property/doDelFee')}"></input>