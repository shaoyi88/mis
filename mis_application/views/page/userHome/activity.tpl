<h3>我的活动</h3>
<hr class="thin bg-grayLighter">
{if empty($list)}
<p>未提交任何活动申请，<a href="{formatUrl('myhome/addActivity')}">点击提交活动申请</a></p>
{else}
<table class="dataTable border bordered" data-auto-width="false">
    <thead>
    <tr>
        <th>活动主题</th>
        <th>人数限制</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>提交时间</th>
        <th>当前状态</th>
        <th>操作</th>
    </tr>
    </thead>
    {foreach $list as $item}
    <tr>
        <td>{$item['activity_title']}</td>
        <td>{if $item['activity_limit']>0}{$item['activity_limit']}{else}不限{/if}</td>
        <td>{date('Y-m-d H:i:s',$item['activity_start_time'])}</td> 
        <td>{date('Y-m-d H:i:s',$item['activity_end_time'])}</td> 
        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
        <td>{$activity_audit_type[$item['activity_status']]}</td>
        <td></td>  
    </tr>
    {/foreach}
</table>
{if isset($pageUrl)}{$pageUrl}{/if}
{/if}
<script>

</script>