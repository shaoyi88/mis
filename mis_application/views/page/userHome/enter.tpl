<h3>我的申请</h3>
<hr class="thin bg-grayLighter">
{if empty($list)}
<p>未提交任何申请，<a href="{formatUrl('officehall/application')}">点击提交入驻申请</a></p>
{else}
<table class="dataTable border bordered" data-auto-width="false">
    <thead>
    <tr>
        <td>企业名称</td>
        <td>联系人</td>
        <td>联系电话</td>
        <td>提交时间</td>
        <td>操作</td>
    </tr>
    </thead>
    {foreach $list as $item}
    <tr>
        <td>{$item['enterprise_name']}</td>
        <td>{$item['enterprise_contact']}</td> 
        <td>{$item['enterprise_contact_mobile']}</td> 
        <td>{date('Y-m-d H:i:s',$item['app_time'])}</td>
        <td><a href="{formatUrl('myhome/applicationDetail?aid=')}{$item['enterprise_id']}">查看详情</a></td>  
    </tr>
    {/foreach}
</table>
{if isset($pageUrl)}{$pageUrl}{/if}
{/if}
<script>

</script>