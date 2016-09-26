<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 招商管理<span class="c-gray en">&gt;</span> 入驻企业管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	{if checkRight('enterprise_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('enterprise/add')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加入驻企业</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无入驻企业</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>企业名</th>
          			<th>企业法人</th>
          			<th>入驻时间</th>
          			<th>邀请码</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['enterprise_name']}</td>
        			<td>{$item['enterprise_artificial']}</td>
        			<td>{if $item['enterprise_enter_time']}{date('Y-m-d', $item['enterprise_enter_time'])}{/if}</td>
        			<td>{$item['enterprise_code']}</td>
          			<td>
          				<a class="btn btn-primary radius" title="详情" href="{formatUrl('enterprise/detail?id=')}{$item['enterprise_id']}" style="text-decoration:none">查看</a>
          				{if checkRight('enterprise_edit')}<a class="btn btn-primary radius ml-5 edit" title="编辑" href="{formatUrl('enterprise/add?id=')}{$item['enterprise_id']}" style="text-decoration:none">编辑</a>{/if}
          				{if checkRight('enterprise_del')}<a class="btn btn-primary radius ml-5 del" did="{$item['enterprise_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/enterprise.js"></script>
<input type="hidden" id="delUrl" value="{formatUrl('enterprise/doDel')}"></input>