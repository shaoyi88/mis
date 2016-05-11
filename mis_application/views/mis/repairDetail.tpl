<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('property/repair')}">物业报修管理</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('property/repairConfirm')}" method="post">
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">报修类型：</th>
          			 <td>{$repair_type[$info['repair_type']]}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">报修内容：</th>
          			 <td>{$info['repair_content']}</td>
        		</tr>
        		{if $info['repair_img']}
        		<tr>
          		     <th class="text-r" width="180">报修图片：</th>
          			 <td><img src="$info['repair_img']" width="200"></td>
        		</tr>
        		{/if}
        		<tr>
          		     <th class="text-r" width="180">联系人：</th>
          			 <td>{$info['contacts']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">联系电话：</th>
          			 <td>{$info['contacts_phone']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">联系邮箱：</th>
          			 <td>{$info['contacts_email']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">报修时间：</th>
          			 <td>{date('Y-m-d H:i:s',$info['add_time'])}</td>
        		</tr>     		
        		{if $info['status'] > 0}
        		<tr>
          		     <th class="text-r" width="180">上门服务人员：</th>
          			 <td>{$info['service_worker']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">上门服务时间：</th>
          			 <td>{date('Y-m-d H:i:s',$info['service_time'])}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">确认信息：</th>
          			 <td>{$info['admin_feedback']}</td>
        		</tr>
        		{/if}
        		{if $info['status'] == 2}
        		<tr>
          		     <th class="text-r" width="180">支付方式：</th>
          			 <td>{$info['pay_type']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">用户反馈：</th>
          			 <td>{$info['user_feedback']}</td>
        		</tr>
        		{/if}
        		<tr>
          		     <th class="text-r" width="180">当前状态：</th>
          			 <td>{$repair_status[$info['status']]}</td>
        		</tr>
        		{if $info['status'] == 0 && checkRight('repair_confirm') && $info['follow_by'] == $userId}
        		<tr>
          		     <th class="text-r" width="180">确认信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="admin_feedback" cols="" rows="" class="textarea" id="admin_feedback"></textarea></td>
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
          				<input name="status" value="1" type="hidden"></input>
          				<input name="repair_id" value="{$info['repair_id']}" type="hidden"></input>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
        		{/if}
        		{if $info['status'] == 1 && checkRight('repair_confirm') && $info['follow_by'] == $userId}
        		<tr>
          			<th></th>
          			<td>
          				<input name="status" value="2" type="hidden"></input>
          				<input name="repair_id" value="{$info['repair_id']}" type="hidden"></input>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 确认处理完毕</button>
          			</td>
        		</tr>
        		{/if}
        		{if checkRight('repair_assign') && $info['status'] == 0 && $info['follow_by'] == 0}
	        		<tr>
	          		     <th class="text-r" style="width:100px">指派跟进人<span class="c-red">*</span></th>
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
		      					<input name="repair_id" value="{$info['repair_id']}" type="hidden"></input>
		      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
		      				</td>
		      		</tr>
		        {/if}
        	</tbody>
		</table>
	</form>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="/public/mis/js/repair.js""></script>