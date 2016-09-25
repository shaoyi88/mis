<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 工作台<span class="c-gray en">&gt;</span> 企业服务<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
	 <div class="tabBar cl">
	 	{if checkRight(array('project_apply_confirm','project_apply_assign'))}
	 		<a href="{formatUrl('workbench/business?type=0')}">
	 			<span style="position:relative" {if $type == 0}class="current"{/if}>项目需求申请
	 			{if isset($num1) && $num1 > 0}
	 				<i style="z-index:999;display: block;background:#f00;border-radius:50%;width: 5px;height: 5px;top: -2px;right: -2px;position:absolute;"></i>
	 			{/if}
	 			</span>
	 		</a>
	 	{/if}
	 	{if checkRight(array('room_booking_confirm','room_booking_assign'))}
	 		<a href="{formatUrl('workbench/business?type=1')}">
	 			<span style="position:relative" {if $type == 1}class="current"{/if}>房间预订申请
	 			{if isset($num2) && $num2 > 0}
	 				<i style="z-index:999;display: block;background:#f00;border-radius:50%;width: 5px;height: 5px;top: -2px;right: -2px;position:absolute;"></i>
	 			{/if}
	 			</span>
	 		</a>
	 	{/if}
	 	{if checkRight(array('potential_follow','potential_assign'))}
	 		<a href="{formatUrl('workbench/business?type=2')}">
	 			<span style="position:relative" {if $type == 2}class="current"{/if}>潜在客户跟进
	 			{if isset($num3) && $num3 > 0}
	 				<i style="z-index:999;display: block;background:#f00;border-radius:50%;width: 5px;height: 5px;top: -2px;right: -2px;position:absolute;"></i>
	 			{/if}
	 			</span>
	 		</a>
	 	{/if}
	 </div>
	 {if $type == 0}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无项目需求申请</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>申请类型</th>
          			<th>申请内容</th>
          			<th>联系人</th>
          			<th>申请时间</th>
					<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$apply_type[$item['apply_type']]}</td>
          				<td>{$item['apply_content']}</td>
          				<td>{$item['contacts']}</td>
          				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>{$apply_status[$item['status']]}</td>
          				<td>
          					{if $item['follow_by'] == 0}
          					<a class="btn btn-primary radius projectApplyFollow" title="指派跟进人" href="javascript:;" did="{$item['apply_id']}" style="text-decoration:none">指派跟进人</a>
          					{else}
          					<a class="btn btn-primary radius projectApplyConfirm" title="跟进" href="javascript:;" did="{$item['apply_id']}" style="text-decoration:none">跟进</a>
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
          					{if checkRight('room_booking_export')}
          					&nbsp;&nbsp;<a class="btn btn-primary radius" title="导出申请表" href="{formatUrl('workbench/exportRoomBooking?id=')}{$item['booking_id']}" style="text-decoration:none">导出申请表</a>
          					{/if}
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
        			<th>公司名</th>
          		 	<th>联系人</th>
			        <th>联系电话</th>
			        <th>提交时间</th>
			        <th>状态</th>
			        <th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
      					<td>{$item['enterprise_name']}</td> 
          			 	<td>{$item['enterprise_contact']}</td> 
				        <td>{$item['enterprise_contact_mobile']}</td> 
				        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td> 
				        <td>{if $item['status'] == 0}待跟进{else}已跟进{/if}</td>
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
          		     <th class="text-r" width="180"><span class="c-red">*</span>跟进信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="msg" cols="" rows="" class="textarea" id="msg" nullmsg="跟进信息不能为空！" datatype="*"></textarea></td>
        		</tr>
        		<tr>
					<th class="text-r" style="width:100px">是否需要领导协助 <span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="need_help" value="1" nullmsg="请选择是否需要领导协助！" datatype="*">是
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="need_help" value="0" nullmsg="请选择是否需要领导协助！" datatype="*">否
          		     </td>
        		</tr>
				<tr>
					<th class="text-r" style="width:100px">上传附件</th>
          			<td>
          		     	<div id="uploader">
          		     		<div class="btns"><div id="picker">选择文件</div></div>
							<p id="result"></p>
						</div>
						<input type="hidden" name="attachment" value="" id="attachment">
          		    </td>
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
		<input name="status" value="1" type="hidden">
		<table class="table table-bg table-border table-bordered">
			<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>跟进信息：</th>
          			 <td><textarea style="width:300px;height:140px;" name="msg" cols="" rows="" class="textarea" id="msg" nullmsg="跟进信息不能为空！" datatype="*"></textarea></td>
        		</tr>
        		<tr>
					<th class="text-r" style="width:100px">是否需要领导协助 <span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="need_help" value="1" nullmsg="请选择是否需要领导协助！" datatype="*">是
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="need_help" value="0" nullmsg="请选择是否需要领导协助！" datatype="*">否
          		     </td>
        		</tr>
				<tr>
					<th class="text-r" style="width:100px">上传附件</th>
          			<td>
          		     	<div id="uploader1">
          		     		<div class="btns"><div id="picker1">选择文件</div></div>
							<p id="result1"></p>
						</div>
						<input type="hidden" name="attachment" value="" id="attachment1">
          		    </td>
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
<input type="hidden" id="uploadUrl" value="{formatUrl('file/upload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/file.js""></script>
<script type="text/javascript" src="/public/mis/js/workbench.js""></script>