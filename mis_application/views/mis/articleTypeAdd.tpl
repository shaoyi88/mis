<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  信息管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('article/type')}">资讯类别管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('article/doAddType')}" method="post">
		{if isset($info)}
		<input name="type_id" type="hidden" value="{$info['type_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">上级资讯类别：</th>
          			 <td>
          			 	<select class="select" id="parent_id" name="parent_id">
      						<option value="0">顶级资讯类别</option>
      						{foreach $dataList as $item}
      						<option value="{$item['type_id']}" {if isset($info) && $info['parent_id'] == $item['type_id']}selected{/if}>
      						{if $item['level'] > 0}{str_repeat('&nbsp', $item['level']*2)}├ {/if}{$item['type_name']}
      						</option>
      						{/foreach}
    					</select>
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">资讯类别名称<span class="c-red">*</span>：</th>
          			 <td><input nullmsg="请输入资讯类别名称！" datatype="s" class="input-text" style="width:250px" name="type_name" type="text" value="{if isset($info)}{$info['type_name']}{/if}" placeholder="输入资讯类别名称"></td>
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
<script type="text/javascript" src="/public/mis/js/article.js""></script>