{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('room/doConfirmBooking')}" method="post">
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">会议主题：</th>
          			 <td>{$info['meeting_title']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">会议内容：</th>
          			 <td>{$info['meeting_desc']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">时间段：</th>
          			 <td>{date('Y-m-d H:i:s', $info['start_time'])}~{date('Y-m-d H:i:s', $info['end_time'])}</td>
        		</tr>
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
          		     <th class="text-r" width="180">状态：</th>
          			 <td>{$room_booking_status[$info['status']]}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">提交时间：</th>
          			 <td>{date('Y-m-d H:i:s', $info['add_time'])}</td>
        		</tr>
        		{if checkRight('room_booking_confirm') && $info['status'] == 0 && $info['follow_by'] == $userId}
        		{if !empty($curBooking)}
        		<tr>
          		    <th class="text-r" style="width:100px;color:red">该时段已被以下会议预约</th>
          			<td>
          				<table class="table table-border table-bordered table-bg">
							<tbody>
								<tr>
									<th>会议主题</th>
									<th>时间段</th>
									<th>联系人</th>
          						</tr>
          						<tr>
          							<td>{$curBooking['meeting_title']}</td>
          							<td>{date('Y-m-d H:i:s', $curBooking['start_time'])}~{date('Y-m-d H:i:s', $curBooking['end_time'])}</td>
          							<td>{$curBooking['contacts']}</td>
          						</tr>
          					</tbody>
          				</table>
          		     </td>
        		</tr>
        		{else if !empty($bookingList)}
        		<tr>
          		    <th class="text-r" style="width:100px;color:red">该时段还有以下会议预约</th>
          			<td>
          				<table class="table table-border table-bordered table-bg">
							<tbody>
								<tr>
									<th>会议主题</th>
									<th>时间段</th>
									<th>联系人</th>
          						</tr>
          						{foreach $bookingList as $item}
          						<tr>
          							<td>{$item['meeting_title']}</td>
          							<td>{date('Y-m-d H:i:s', $item['start_time'])}~{date('Y-m-d H:i:s', $item['end_time'])}</td>
          							<td>{$item['contacts']}</td>
          						</tr>
          						{/foreach}
          					</tbody>
          				</table>
          		     </td>
        		</tr>
        		{/if}
        		<tr>
          		     <th class="text-r" style="width:100px">确认结果<span class="c-red">*</span></th>
          			<td>
          		     	{if empty($curBooking)}<input type="radio" name="status" value="1" nullmsg="确认结果不能为空！" datatype="*">通过{/if}
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="status" value="2" nullmsg="确认结果不能为空！" datatype="*">不通过
          		     </td>
        		</tr>
        		<tr>
        			<th class="text-r" style="width:100px">备注</th>
        			<td>
        				<textarea style="width:400px;height:200px" name="msg"></textarea>
        			</td>
        		</tr>
          		<tr>
        			<th></th>
      				<td colspan="2">
      					<input name="booking_id" type="hidden" value="{$info['booking_id']}">
      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
      				</td>
      			</tr>
        		{/if}
        		{if checkRight('room_booking_assign') && $info['status'] == 0 && $info['follow_by'] == 0}
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
		      					<input name="booking_id" type="hidden" value="{$info['booking_id']}">
		      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
		      				</td>
		      			</tr>
		        		{/if}
        	</tbody>
		</table>
	</form>
</div>
<script type="text/javascript" src="/public/mis/js/room.js""></script>