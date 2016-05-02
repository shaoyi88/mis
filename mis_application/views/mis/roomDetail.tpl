<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  企业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('room/roomList?t=')}{$t}"> {$room_type[$t]}管理</a> <span class="c-gray en">&gt;</span> 查看预订情况</nav>
<div class="pd-20 text-c ml-10 mr-10">
    <h3>{$info['room_name']}{$date}预订信息</h3>
</div>
<div class="text-c">
	<form class="Huiform" action="{formatUrl('room/detail')}" method="get">
		<input nullmsg="请选择日期！" datatype="*" class="input-text" style="width:250px" type="text" id="date" name="date" value="{$date}" placeholder="请选择日期">
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="hidden" value="{$t}" name="t"></input>
    	<input type="hidden" value="{$info['room_id']}" name="did"></input>
    	<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜预订信息</button>
	</form>
</div>
<div class="pd-20">
	{if empty($dataList)}
	 	<div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无预订信息</h2></div>
	 {else}
	 	<table class="table table-border table-bg table-bordered table-hover">
			<thead>
        		<tr class="text-c">
          			<th>时间段</th>
          			<th>会议主题</th>
          			<th>联系人</th>
          			<th>状态</th>
          			<th>操作</th>
        		</tr>
      		</thead>
      		<tbody>
      			{foreach $dataList as $item}
      				<tr class="text-c">
          				<td>{date('H:i:s', $item['start_time'])}~{date('H:i:s', $item['end_time'])}</td>
          				<td>{$item['meeting_title']}</td>
          				<td>{$item['contacts']}</td>
          				<td>{$room_booking_status[$item['status']]}</td>
          				<td>
          					<a title="查看" href="javascript:;" class="ml-5 btn btn-primary radius view" did="{$item['booking_id']}" style="text-decoration:none">查看</a>
          				</td>
        		</tr>
      			{/foreach}
      		</tbody>
      	</table>
	 {/if}
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="{formatUrl('room/roomList?t=')}{$t}" style="text-decoration:none;height:auto">返回</a>
</div>
<input type="hidden" id="viewUrl" value="{formatUrl('room/viewBooking')}"></input>
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="/public/mis/js/room.js""></script>