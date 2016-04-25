{if isset($msg)}
<p class="padding20 fg-red">{$msg}</p>
{/if}
{if empty($info)}
<p>未提交任何申请，<a href="{formatUrl('officehall/application')}">点击提交入驻申请</a></p>
{else}
<h3>申请详情</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <tr>
        <th width="15%">企业名称</th>
        <td width="85%">
			    {$info['enterprise_name']}
        </td>
    </tr>
    <tr>
        <th width="15%">注册时间</th>
        <td width="85%">
			    {$info['reg_time']}
        </td>
    </tr>
    <tr>
        <th width="15%">注册资金</th>
        <td width="85%">
			    {$info['registered_funds']}万元
        </td>
    </tr>
    <tr>
        <th width="15%">上年营业收入</th>
        <td width="85%">
			    {$info['last_year_income']}万元
        </td>
    </tr>
    <tr>
        <th width="15%">上年年末职工数</th>
        <td width="85%">
			    {$info['last_year_workers']}人
        </td>
    </tr>
    <tr>
        <th width="15%">是否高新企业</th>
        <td width="85%">
                {if $info['is_high_tech']==1}是{else}否{/if}
        </td>
    </tr>
    <tr>
        <th width="15%">营业执照</th>
        <td width="85%">
                <img src="/./upload/enterprise/licence/{$info['enterprise_business_licence']}" max-width="600">
        </td>
    </tr>
    <tr>
        <th width="15%">联系人</th>
        <td width="85%">
			    {$info['enterprise_contact']}
        </td>
    </tr>
    <tr>
        <th width="15%">联系人手机</th>
        <td width="85%">
			    {$info['enterprise_contact_mobile']}
        </td>
    </tr>
</table>
{/if}