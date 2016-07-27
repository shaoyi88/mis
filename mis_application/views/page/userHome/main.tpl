<h1 class="text-light">
{$userinfo['userName']}&nbsp;
<span class="text-small">账号类别：{$user_type[$info['user_type']]}
{if $info['user_second_type']}(<span class="fg-red">{$user_second_type[$info['user_second_type']]}</span>){/if}
</span>
{if isset($enterprise)}
&nbsp;<span class="text-small">关联企业：<span class="fg-blue">{$enterprise['enterprise_name']}</span></span>
{/if}
{if $info['user_second_type']}
<span class="mif-drive-eta place-right"><span class="text-small">结伴回家</span>
{/if}
</h1>
<hr class="thin bg-grayLighter">
<button class="button primary" onclick="pushMessage('提示信息|暂无可添加的应用','info')"><span class="mif-plus"></span> 添加应用</button>
<button class="button success" onclick="pushMessage('提示信息|等待监控接口调试','success')"><span class="mif-play"></span> 监控</button>
<button class="button warning" onclick="pushMessage('提示信息|等待门禁接口调试','warning')"><span class="mif-loop2"></span> 门禁</button>
<button class="button alert" onclick="pushMessage('提示信息|等待电力系统接口调试','alert')">关闭公司电源</button>                       
<hr class="thin bg-grayLighter">
<h3>待处理事项</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <thead>
    <tr>
        <td width="40">
        </td>
        <td class="sortable-column sort-asc" style="width: 100px">事项编号</td>
        <td class="sortable-column">事项概述</td>
        <td class="sortable-column">详情</td>
        <td class="sortable-column" style="width: 80px">状态</td>
        <td width="80">已处理</td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="6">暂无</td>
    </tr>
    </tbody>
</table>