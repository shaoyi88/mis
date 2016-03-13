<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 俱乐部管理<span class="c-gray en">&gt;</span> 会员管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	{if checkRight('club_userAdd')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('club/userAdd')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加俱乐部会员</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无俱乐部会员</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>会员昵称</th>
          			<th>会员账户</th>
          			<th>会员等级</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['user_nickname']}</td>
        			<td>{$item['user_account']}</td>
        			<td>{$item['user_level']}</td>
          			<td>
          				{if checkRight('club_userEdit')}<a class="btn btn-primary radius edit" title="编辑" href="{formatUrl('club/userAdd?id=')}{$item['user_id']}" style="text-decoration:none">编辑</a>{/if}
          				{if checkRight('club_userDel')}<a class="btn btn-primary radius ml-5 del" did="{$item['user_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/club.js"></script>
<input type="hidden" id="delUrl" value="{formatUrl('club/userDoDel')}"></input>