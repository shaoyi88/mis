<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 信息管理<span class="c-gray en">&gt;</span> 资讯管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('article/index')}" method="get">
		<div class="text-c"> 
			<select class="select" id="type" name="type" style="width:200px">
      			<option value="0">请选择资讯类别</option>
      			{foreach $typeList as $item}
      				<option value="{$item['type_id']}" {if isset($type) && $type == $item['type_id']}selected{/if}>
      				{if $item['level'] > 0}{str_repeat('&nbsp', $item['level']*2)}├ {/if}{$item['type_name']}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜资讯</button>
		</div>
	</form>
	{if checkRight('article_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('article/add')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加资讯</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无资讯</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>资讯标题</th>
          			<th>资讯类别</th>
          			<th>添加人</th>
          			<th>更新时间</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$item['article_title']}</td>
          				<td>{if isset($typeNameList[$item['article_type']])}{$typeNameList[$item['article_type']]}{else}未分类{/if}</td>
          				<td>{$item['admin_name']}</td>
          				<td>{date('Y-m-d H:i:s',$item['update_time'])}</td>
          				<td>
          					<a title="详情" href="{formatUrl('article/detail?did=')}{$item['article_id']}" class="btn btn-primary radius" style="text-decoration:none">详情</a>
          					{if checkRight('article_edit')}<a class="ml-5 btn btn-primary radius" title="编辑" href="{formatUrl('article/add?did=')}{$item['article_id']}" style="text-decoration:none">编辑</a>{/if}
          					{if checkRight('article_del')}<a title="删除" href="javascript:;" class="ml-5 del btn btn-primary radius" did="{$item['article_id']}" style="text-decoration:none">删除</a>{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
</div>
<script type="text/javascript" src="/public/mis/js/article.js""></script>
<input type="hidden" id="delUrl" value="{formatUrl('article/doDel')}"></input>