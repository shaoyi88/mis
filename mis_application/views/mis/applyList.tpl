<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 招商管理<span class="c-gray en">&gt;</span> 入驻申请管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('investment/apply')}" method="get">
		<div class="text-c"> 
			<input type="text" value="{if isset($keyword['enterprise_name'])}{$keyword['enterprise_name']}{/if}" class="input-text" style="width:150px" placeholder="输入公司名" id="" name="enterprise_name">
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<input type="text" value="{if isset($keyword['enterprise_contact'])}{$keyword['enterprise_contact']}{/if}" class="input-text" style="width:150px" placeholder="输入联系人名字" id="" name="enterprise_contact">
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索客户</button>
    	</div>
	</form>
	<div class="mt-20"> 
	</div>
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无入驻申请</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
			        <th>企业名称</th>
			        <th>联系人</th>
			        <th>联系电话</th>
			        <th>提交时间</th>
			        <th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
				        <td>{$item['enterprise_name']}</td>
				        <td>{$item['enterprise_contact']}</td> 
				        <td>{$item['enterprise_contact_mobile']}</td> 
				        <td>{date('Y-m-d H:i:s',$item['app_time'])}</td> 
          				<td>
          					<a class="btn btn-primary radius" title="详情" href="{formatUrl('investment/applyDetail?id=')}{$item['enterprise_id']}" style="text-decoration:none">查看</a>
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>