<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  招商管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('investment/potential')}"> 潜在客户管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('investment/doAddPotential')}" method="post">
		{if isset($info)}
		<input name="enterprise_id" type="hidden" value="{$info['enterprise_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">{if !isset($info)}<span class="c-red">*</span>{/if}潜在企业名：</th>
          			 <td><input name="enterprise_name" type="text" class="input-text" id="enterprise_name" value="{if isset($info)}{$info['enterprise_name']}{/if}" nullmsg="潜在企业名不能为空！" datatype="s"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">{if !isset($info)}<span class="c-red">*</span>{/if}联系人：</th>
          			 <td><input name="enterprise_contact" type="text" class="input-text" id="enterprise_contact" value="{if isset($info)}{$info['enterprise_contact']}{/if}" nullmsg="联系人不能为空！" datatype="s"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">{if !isset($info)}<span class="c-red">*</span>{/if}联系电话：</th>
          			 <td><input name="enterprise_contact_mobile" type="text" class="input-text" id="enterprise_contact_mobile" value="{if isset($info)}{$info['enterprise_contact_mobile']}{/if}" nullmsg="联系电话不能为空！" datatype="s"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">备注：</th>
          			 <td><input name="remark" type="text" class="input-text" id="remark" value="{if isset($info)}{$info['remark']}{/if}"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="80">意向楼宇<span class="c-red">*</span>：</th>
          			 <td>
          			 	{foreach $buildInfo as $k=>$item}                  					
                    	<label class="item" style="width:150px;display:inline-block;"><input {if isset($info) && in_array($item['building_id'], $info['building'])}checked{/if} datatype="*" nullmsg="请至少选择一个意向楼宇！" name="enterprise_building[]" type="checkbox" value="{$item['building_id']}">{$item['building_floor']}层-{$item['building_room']}</label>
                    	{if ($k+1)%5==0}
                    	<div style="margin:10px"></div>
                    	{/if}
                    	{/foreach}
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