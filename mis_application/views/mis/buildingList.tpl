<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 楼宇管理<span class="c-gray en">&gt;</span> 楼宇信息管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<form class="Huiform" action="{formatUrl('building/index')}" method="get">
		<div class="text-c"> 
			<select class="select" id="building_type" name="building_type" style="width:100px">
      			<option value="">请选择类型</option>
      			{foreach $building_type as $key=>$item}
      				<option value="{$key}" {if isset($keyword['building_type']) && $keyword['building_type'] != '' && $keyword['building_type'] == $key}selected{/if}>
      				{$item}
      				</option>
      			{/foreach}
    		</select>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<input type="text" value="{if isset($keyword['building_name'])}{$keyword['building_name']}{/if}" class="input-text" style="width:150px" placeholder="输入楼宇名" id="" name="building_name">
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<input type="text" value="{if isset($keyword['building_floor'])}{$keyword['building_floor']}{/if}" class="input-text" style="width:150px" placeholder="输入楼层" id="" name="building_floor">
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<input type="text" value="{if isset($keyword['building_room'])}{$keyword['building_room']}{/if}" class="input-text" style="width:150px" placeholder="输入房间号" id="" name="building_room">
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜楼宇信息</button>
    	</div>
	</form>
	{if checkRight('building_add')}
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="{formatUrl('building/add')}" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加楼宇信息</a>
		</span>
	 </div>
	 {/if}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无楼宇信息</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>楼宇名称</th>
          			<th>楼层</th>
          			<th>房间号</th>
          			<th>套内面积</th>
          			<th>分摊面积</th>
          			<th>建筑面积</th>
          			<th>实测使用率</th>
          			<th>租金单价</th>
          			<th>物业费单价</th>
          			<th>类型</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$item['building_name']}</td>
          				<td>{$item['building_floor']}</td>
          				<td>{$item['building_room']}</td>
          				<td>{$item['building_inner_area']}平方</td>
          				<td>{$item['building_sharing_area']}平方</td>
          				<td>{$item['building_actual_area']}平方</td>
          				<td>{round($item['building_inner_area']/$item['building_actual_area']*100,2)}%</td>
          				<td>{$item['building_rent_fee']}元/平方</td>
          				<td>{$item['building_property_fee']}元/平方</td>
          				<td>{$building_type[$item['building_type']]}</td>
          				<td>
          					{if checkRight('building_edit')}<a class="btn btn-primary radius" title="编辑" href="{formatUrl('building/add?did=')}{$item['building_id']}" style="text-decoration:none">编辑</a>{/if}
          					{if checkRight('building_del')}<a title="删除" href="javascript:;" class="ml-5 del btn btn-primary radius" did="{$item['building_id']}" style="text-decoration:none">删除</a>{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/mis/js/building.js""></script>
<input type="hidden" id="delUrl" value="{formatUrl('building/doDel')}"></input>