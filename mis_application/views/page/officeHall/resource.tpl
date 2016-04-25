<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;<a href="{formatUrl('officehall')}">办事大厅</a>&nbsp;>&nbsp;<span class="icon mif-palette"></span>&nbsp;公共资源</div>
{if $msg}
<p class="fg-red">错误：{$msg}</p>
{/if}
<form name="form1" action="{formatUrl('officehall/do_resource')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<h3>公共资源</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">类型</th>
        <td width="85%">
			<div class="input-control select">
			    <select id="room_type" onchange="getroom(this.value);">
			        <option value="">请选择类型</option>
			        {foreach $room_type as $key=>$item}
			        <option value="{$key}">{$item}</option>
			        {/foreach}
			    </select>
			</div>
			&nbsp;&nbsp;
			<div class="input-control select selectroom" style="display:none;">
			    <select name="room_id" id="room_id" style="width:300px;">
			    
			    </select>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">预订开始时间</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="start_time" id="start_time" placeholder="请输入预订开始时间" data-field="datetime" readonly>	    
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">预订结束时间</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="end_time" id="end_time" placeholder="请输入预订结束时间" data-field="datetime" readonly>	    
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">使用用途</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="meeting_title" id="meeting_title" placeholder="请输入使用用途">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">使用描述</th>
        <td width="85%">
			<div class="input-control textarea">
			    <textarea name="meeting_desc" placeholder="请填写描述使用概要"></textarea>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="contacts" id="contacts" placeholder="请输入联系人姓名">
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人电话</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="contacts_phone" id="contacts_phone" placeholder="请输入联系人电话">
			</div>
        </td>
    </tr>
    <tr>
        <th>&nbsp;</th>
        <td><button class="button primary block-shadow-success dosubmit">提交</button></td>
    </tr>
</table>
</form>
<div id="dtBox"></div>
{foreach $room_type as $key=>$rt}
<div id="room{$key}" style="display:none;">
{foreach $roomInfo as $item}
{if $item['room_type']==$key}
   <option value="{$item['room_id']}">{$item['room_address']}-{$item['room_name']}-可容纳{$item['room_capacity']}人</option>
{/if}
{/foreach}
</div>
{/foreach}
<script type="text/javascript">	
$(document).ready(function(){
	$("#dtBox").DateTimePicker();
});	
function getroom(val){
    $(".selectroom").hide();
    $("#room_id").empty();
    if(val){
        var sel = $("#room"+val).html();
        $("#room_id").append(sel);
        $(".selectroom").show();
    }
}
function checkform(){
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
    return false;
}	
</script>