<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 工作台<span class="c-gray en">&gt;</span> 企业服务<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
	 <div class="tabBar cl">
	 	{if checkRight('project_apply_confirm')}<a href="{formatUrl('workbench/business?type=0')}"><span {if $type == 0}class="current"{/if}>项目需求申请</span></a>{/if}
	 	{if checkRight('room_booking_confirm')}<a href="{formatUrl('workbench/business?type=1')}"><span {if $type == 1}class="current"{/if}>房间预订申请</span></a>{/if}
	 	{if checkRight('potential_follow')}<a href="{formatUrl('workbench/business?type=2')}"><span {if $type == 2}class="current"{/if}>潜在客户跟进</span></a>{/if}
	 </div>
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
          					{if $item['follow_by'] == 0}
          					<a class="btn btn-primary radius projectApplyFollow" title="指派跟进人" href="javascript:;" did="{$item['apply_id']}" style="text-decoration:none">指派跟进人</a>
          					{else}
          					<a class="btn btn-primary radius projectApplyConfirm" title="确认" href="javascript:;" did="{$item['apply_id']}" style="text-decoration:none">确认</a>
          					{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
	  {/if}
	  {if $type == 1}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无房间预订申请</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>类型</th>
          			<th>名称</th>
          			<th>时间段</th>
          			<th>会议主题</th>
          			<th>联系人</th>
          			<th>申请时间</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$room_type[$item['room_type']]}</td>
          				<td>{$item['room_name']}</td>
      					<td>{date('Y-m-d H:i:s', $item['start_time'])}~{date('Y-m-d H:i:s', $item['end_time'])}</td>
      					<td>{$item['meeting_title']}</td>
      					<td>{$item['contacts']}</td>
        				<td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
          				<td>
          					<a class="btn btn-primary radius roomBookingConfirm" title="查看" href="javascript:;" did="{$item['booking_id']}" style="text-decoration:none">查看</a>
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
	  {/if}
	   {if $type == 2}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无待跟进的潜在客户</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          		 	<th>企业名称</th>
			        <th>联系人</th>
			        <th>联系电话</th>
			        <th>提交时间</th>
			        <th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          			 <td>{$item['enterprise_name']}</td>
				        <td>{$item['enterprise_contact']}</td> 
				        <td>{$item['enterprise_contact_mobile']}</td> 
				        <td>{date('Y-m-d H:i:s',$item['app_time'])}</td> 
          				<td>
          					{if $item['follow_by'] == 0}
          					<a class="btn btn-primary radius potentialFollow" title="指派跟进人" href="javascript:;" did="{$item['enterprise_id']}" style="text-decoration:none">指派跟进人</a>
          					{else}
          					<a class="btn btn-primary radius potentialConfirm" title="跟进" href="javascript:;" did="{$item['enterprise_id']}" style="text-decoration:none">跟进</a>
          					{/if}
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
<div class="pd-20 text-c" style="display:none" id="projectApplyFollowWindow">
	<form class="Huiform" action="{formatUrl('workbench/doFollowProjectApply')}" method="post">
		<input type="hidden" name="apply_id" id="f_apply_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">跟进人<span class="c-red">*</span></th>
          			<td>
          		     	<select name="follow_by" nullmsg="请选择跟进人" datatype="*">
          		     		<option value="">请选择跟进人</option>
          		     		{foreach $adminList as $item}
          		     			<option value="{$item['admin_id']}">{$item['admin_name']}</option>
          		     		{/foreach}
          		     	</select>
          		     </td>
        		</tr>
          		<tr>
        			<th></th>
      				<td colspan="2">
      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
      				</td>
      			</tr>
      	</table>
	</form>
</div>
<div class="pd-20 text-c" style="display:none" id="potentialConfirmWindow">
	<form class="Huiform" action="{formatUrl('workbench/doFollowPotential')}" method="post">
		<input type="hidden" name="enterprise_id" id="enterprise_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>跟进信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="msg" cols="" rows="" class="textarea" id="msg" nullmsg="跟进信息不能为空！" datatype="s"></textarea></td>
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
<div class="pd-20 text-c" style="display:none" id="potentialFollowWindow">
	<form class="Huiform" action="{formatUrl('workbench/doFollowPotential')}" method="post">
		<input type="hidden" name="enterprise_id" id="f_enterprise_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">跟进人<span class="c-red">*</span></th>
          			<td>
          		     	<select name="follow_by" nullmsg="请选择跟进人" datatype="*">
          		     		<option value="">请选择跟进人</option>
          		     		{foreach $adminList as $item}
          		     			<option value="{$item['admin_id']}">{$item['admin_name']}</option>
          		     		{/foreach}
          		     	</select>
          		     </td>
        		</tr>
          		<tr>
        			<th></th>
      				<td colspan="2">
      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
      				</td>
      			</tr>
      	</table>
	</form>
</div>
<input type="hidden" id="roomBookingConfirmUrl" value="{formatUrl('room/viewBooking')}"></input>
<script type="text/javascript" src="/public/mis/js/workbench.js""></script>