<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 工作台<span class="c-gray en">&gt;</span> 企业服务<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
	 <div class="tabBar cl">{if checkRight('project_apply_confirm')}<a href="{formatUrl('workbench/business?type=0')}"><span {if $type == 0}class="current"{/if}>项目需求申请</span></a>{/if}</div>
	 {if $type == 0}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无项目需求申请</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>项目名称</th>
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
          				<td>{$item['project_name']}</td>
          				<td>{$item['contacts']}</td>
      					<td>{$item['contacts_phone']}</td>
      					<td>{$item['contacts_email']}</td>
        				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>
          					<a class="btn btn-primary radius projectApplyConfirm" title="确认" href="javascript:;" did="{$item['apply_id']}" style="text-decoration:none">确认</a>
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
	  {/if}
	 </div>
</div>
<div class="pd-20 text-c" style="display:none" id="projectApplyConfirmWindow">
	<form class="Huiform" action="{formatUrl('workbench/doConfirmProjectApply')}" method="post">
		<input type="hidden" name="apply_id" id="apply_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>确认信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="feedback" cols="" rows="" class="textarea" id="feedback" nullmsg="确认信息不能为空！" datatype="s"></textarea></td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
      	</table>
	</form>
</div>
<script type="text/javascript" src="/public/mis/js/workbench.js""></script>