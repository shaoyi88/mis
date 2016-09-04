<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker.css">
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker.js?v=101"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="/public/common/js/newdate/DateTimePicker-ltie9.css" />
<script type="text/javascript" src="/public/common/js/newdate/DateTimePicker-ltie9.js"></script>
<![endif]-->
<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;<a href="{formatUrl('officehall')}">办事大厅</a>&nbsp;>&nbsp;<span class="icon mif-wrench"></span>&nbsp;物业&nbsp;><a href="{formatUrl('officehall/property?type=1')}" {if $type==1}class="fg-dark"{/if}>&nbsp;报修</a>&nbsp;|&nbsp;<a href="{formatUrl('officehall/property?type=2')}" {if $type==2}class="fg-dark"{/if}>投诉</a>&nbsp;|&nbsp;<a href="{formatUrl('officehall/property?type=3')}" {if $type==3}class="fg-dark"{/if}>需求</a>&nbsp;</div>
{if $msg}
<p class="fg-red">错误：{$msg}</p>
{/if}
<form name="form1" action="{formatUrl('officehall/do_property')}" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
<input type="hidden" name="type" value="{$type}">
{if $type==1} 
<h3>报修</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">报修类型</th>
        <td width="85%">
			<div class="input-control select">
			    <select name="repair_type">
			        <option value="">请选择报修类型</option>
			        {foreach $repair_type as $key=>$item}
			        <option value="{$key}">{$item}</option>
			        {/foreach}
			    </select>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">报修内容</th>
        <td width="85%">
			<div class="input-control textarea">
			    <textarea name="repair_content"  placeholder="请填写报修内容详情"></textarea>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">房号</th>
        <td width="85%">
            <div class="input-control">
                <input type="text" name="room_no" id="room_no" placeholder="请输入房号">
            </div>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="contacts" id="contacts" placeholder="请输入联系人">	    
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
{/if}
{if $type==2} 
<h3>投诉</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">投诉内容</th>
        <td width="85%">
			<div class="input-control textarea">
			    <textarea name="complain_content"  placeholder="请填写投诉内容详情"></textarea>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="contacts" id="contacts" placeholder="请输入联系人">	    
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
{/if}
{if $type==3} 
<h3>需求</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">需求类型</th>
        <td width="85%">
			<div class="input-control select">
			    <select name="need_type">
			        <option value="">请选择需求类型</option>
			        {foreach $need_type as $key=>$item}
			        <option value="{$key}">{$item}</option>
			        {/foreach}
			    </select>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">需求内容</th>
        <td width="85%">
			<div class="input-control textarea">
			    <textarea name="need_content"  placeholder="请填写需求内容详情"></textarea>
			</div>
        </td>
    </tr>
    <tr>
        <th width="15%">联系人</th>
        <td width="85%">
			<div class="input-control">
			    <input type="text" name="contacts" id="contacts" placeholder="请输入联系人">	    
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
{/if}
</form>
<div id="dtBox"></div>
<script type="text/javascript">	
$(document).ready(function(){
	$("#dtBox").DateTimePicker();
});	
function checkform(){
    $(".block-shadow-success").attr('disabled',true);
    document.form1.submit();
    return false;
}	
</script>