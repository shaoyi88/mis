{if empty($list)}
<p>未提交任何申请，<a href="{formatUrl('officehall/invest')}">点击提交项目投资申请</a></p>
{else}
<h3>投资申请</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th>企业名称</th>
        <th>申请投资金额</th>
        <th>资金用途概述</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>提交时间</th>
        <th>当前状态</th>
        <th>操作</th>
    </tr>
    {foreach $list as $item}
    <tr>
        <td>{$item['enterprise_name']}</td>
        <td>{$item['invest_sum']}万元</td>
        <td>{$item['usage']}</td> 
        <td>{$item['contacts']}</td> 
        <td>{$item['contacts_phone']}</td> 
        <td>{date('Y-m-d H:i:s',$item['add_time'])}</td>
        <td>{$invest_apply_status[$item['status']]}</td>
        <td></td>  
    </tr>
    {/foreach}
</table>
{if isset($pageUrl)}{$pageUrl}{/if}
{/if}
<script>

</script>