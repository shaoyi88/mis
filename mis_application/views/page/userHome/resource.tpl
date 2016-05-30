<h3>公共资源申请</h3>
<hr class="thin bg-grayLighter">
{if empty($list)}
<p>未提交任何申请，<a href="{formatUrl('officehall/resource')}">点击提交公共资源申请</a></p>
{else}
<table class="dataTable border bordered" data-auto-width="false">
    <thead>
    <tr>
        <th>预订资源</th>
        <th>使用用途</th>
        <th>使用描述</th>
        <th>使用开始时间</th>
        <th>使用结束时间</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>当前状态</th>
        <th>操作</th>
    </tr>
    </thead>
    {foreach $list as $item}
    <tr>
        <td>{$item['room_address']}<br/>{$item['room_name']}</td>
        <td>{$item['meeting_title']}</td> 
        <td>{$item['meeting_desc']}</td> 
        <td>{date('Y-m-d H:i:s',$item['start_time'])}</td>
        <td>{date('Y-m-d H:i:s',$item['end_time'])}</td>
        <td>{$item['contacts']}</td>
        <td>{$item['contacts_phone']}</td>
        <td>{$room_status[$item['status']]}</td>
        <td></td>  
    </tr>
    {/foreach}
</table>
{if isset($pageUrl)}{$pageUrl}{/if}
{/if}
<script>

</script>