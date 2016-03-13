<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  俱乐部管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('club/productList')}">产品管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('club/productDoAdd')}" method="post">
		{if isset($info)}
		<input name="product_id" type="hidden" value="{$info['product_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="250"><span class="c-red">*</span>产品名称：</th>
          			 <td><input name="product_name" type="text" class="input-text" id="product_name" value="{if isset($info)}{$info['product_name']}{/if}" nullmsg="产品名称不能为空！" datatype="s"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90"><span class="c-red">*</span>产品描述：</th>
          			 <td>
          			 	<textarea style="width:900px;height:240px;" name="product_desc" cols="" rows="" class="textarea" id="product_desc" nullmsg="产品描述不能为空！" datatype="*">{if isset($info)}{$info['product_desc']}{/if}</textarea>
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
<script type="text/javascript" src="/public/mis/js/club.js"></script>