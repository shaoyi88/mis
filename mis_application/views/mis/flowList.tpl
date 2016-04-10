<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 物业服务<span class="c-gray en">&gt;</span> 入驻流程配置 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	{if checkRight('flow_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('property/addFlow')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加流程</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无流程</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>流程名</th>
          			<th>是否默认</th>
          			<th>添加时间</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$item['flow_name']}</td>
          				<td>{if $item['is_default'] == 0}否{else}是{/if}</td>
          				<td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
          				<td>
          					<a class="btn btn-primary radius" title="查看" href="{formatUrl('property/flowDetail?did=')}{$item['flow_id']}" style="text-decoration:none">查看</a>
          					{if checkRight('flow_edit')}<a class="btn btn-primary radius ml-5" title="编辑" href="{formatUrl('property/addFlow?did=')}{$item['flow_id']}" style="text-decoration:none">编辑</a>{/if}
          					{if checkRight('flow_del')}<a title="删除" href="javascript:;" class="ml-5 del btn btn-primary radius" did="{$item['flow_id']}" style="text-decoration:none">删除</a>{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/flow.js""></script>
<input type="hidden" id="delUrl" value="{formatUrl('property/doDelFlow')}"></input>