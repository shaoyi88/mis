<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 信息管理<span class="c-gray en">&gt;</span> 资讯类别管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	{if checkRight('article_type_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('article/addType')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加资讯类别</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无资讯类别</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>资讯类别名称</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td class="text-l">{if $item['level'] > 0}{str_repeat('&nbsp', $item['level']*2)}├ {/if}{$item['type_name']}</td>
          				<td>
          					{if checkRight('article_type_edit')}<a class="btn btn-primary radius" title="编辑" href="{formatUrl('article/addType?did=')}{$item['type_id']}" style="text-decoration:none">编辑</a>{/if}
          					{if checkRight('article_type_del')}<a title="删除" href="javascript:;" class="ml-5 del btn btn-primary radius" did="{$item['type_id']}" style="text-decoration:none">删除</a>{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
</div>
<script type="text/javascript" src="/public/mis/js/article.js""></script>
<input type="hidden" id="delUrl" value="{formatUrl('article/doDelType')}"></input>