<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  企业服务<span class="c-gray en">&gt;</span> <a href="{formatUrl('project/index')}">项目需求管理</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
		<div class="tabBar cl"><span>项目需求详情</span><span class="tabBar">项目申请情况</span></div>
		<div class="tabCon">
				<table class="table table-border table-bordered table-bg">
					<tbody>
						<tr>
		          		     <th class="text-r" width="180">项目名称：</th>
		          			 <td>{$info['project_name']}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">项目描述：</th>
		          			 <td>{$info['project_desc']}</td>
		        		</tr>
		        		<tr>
		          		     <th class="text-r" width="180">添加时间：</th>
		          			 <td>{date('Y-m-d',$info['add_time'])}</td>
		        		</tr>
		        	</tbody>
				</table>
			</form>
		</div>
		<div class="tabCon">
			{if empty($dataList)}
	 			<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无申请</h2></div>
	 		{else}
	 			<table class="table table-border table-bg table-bordered table-hover">
					<thead>
        				<tr class="text-c">
          					<th>用户</th>
          					<th>联系电话</th>
          					<th>联系邮箱</th>
          					<th>申请时间</th>
          					<th>操作</th>
        				</tr>
      				</thead>
      				<tbody>
      				{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$item['contacts']}</td>
      					<td>{$item['contacts_phone']}</td>
      					<td>{$item['contacts_email']}</td>
        				<td>{date('Y-m-d',$item['add_time'])}</td>
        				<td>
          					
          				</td>
          			</tr>
      				{/foreach}
					</tbody>
				</table>
	 		{/if}
	 		{if isset($pageUrl)}{$pageUrl}{/if}
		</div>
	</div>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="{formatUrl('project/index')}" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/mis/js/project.js""></script>
<script type="text/javascript">
$(function(){
	$.Huitab("#tab-system .tabBar span","#tab-system .tabCon","current","click","{if $type}{$type}{else}0{/if}");
});
</script>