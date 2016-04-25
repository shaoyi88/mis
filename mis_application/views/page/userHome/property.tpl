<h3>我的物业申请</h3>
<div class="tabcontrol2 tabs-bottom padding20" data-role="tabcontrol">
    <ul class="tabs">
        <li><a href="#type1">报修</a></li>
        <li><a href="#type2">投诉</a></li>
        <li><a href="#type3">需求</a></li>
    </ul>
    <div class="frames">
        <div class="frame" id="type1">
        {if !empty($list1)}
		<table class="dataTable border bordered" data-auto-width="false">
		    <tr>
		        <th>报修类型</th>
		        <th>报修内容</th>
		        <th>联系人</th>
		        <th>联系电话</th>
		        <th>报修时间</th>
		        <th>当前状态</th>
		        <th>操作</th>
		    </tr>
		    {foreach $list1 as $item}
		    <tr>
		        <td>{$repair_type[$item['repair_type']]}</td>
		        <td>{$item['repair_content']}</td> 
		        <td>{$item['contacts']}</td> 
		        <td>{$item['contacts_phone']}</td>
		        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
		        <td>{$repair_status[$item['status']]}</td>
		        <td></td>  
		    </tr>
		    {/foreach}
		</table>
		{if isset($pageUrl1)}{$pageUrl1}{/if}
		{else}
		<div>暂无报修</div>
        {/if}
        </div>
        <div class="frame" id="type2">
        {if !empty($list2)}
		<table class="dataTable border bordered" data-auto-width="false">
		    <tr>
		        <th>投诉内容</th>
		        <th>联系人</th>
		        <th>联系电话</th>
		        <th>投诉时间</th>
		        <th>当前状态</th>
		        <th>操作</th>
		    </tr>
		    {foreach $list2 as $item}
		    <tr>
		        <td>{$item['complain_content']}</td> 
		        <td>{$item['contacts']}</td> 
		        <td>{$item['contacts_phone']}</td>
		        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
		        <td>{$complain_status[$item['status']]}</td>
		        <td></td>  
		    </tr>
		    {/foreach}
		</table>
		{if isset($pageUrl2)}{$pageUrl2}{/if}
		{else}
		<div>暂无投诉</div>
        {/if}
        </div>
        <div class="frame" id="type3">
        {if !empty($list3)}
		<table class="dataTable border bordered" data-auto-width="false">
		    <tr>
		        <th>需求类型</th>
		        <th>需求内容</th>
		        <th>联系人</th>
		        <th>联系电话</th>
		        <th>提交时间</th>
		        <th>当前状态</th>
		        <th>操作</th>
		    </tr>
		    {foreach $list3 as $item}
		    <tr>
		        <td>{$apply_type[$item['apply_type']]}</td>
		        <td>{$item['apply_content']}</td> 
		        <td>{$item['contacts']}</td> 
		        <td>{$item['contacts_phone']}</td>
		        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
		        <td>{$repair_status[$item['status']]}</td>
		        <td></td>  
		    </tr>
		    {/foreach}
		</table>
		{if isset($pageUrl3)}{$pageUrl3}{/if}
		{else}
		<div>暂无需求</div>
        {/if}
        </div>
    </div>
</div>

<script>
    $(function(){
        $("#tab-control").tabcontrol();
    });
</script>