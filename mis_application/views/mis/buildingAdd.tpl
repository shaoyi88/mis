<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  楼宇管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('building/index')}">楼宇信息管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('building/doAdd')}" method="post">
		{if isset($info)}
		<input name="building_id" type="hidden" value="{$info['building_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
        		<tr>
          		     <th class="text-r" width="180">楼宇名称<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入楼宇名称！" datatype="s" class="input-text" style="width:250px" name="building_name" type="text" value="{if isset($info)}{$info['building_name']}{/if}" placeholder="输入楼宇名称"></td>
        		</tr>
        		
        		<tr>
          		     <th class="text-r" width="180">楼层<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入楼层！" datatype="s" class="input-text" style="width:250px" name="building_floor" type="text" value="{if isset($info)}{$info['building_floor']}{/if}" placeholder="输入楼层"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">房间<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入房间！" datatype="s" class="input-text" style="width:250px" name="building_room" type="text" value="{if isset($info)}{$info['building_room']}{/if}" placeholder="输入房间"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">面积<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入面积！" datatype="s" class="input-text" style="width:250px" name="building_area" type="text" value="{if isset($info)}{$info['building_area']}{/if}" placeholder="输入面积"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">类型<span class="c-red">*</span>：</th>
          			 <td>
          			 	<select class="select" id="building_type" name="building_type" nullmsg="类型不能为空！" datatype="*">
      						<option value="">请选择类型</option>
      						{foreach $building_type as $key=>$item}
      						<option value="{$key}" {if isset($info) && $info['building_type'] == $key}selected{/if}>
      						{$item}
      						</option>
      						{/foreach}
    					</select>
          			 </td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> {$typeMsg}</button>
          			</td>
        		</tr>
        	</tbody>
        </table>
	</form>
</div>
<script type="text/javascript" src="/public/mis/js/building.js""></script>