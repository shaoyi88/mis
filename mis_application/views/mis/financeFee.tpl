<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 财务管理<span class="c-gray en">&gt;</span> 收款情况 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <form class="Huiform" action="{formatUrl('finance/fee')}" method="get">
        <div class="text-c">
            <select class="select mr-5" id="pay_status" name="pay_status" style="width:200px;height:30px">
                <option value="">请选择支付状态</option>
                <option value="0" {if isset($keyword['pay_status']) && $keyword['pay_status'] != '' && $keyword['pay_status'] == 0}selected{/if}>
                未支付
                </option>
                <option value="1" {if isset($keyword['pay_status']) && $keyword['pay_status'] != '' && $keyword['pay_status'] == 1}selected{/if}>
                已支付
                </option>
            </select>
            <input class="input-text mr-5" style="width:250px;height:30px" type="text" id="fee_date" value="{if isset($keyword['fee_date']) && $keyword['fee_date']}{date('Y-m', $keyword['fee_date'])}{/if}" placeholder="输入费用月份">
            <input id="fee_date_str" name="fee_date" type="hidden" value="{if isset($keyword['fee_date'])}{$keyword['fee_date']}{/if}">
            <input name="enterprise_name" class="input-text mr-5" style="width:250px;height:30px" value="{if isset($keyword['enterprise_name'])}{$keyword['enterprise_name']}{/if}" placeholder="输入企业名">
            <button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜费用信息</button>
        </div>
    </form>
    <div class="mt-20"></div>
    {if empty($dataList)}
    <div class="cl pd-5 bg-1 bk-gray"><h2 class="text-c">暂无信息</h2></div>
    {else}
    <table class="table table-border table-bg table-bordered table-hover">
        <thead>
        <tr class="text-c">
            <th>企业名称</th>
            <th>费用月份</th>
            <th>租金</th>
            <th>物业费</th>
            <th>水费</th>
            <th>电费</th>
            <th>本月应收</th>
            <th>往月欠款</th>
            <th>应收合计</th>
            <th>支付状态</th>
        </tr>
        </thead>
        <tbody>
        {foreach $dataList as $item}
        <tr class="text-c">
            <td>{$item['enterprise_name']}</td>
            <td>{date('Y-m',$item['fee_date'])}</td>
            <td>{$item['rent_fee']}元</td>
            <td>{$item['property_fee']}元</td>
            <td>{$item['water_fee_unit_price']*$item['water_fee_num']}元</td>
            <td>{$item['elec_fee_unit_price']*$item['elec_fee_num']}元</td>
            <td>{$item['curPay']}元</td>
            <td>{$item['otherPay']}元</td>
            <td>{$item['totalPay']}元</td>
            <td>{if $item['pay_status'] == 0}未支付{else}已支付{/if}</td>
        </tr>
        {/foreach}
        </tbody>
    </table>
    {/if}
    {if isset($pageUrl)}{$pageUrl}{/if}
</div>
<script type="text/javascript" src="/public/common/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="/public/mis/js/fee.js""></script>