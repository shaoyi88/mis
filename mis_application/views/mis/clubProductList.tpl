<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 俱乐部管理<span class="c-gray en">&gt;</span> 产品管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	{if checkRight('club_productAdd')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('club/productAdd')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加俱乐部产品</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无俱乐部产品</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>产品名称</th>
          			<th>添加时间</th>
          			<th>添加人</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['product_name']}</td>
        			<td>{date('Y-m-d',$item['add_time'])}</td>
        			<td>{$item['admin_name']}</td>
          			<td>
          				<a class="btn btn-primary radius" title="查看" href="{formatUrl('club/productDetail?id=')}{$item['product_id']}" style="text-decoration:none">查看</a>
          				{if checkRight('club_productEdit')}<a class="btn btn-primary radius ml-5" title="编辑" href="{formatUrl('club/productAdd?id=')}{$item['product_id']}" style="text-decoration:none">编辑</a>{/if}
          				{if checkRight('club_productDel')}<a class="btn btn-primary radius ml-5 del" did="{$item['product_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/club.js"></script>
<input type="hidden" id="delUrl" value="{formatUrl('club/productDoDel')}"></input>