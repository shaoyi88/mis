{if empty($list)}
<p>未提交任何申请，<a href="{formatUrl('officehall/project')}">点击提交项目需求申请</a></p>
{else}
<h3>项目需求申请</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th>需求内容</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>当前状态</th>
        <th>操作</th>
    </tr>
    {foreach $list as $item}
    <tr>
        <td>{$item['apply_content']}</td>
        <td>{$item['contacts']}</td>
        <td>{$item['contacts_phone']}</td>
        <td>{$project_apply_status[$item['status']]}</td>
        <td></td>  
    </tr>
    {/foreach}
</table>
{if isset($pageUrl)}{$pageUrl}{/if}
{/if}
<script>

</script>