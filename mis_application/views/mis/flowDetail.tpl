<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务<span class="c-gray en">&gt;</span> <a href="{formatUrl('property/flow')}">入驻流程配置</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
	<table class="table table-border table-bordered table-bg">
		<tbody>
			<tr>
      		     <th class="text-r" width="180">流程名：</th>
      			 <td>{$info['flow_name']}</td>
    		</tr>
			<tr>
      		     <th class="text-r" width="180">是否默认：</th>
      			 <td>{if $info['is_default'] == 0}否{else}是{/if}</td>
    		</tr>
    		<tr>
      		     <th class="text-r" width="180">添加时间：</th>
      			 <td>{date('Y-m-d H:i:s',$info['add_time'])}</td>
    		</tr>
		</tbody>
	</table>
</div>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
		<div class="tabBar cl">
			{foreach $stepInfo as $k=>$item}
			<span>步骤{$k+1}</span>
			{/foreach}
		</div>
		{foreach $stepInfo as $k=>$item}
		<div class="tabCon">
			{$item['step_content']}
		</div>
		{/foreach}
	</div>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript">
$(function(){
	$.Huitab("#tab-system .tabBar span","#tab-system .tabCon","current","click","0");
});
</script>