<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 用户管理<span class="c-gray en">&gt;</span> 园区用户管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('user/index')}" method="get">
		<div class="text-c"> 
			<select class="select" id="user_type" name="user_type" style="width:200px">
      			<option value="">请选择用户类别</option>
      			{foreach $user_type as $key=>$item}
      				<option value="{$key}" {if isset($keyword['user_type']) && $keyword['user_type'] != '' && $keyword['user_type'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<select class="select" id="user_second_type" name="user_second_type" {if isset($keyword['user_type']) && $keyword['user_type'] === '0'}style="width:200px;"{else}style="width:200px;display:none"{/if}>
      			<option value="">请选择用户二级类别</option>
      			{foreach $user_second_type as $key=>$item}
      				<option value="{$key}" {if isset($keyword['user_second_type']) && $keyword['user_second_type'] != '' && $keyword['user_second_type'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" value="{if isset($keyword['keyword'])}{$keyword['keyword']}{/if}" class="input-text" style="width:250px" placeholder="输入用户昵称/用户账户" id="" name="keyword">
			<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
		</div>
	</form>
	{if checkRight('user_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('user/add')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加园区用户</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无园区用户</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>用户昵称</th>
          			<th>账户</th>
          			<th>用户类型</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['user_nickname']}</td>
        			<td>{$item['user_account']}</td>
        			<td>{$user_type[$item['user_type']]}{if $item['user_second_type']}-{$user_second_type[$item['user_second_type']]}{/if}{if $item['enterprise_name']}({$item['enterprise_name']}){/if}</td>
          			<td>
          				{if checkRight('user_edit')}<a class="btn btn-primary radius edit" title="编辑" href="{formatUrl('user/add?id=')}{$item['user_id']}" style="text-decoration:none">编辑</a>{/if}
          				{if checkRight('user_del')}<a class="btn btn-primary radius ml-5 del" did="{$item['user_id']}" title="删除" href="javascript:;" style="text-decoration:none">删除</a>{/if}
          			</td>
          		</tr>
			{/foreach}
			</tbody>
		</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/user.js"></script>
<input type="hidden" id="delUrl" value="{formatUrl('user/doDel')}"></input>