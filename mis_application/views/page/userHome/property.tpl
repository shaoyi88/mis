<h3>我的物业</h3>
<hr class="thin bg-grayLighter">
<div class="tabcontrol2 tabs-bottom padding20" data-role="tabcontrol" data-open-target="#type{$type}">
    <ul class="tabs">
        <li><a href="#type1">报修</a></li>
        <li><a href="#type2">投诉</a></li>
        <li><a href="#type3">需求</a></li>
        {if isset($list4)}
        <li><a href="#type4">费用</a></li>
        {/if}
    </ul>
    <div class="frames">
        <div class="frame" id="type1">
        {if !empty($list1)}
		<table class="dataTable border bordered" data-auto-width="false">
		    <thead>
		    <tr>
		        <th>报修类型</th>
		        <th>报修内容</th>
		        <th>联系人</th>
		        <th>联系电话</th>
		        <th>报修时间</th>
		        <th>当前状态</th>
		        <th>操作</th>
		    </tr>
		    </thead>
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
		    <thead>
		    <tr>
		        <th>投诉内容</th>
		        <th>联系人</th>
		        <th>联系电话</th>
		        <th>投诉时间</th>
		        <th>当前状态</th>
		        <th>操作</th>
		    </tr>
		    </thead>
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
		    <thead>
		    <tr>
		        <th>需求类型</th>
		        <th>需求内容</th>
		        <th>联系人</th>
		        <th>联系电话</th>
		        <th>提交时间</th>
		        <th>当前状态</th>
		        <th>操作</th>
		    </tr>
		    </thead>
		    {foreach $list3 as $item}
		    <tr>
		        <td>{$need_type[$item['need_type']]}</td>
		        <td>{$item['need_content']}</td> 
		        <td>{$item['contacts']}</td> 
		        <td>{$item['contacts_phone']}</td>
		        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
		        <td>{$need_status[$item['status']]}</td>
		        <td></td>  
		    </tr>
		    {/foreach}
		</table>
		{if isset($pageUrl3)}{$pageUrl3}{/if}
		{else}
		<div>暂无需求</div>
        {/if}
        </div>
        {if isset($list4)}
        <div class="frame" id="type4">       
        {if !empty($list4)}
		<table class="dataTable border bordered" data-auto-width="false">
		    <thead>
		    <tr>
		        <th>日期</th>
		        <th>物业费</th>
		        <th>水费</th>
		        <th>电费</th>
		        <th>合计</th>
		        <th>支付状态</th>
		        <th>操作</th>
		    </tr>
		    </thead>
		    {foreach $list4 as $item}
		    <tr>
		        <td>{date("Y年m月",$item['fee_date'])}</td>
		        <td>{$item['property_fee_amount']}</td>
		        <td>{$item['water_fee_amount']}</td> 
		        <td>{$item['elec_fee_amount']}</td> 
		        <td>{$item['elec_fee_amount']+$item['water_fee_amount']+$item['property_fee_amount']}</td>
		        <td>{if $item['pay_status']==1}已支付{else}未支付{/if}</td>
		        <td></td>  
		    </tr>
		    {/foreach}
		</table>
		{if isset($pageUrl4)}{$pageUrl4}{/if}
		{else}
		<div>暂无费用</div>
        {/if}
        </div>
        {/if}
    </div>
</div>

<script>
    $(function(){
        $("#tab-control").tabcontrol();
    });
</script>