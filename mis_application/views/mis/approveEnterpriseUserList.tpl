<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 工作台<span class="c-gray en">&gt;</span> 企业审批<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div id="tab-system" class="HuiTab">
	 <div class="tabBar cl">
	 {if checkRight(array('enterprise_user_approve', 'enterprise_user_assign'))}
	 	<a href="{formatUrl('workbench/enterprise?type=0')}">
	 		<span style="position:relative" {if $type == 0}class="current"{/if}>企业用户申请
	 			{if isset($num1) && $num1 > 0}
	 			<i style="z-index:999;display: block;background:#f00;border-radius:50%;width: 5px;height: 5px;top: -2px;right: -2px;position:absolute;"></i>
	 			{/if}
	 		</span>
	 	</a>
	 {/if}
	 {if checkRight(array('apply_assign','apply_audit'))}
	 	<a href="{formatUrl('workbench/enterprise?type=1')}">
	 		<span style="position:relative" {if $type == 1}class="current"{/if}>企业入驻申请
	 			{if isset($num2) && $num2 > 0}
	 			<i style="z-index:999;display: block;background:#f00;border-radius:50%;width: 5px;height: 5px;top: -2px;right: -2px;position:absolute;"></i>
	 			{/if}
	 		</span>
	 	</a>
	 {/if}
	 </div>
	  {if $type == 0}
	 {if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无待审批的企业用户</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>企业</th>
          			<th>姓名</th>
          			<th>职位</th>
          			<th>申请时间</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
			{foreach $dataList as $item}
				<tr class="text-c">
        			<td>{$item['enterprise_name']}</td>
        			<td>{$item['user_name']}</td>
        			<td>{$item['user_position']}</td>
        			<td>{date('Y-m-d H:i:s', $item['add_time'])}</td>
          			<td>
          				{if $item['follow_by'] == 0}
          				<a class="btn btn-primary radius enterpriseUserFollow" href="javascript:;" title="指派跟进人" aid="{$item['apply_id']}" style="text-decoration:none">指派跟进人</a>
          				{else}
          				<a class="btn btn-primary radius enterpriseUserApprove" href="javascript:;" title="审核" eid="{$item['enterprise_id']}" aid="{$item['apply_id']}" uid="{$item['user_id']}" style="text-decoration:none">审核</a>
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
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无待审批的企业入驻</h2></div>
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
        		 	<td><a class="c-primary eDetail" title="企业详情" href="javascript:;" did="{$item['enterprise_id']}"><u class="c-primar">{$item['enterprise_name']}</u></a></td>
				    <td>{$item['enterprise_contact']}</td> 
				    <td>{$item['enterprise_contact_mobile']}</td> 
				    <td>{date('Y-m-d H:i:s',$item['app_time'])}</td> 
          			<td>
          				{if $item['follow_by'] == 0}
          				<a class="btn btn-primary radius enterpriseApplyFollow" href="javascript:;" title="指派跟进人" did="{$item['enterprise_id']}" style="text-decoration:none">指派跟进人</a>
          				{else if $item['deal_status'] == 0}
          				<a class="btn btn-primary radius enterpriseApplyMake" href="javascript:;" title="立项" did="{$item['enterprise_id']}" style="text-decoration:none">立项</a>
          				{else}
          				<a class="btn btn-primary radius enterpriseApplyAudit" href="javascript:;" title="审核" is_change="{$item['is_change']}" did="{$item['enterprise_id']}" style="text-decoration:none">审核</a>
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
<div class="pd-20 text-c" style="display:none" id="enterpriseUserFollowWindow">
	<form class="Huiform" action="{formatUrl('workbench/doEnterpriseUserFollow')}" method="post">
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
<div class="pd-20 text-c" style="display:none" id="enterpriseUserApproveWindow">
	<form class="Huiform" action="{formatUrl('workbench/doApproveEnterpriseUser')}" method="post">
		<input type="hidden" name="apply_id" id="apply_id" value="" />
		<input type="hidden" name="user_id" id="user_id" value="" />
		<input type="hidden" name="enterprise_id" id="enterprise_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">审核结果<span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="status" value="1" nullmsg="审核结果不能为空！" datatype="*">通过
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="status" value="2" nullmsg="审核结果不能为空！" datatype="*">驳回
          		     </td>
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
          		     <th class="text-r">审核意见<span class="c-red">*</span></th>
          		     <td>
          		     	<textarea style="width:300px;height:150px;" name="msg" nullmsg="审核意见不能为空！" datatype="*"></textarea>
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
<div class="pd-20 text-c" style="display:none" id="enterpriseApplyFollowWindow">
	<form class="Huiform" action="{formatUrl('workbench/doEnterpriseApplyFollow')}" method="post">
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
<div class="pd-20 text-c" style="display:none" id="enterpriseApplyMakeWindow">
	<form class="Huiform" action="{formatUrl('workbench/doEnterpriseApplyFollow')}" method="post">
		<input type="hidden" name="enterprise_id" id="m_enterprise_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">立项判断<span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="deal_status" value="2" nullmsg="立项判断不能为空！" datatype="*">立项
		          		&nbsp;&nbsp;
		          		<input type="radio" name="deal_status" value="1" nullmsg="立项判断不能为空！" datatype="*">放弃
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
<div class="pd-20 text-c" style="display:none" id="enterpriseApplyAuditWindow">
	<form class="Huiform" action="{formatUrl('workbench/doEnterpriseApplyFollow')}" method="post">
		<input type="hidden" name="enterprise_id" id="a_enterprise_id" value="" />
		<table class="table table-bg table-border table-bordered">
			<tr>
          		<th class="text-r" style="width:100px">审核结果<span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="deal_status" value="3" nullmsg="审核结果不能为空！" datatype="*">通过
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="deal_status" value="4" nullmsg="审核结果不能为空！" datatype="*">不通过
          		     </td>
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
          		     	<div id="uploader_1">
          		     		<div class="btns"><div id="picker">选择文件</div></div>
							<p id="result_1"></p>
						</div>
						<input type="hidden" name="attachment" value="" id="attachment_1">
          		    </td>
        		</tr>
        		<tr>
          		     <th class="text-r">审核意见<span class="c-red">*</span></th>
          		     <td>
          		     	<textarea style="width:300px;height:150px;" name="msg" nullmsg="审核意见不能为空！" datatype="*"></textarea>
          		     </td>
          		</tr> 
          		<tr>
        			<th></th>
      				<td colspan="2">
      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
      					&nbsp;&nbsp;
      					<button id="isChangeBtn" type="button" class="btn btn-success radius"><i class="icon-ok"></i>转为潜在用户</button>
      					<span id="isChangeMsg">(已转为潜在用户)</span>
      				</td>
      			</tr>
      	</table>
	</form>
</div>
<input type="hidden" id="uploadUrl" value="{formatUrl('file/upload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/file.js""></script>
<input type="hidden" id="eDetailUrl" value="{formatUrl('investment/applyDetail')}" />
<input type="hidden" id="changeUrl" value="{formatUrl('workbench/doEnterpriseApplyChange')}" />
<script type="text/javascript" src="/public/mis/js/workbench.js""></script>