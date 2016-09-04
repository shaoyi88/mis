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
          		     <th class="text-r" width="180">房号<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入房号！" datatype="s" class="input-text" style="width:250px" name="building_room" type="text" value="{if isset($info)}{$info['building_room']}{/if}" placeholder="输入房号"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">套内面积<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入套内面积！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="building_inner_area" type="text" value="{if isset($info)}{$info['building_inner_area']}{/if}" placeholder="输入套内面积">平方</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">分摊面积<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入分摊面积！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="building_sharing_area" type="text" value="{if isset($info)}{$info['building_sharing_area']}{/if}" placeholder="输入分摊面积">平方</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">建筑面积<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入建筑面积！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="building_actual_area" type="text" value="{if isset($info)}{$info['building_actual_area']}{/if}" placeholder="输入建筑面积">平方</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">租金单价<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入租金单价！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="building_rent_fee" type="text" value="{if isset($info)}{$info['building_rent_fee']}{else}{$init_fee['building_rent_fee']}{/if}" placeholder="输入租金单价">元/平方</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">物业费单价<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入物业费单价！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="building_property_fee" type="text" value="{if isset($info)}{$info['building_property_fee']}{else}{$init_fee['building_property_fee']}{/if}" placeholder="输入物业费单价">元/平方</td>
        		</tr>
				<tr>
					<th class="text-r" width="180">售楼价格<span class="c-red">*</span>：</th>
					<td><input nullmsg="请输入售楼价格！" errormsg="请输入正确的数字格式" datatype="num" class="input-text" style="width:250px" name="building_sell_fee" type="text" value="{if isset($info)}{$info['building_sell_fee']}{/if}" placeholder="输入售楼价格">万元</td>
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