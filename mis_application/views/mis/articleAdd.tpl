<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  信息管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('article/index')}">资讯管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('article/doAdd')}" method="post">
		{if isset($info)}
		<input name="article_id" type="hidden" value="{$info['article_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">资讯类别<span class="c-red">*</span></th>
          			 <td>
          			 	<select class="select" id="article_type" name="article_type" nullmsg="资讯类别不能为空！" datatype="*">
      						<option value="">请选择资讯类别</option>
      						{foreach $typeList as $item}
      						<option value="{$item['type_id']}" {if isset($info) && $info['article_type'] == $item['type_id']}selected{/if}>
      						{if $item['level'] > 0}{str_repeat('&nbsp', $item['level']*2)}├ {/if}{$item['type_name']}
      						</option>
      						{/foreach}
    					</select>
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90">资讯标题<span class="c-red">*</span></th>
          			 <td>
          			 	<input nullmsg="资讯标题不能为空！" datatype="*"  name="article_title" type="text" class="input-text" id="article_title" value="{if isset($info)}{$info['article_title']}{/if}" >
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90">资讯内容<span class="c-red">*</span></th>
          			 <td>
          			 	<textarea style="width:1000px;height:240px;" name="article_content" cols="" rows="" class="textarea" id="article_content" nullmsg="资讯内容不能为空！" datatype="*">{if isset($info)}{$info['article_content']}{/if}</textarea>
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
<link href="/public/common/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="/public/common/js/umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="/public/mis/js/article.js""></script>