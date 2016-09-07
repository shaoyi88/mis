<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 财务管理<span class="c-gray en">&gt;</span> 企业信息 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    {if empty($dataList)}
    <div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无信息</h2></div>
    {else}
    <table class="table table-border table-bg table-bordered table-hover">
        <thead>
        <tr class="text-c">
            <th>企业名称</th>
            <th>入驻楼层</th>
            <th>总面积</th>
            <th>租金</th>
            <th>物业费</th>
        </tr>
        </thead>
        <tbody>
        {foreach $dataList as $item}
        <tr class="text-c">
            <td>{$item['enterprise_name']}</td>
            <td>{if isset($item['building'])}
                    {foreach $item['building'] as $v}
                        <p>{$v}</p>
                    {/foreach}
                {else}暂无楼层信息{/if}</td>
            <td>{if isset($item['area'])}{$item['area']}平方{else}暂无信息{/if}</td>
            <td>{if isset($item['rent_fee'])}{$item['rent_fee']}元{else}暂无信息{/if}</td>
            <td>{if isset($item['property_fee'])}{$item['property_fee']}元{else}暂无信息{/if}</td>
        </tr>
        {/foreach}
        </tbody>
    </table>
    {/if}
    {if isset($pageUrl)}{$pageUrl}{/if}
</div>