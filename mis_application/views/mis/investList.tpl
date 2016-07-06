<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 物业服务<span class="c-gray en">&gt;</span> 企业需求管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div class="mt-20"> 
	</div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无投资申请</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
        			<th>企业</th>
          			<th>申请投资金额</th>
          			<th>资金用途概述</th>
          			<th>联系人</th>
          			<th>联系电话</th>
          			<th>申请时间</th>
					<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$item['enterprise_name']}</td>
          				<td>{$item['invest_sum']}</td>
          				<td>{$item['usage']}</td>
          				<td>{$item['contacts']}</td>
          				<td>{$item['contacts_phone']}</td>
          				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>{$invest_status[$item['status']]}</td>
          				<td></td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>