<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  企业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('project/index')}">项目需求管理</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('project/doAdd')}" method="post">
		{if isset($info)}
		<input name="project_id" type="hidden" value="{$info['project_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
        		<tr>
          		     <th class="text-r" width="90">项目名称<span class="c-red">*</span></th>
          			 <td>
          			 	<input nullmsg="项目名称不能为空！" datatype="s"  name="project_name" type="text" class="input-text" id="project_name" value="{if isset($info)}{$info['project_name']}{/if}" >
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90">项目描述<span class="c-red">*</span></th>
          			 <td>
          			 	<textarea style="width:1000px;height:240px;" name="project_desc" cols="" rows="" class="textarea" id="project_desc" nullmsg="项目描述不能为空！" datatype="*">{if isset($info)}{$info['project_desc']}{/if}</textarea>
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
<script type="text/javascript" src="/public/mis/js/project.js""></script>