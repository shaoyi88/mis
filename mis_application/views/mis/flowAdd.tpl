<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('property/flow')}">入驻流程配置</a> <span class="c-gray en">&gt;</span> {$typeMsg}</nav>
<div class="pd-20">
	<form class="Huiform" id="form-flow-add" action="{formatUrl('property/doAddFlow')}" method="post">
		{if isset($info)}
		<input name="flow_id" type="hidden" value="{$info['flow_id']}">
		{/if}
		<table class="table table-border table-bordered table-bg">
			<tbody>
        		<tr>
          		     <th class="text-r" width="90">流程名<span class="c-red">*</span></th>
          			 <td>
          			 	<input nullmsg="流程名不能为空！" datatype="s"  name="flow_name" type="text" class="input-text" id="flow_name" value="{if isset($info)}{$info['flow_name']}{/if}" >
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90">是否默认<span class="c-red">*</span></th>
          			 <td>
          			 	<input type="radio" name="is_default" value="1" nullmsg="是否默认不能为空！" datatype="*" {if isset($info) && $info['is_default']==1}checked{/if}>是</input>&nbsp;&nbsp;&nbsp;&nbsp;
          			 	<input type="radio" name="is_default" value="0" nullmsg="是否默认不能为空！" datatype="*" {if isset($info) && $info['is_default']==0}checked{/if}>否</input>
          			 </td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="90">
          		     	<a href="javascript:;" class="addStep" style="color:orange;font-size:20px">+</a>步骤<span class="c-red">*</span>
          		     </th>
          			 <td>
          			 	<textarea style="width:1000px;height:240px;" name="step_content[]" id="step_content" cols="" rows="" class="textarea" nullmsg="步骤内容不能为空！" datatype="*">{if isset($stepInfo)}{$stepInfo[0]['step_content']}{/if}</textarea>
          			 </td>
        		</tr>
        		{if isset($stepInfo)}
        		{foreach $stepInfo as $k=>$step}
        			{if $k != 0}
        			<tr>
						<th class="text-r" width="90"><a href="javascript:;" class="delStep" style="color:orange;font-size:20px">-</a>步骤<span class="c-red">*</span></th>
						<td>
							<textarea id="step_{$step['step_id']}" style="width:1000px;height:240px;" name="step_content[]" cols="" rows="" class="textarea" nullmsg="步骤内容不能为空！" datatype="*">{$step['step_content']}</textarea>
						</td>
					</tr>
					{/if}
        		{/foreach}
        		{/if}
        		<tr id="opt">
          			<th></th>
          			<td>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> {$typeMsg}</button>
          			</td>
        		</tr>
        	</tbody>
        </table>
	</form>
</div>
<script type="text/template" id="stepTpl">
<tr>
	<th class="text-r" width="90"><a href="javascript:;" class="delStep" style="color:orange;font-size:20px">-</a>步骤<span class="c-red">*</span></th>
	<td>
		<textarea id="<%step_id%>" style="width:1000px;height:240px;" name="step_content[]" cols="" rows="" class="textarea" nullmsg="步骤内容不能为空！" datatype="*"></textarea>
	</td>
</tr>
</script>
<script type="text/javascript" src="/public/common/js/hogan-2.0.0.min.js"></script>
<link href="/public/common/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/public/common/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="/public/common/js/umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="/public/mis/js/flow.js""></script>