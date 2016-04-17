<h1 class="text-light">{$userinfo['userName']}&nbsp;<span class="text-small">账号类别：企业员工</span>&nbsp;<span class="text-small">关联企业：<a href="#">毛里旅游在线</a></span><span class="mif-drive-eta place-right"><span class="text-small">结伴回家</span></h1>
<hr class="thin bg-grayLighter">
<button class="button primary" onclick="pushMessage('添加|应用信息','info')"><span class="mif-plus"></span> 添加应用</button>
<button class="button success" onclick="pushMessage('成功|成功信息','success')"><span class="mif-play"></span> 监控</button>
<button class="button warning" onclick="pushMessage('警告|警告信息','warning')"><span class="mif-loop2"></span> 门禁</button>
<button class="button alert" onclick="pushMessage('报警|报警信息','alert')">关闭公司电源</button>                       
<hr class="thin bg-grayLighter">
<h3>待处理事项</h3>
<table class="dataTable border bordered" data-auto-width="false">
    <thead>
    <tr>
        <td style="width: 20px">
        </td>
        <td class="sortable-column sort-asc" style="width: 100px">事项编号</td>
        <td class="sortable-column">事项概述</td>
        <td class="sortable-column">详情</td>
        <td class="sortable-column" style="width: 20px">状态</td>
        <td style="width: 20px">已处理</td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <label class="input-control checkbox small-check no-margin">
                <input type="checkbox">
                <span class="check"></span>
            </label>
        </td>
        <td>123890723212</td>
        <td>公司停车场位置被占用</td>
        <td><a href="#">点击查看详情</a></td>
        <td class="align-center"><span class="mif-checkmark fg-green"></span></td>
        <td>
            <label class="switch-original">
                <input type="checkbox" checked>
                <span class="check"></span>
            </label>
        </td>
    </tr>
    <tr>
        <td>
            <label class="input-control checkbox small-check no-margin">
                <input type="checkbox">
                <span class="check"></span>
            </label>
        </td>
        <td>123890723212</td>
        <td>物业水电费缴纳</td>
        <td><a href="#">点击查看详情</a></td>
        <td class="align-center"><span class="mif-stop fg-red"></span></td>
        <td>
            <label class="switch-original">
                <input type="checkbox">
                <span class="check"></span>
            </label>
        </td>
    </tr>
    </tbody>
</table>