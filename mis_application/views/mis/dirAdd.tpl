<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  信息管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('netdisk/dirList')}">文档管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('netdisk/dirDoAdd')}" method="post">
		{if isset($info)}
		<input name="dir_id" type="hidden" value="{$info['dir_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
        		<tr>
          		     <th class="text-r" width="120">目录名<span class="c-red">*</span></th>
          			 <td>
          			 	<input nullmsg="目录名不能为空！" datatype="*"  name="dir_name" type="text" class="input-text" id="dir_name" value="{if isset($info)}{$info['dir_name']}{/if}" >
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="120">目录描述<span class="c-red">*</span></th>
          			 <td>
          			 	<textarea style="width:400px;height:100px;" nullmsg="目录描述不能为空！" datatype="*"  name="dir_desc" id="dir_desc" >{if isset($info)}{$info['dir_desc']}{/if}</textarea>
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="120">目录操作权限角色<span class="c-red">*</span></th>
          			 <td>
          			 	{foreach $roleList as $item}            					
                    		<label class="item"><input datatype="*" nullmsg="请至少选择一个目录操作权限角色！" name="dir_role[]" type="checkbox" value="{$item['id']}" {if isset($info) && in_array($item['id'], $roles)}checked{/if}>{$item['role_name']}</label>
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
<script type="text/javascript" src="/public/mis/js/netdisk.js""></script>