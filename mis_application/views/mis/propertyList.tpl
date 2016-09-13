<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 工作台<span class="c-gray en">&gt;</span> 物业服务<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
	 <div class="tabBar cl">{if checkRight(array('repair_confirm', 'repair_assign'))}<a href="{formatUrl('workbench/property?type=0')}"><span {if $type == 0}class="current"{/if}>物业报修申请</span></a>{/if}{if checkRight(array('complain_reply','complain_assign'))}<a href="{formatUrl('workbench/property?type=1')}"><span {if $type == 1}class="current"{/if}>物业投诉</span></a>{/if}</div>
	 {if $type == 0}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无物业报修申请</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>报修类型</th>
          			<th>报修内容</th>
          			<th>联系人</th>
          			<th>报修时间</th>
					<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$repair_type[$item['repair_type']]}</td>
          				<td>{$item['repair_content']}</td>
          				<td>{$item['contacts']}</td>
          				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>{$repair_status[$item['status']]}</td>
          				<td>
          					{if $item['follow_by'] == 0}
          					<a class="btn btn-primary radius repairFollow" title="指派跟进人" href="javascript:;" did="{$item['repair_id']}" style="text-decoration:none">指派跟进人</a>
          					{elseif $item['status'] == 0}
          					<a class="btn btn-primary radius repairConfirm" title="确认" href="javascript:;" did="{$item['repair_id']}" style="text-decoration:none">确认</a>
          					{else}
          					<a class="btn btn-primary radius repairFinish" title="处理完毕" href="javascript:;" did="{$item['repair_id']}" style="text-decoration:none">处理完毕</a>
          					{/if}
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
	 {if isset($pageUrl)}{$pageUrl}{/if}
	 {else}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无物业投诉</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>投诉内容</th>
          			<th>联系人</th>
          			<th>投诉时间</th>
					<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{$item['complain_content']}</td>
          				<td>{$item['contacts']}</td>
          				<td>{date('Y-m-d',$item['add_time'])}</td>
          				<td>{$complain_status[$item['status']]}</td>
          				<td>
          					{if $item['follow_by'] == 0}
          					<a class="btn btn-primary radius complainFollow" title="指派跟进人" href="javascript:;" did="{$item['complain_id']}" style="text-decoration:none">指派跟进人</a>
          					{elseif $item['status'] == 0}
          					<a class="btn btn-primary radius complainConfirm" title="确认" href="javascript:;" did="{$item['complain_id']}" style="text-decoration:none">确认</a>
          					{else}
          					<a class="btn btn-primary radius complainFinish" title="处理完毕" href="javascript:;" did="{$item['complain_id']}" style="text-decoration:none">处理完毕</a>
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
<div class="pd-20 text-c" style="display:none" id="repairFollowWindow">
	<form class="Huiform" action="{formatUrl('workbench/doRepairFollow')}" method="post">
		<input type="hidden" name="repair_id" id="f_repair_id" value="" />
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
<div class="pd-20 text-c" style="display:none" id="repairConfirmWindow">
	<form class="Huiform" action="{formatUrl('workbench/doRepairConfirm')}" method="get">
		<input type="hidden" name="repair_id" id="repair_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		 <th class="text-r" width="180">确认信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="admin_feedback" cols="" rows="" class="textarea" id="admin_feedback"></textarea></td>
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
          		     <th class="text-r" width="180"><span class="c-red">*</span>上门服务人员：</th>
          			 <td><input name="service_worker" class="input-text" value="" type="text" style="width:200px" nullmsg="上门服务人员不能为空！" datatype="s"></input></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>上门服务时间：</th>
          			 <td>
          			 <input name="service_time" class="input-text" id="service_time" value="" type="text" style="width:200px" nullmsg="上门服务时间不能为空！" datatype="*"></input>
          			 </td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
          				<input name="status" value="1" type="hidden">
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
      	</table>
	</form>
</div>
<div class="pd-20 text-c" style="display:none" id="complainConfirmWindow">
	<form class="Huiform" action="{formatUrl('workbench/doComplainConfirm')}" method="post">
		<input type="hidden" name="complain_id" id="complain_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>确认信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="feedback" cols="" rows="" class="textarea" id="feedback" nullmsg="确认信息不能为空！" datatype="s"></textarea></td>
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
          				<input name="status" value="1" type="hidden">
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
      	</table>
	</form>
</div>
<div class="pd-20 text-c" style="display:none" id="complainFollowWindow">
	<form class="Huiform" action="{formatUrl('workbench/doComplainFollow')}" method="get">
		<input type="hidden" name="complain_id" id="f_complain_id" value="" />
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
<input type="hidden" id="uploadUrl" value="{formatUrl('file/upload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/file.js""></script>
<input value="{formatUrl('workbench/doRepairConfirm')}" type="hidden" id="repairConfirmUrl">
<input value="{formatUrl('workbench/doComplainConfirm')}" type="hidden" id="complainConfirmUrl">
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="/public/mis/js/workbench.js""></script>