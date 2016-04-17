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
          			 <td>{date('H:i:s', $info['start_time'])}~{date('H:i:s', $info['end_time'])}</td>
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
        		{if checkRight('room_booking_confirm') && $info['status'] == 0}
        		<tr>
          		     <th class="text-r" style="width:100px">确认结果<span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="status" value="1" nullmsg="确认结果不能为空！" datatype="*">通过
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="status" value="2" nullmsg="确认结果不能为空！" datatype="*">不通过
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