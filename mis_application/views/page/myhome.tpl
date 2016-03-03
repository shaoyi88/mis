<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>用户控制台</title>
<link href="/public/metro/css/metro.css" rel="stylesheet">
<link href="/public/metro/css/metro-icons.css" rel="stylesheet">
<link href="/public/metro/css/metro-responsive.css" rel="stylesheet">
<link href="/public/common/css/common.css?v=04" rel="stylesheet">
<script src="/public/metro/js/jquery-2.1.3.min.js"></script>
<script src="/public/metro/js/metro.js"></script>
<!--[if lt IE 9]>
<script src="/public/dist/lib/ieonly/html5shiv.js"></script>
<![endif]-->
<style>
    html, body {
        height: 100%;
    }
    body {
    }
    .page-content {
        padding-top: 3.125rem;
        min-height: 100%;
        height: 100%;
    }
    .table .input-control.checkbox {
        line-height: 1;
        min-height: 0;
        height: auto;
    }
    @media screen and (max-width: 800px){
        #cell-sidebar {
            flex-basis: 52px;
        }
        #cell-content {
            flex-basis: calc(100% - 52px);
        }
    }
    .app-bar-element:hover{  
        background:#fff;
    }
</style>
<script>
    function pushMessage(t){
        var mes = '注意|这是操作提示';
        $.Notify({
            caption: mes.split("|")[0],
            content: mes.split("|")[1],
            type: t
        });
    }
    $(function(){
        $('.sidebar').on('click', 'li', function(){
            if (!$(this).hasClass('active')) {
                $('.sidebar li').removeClass('active');
                $(this).addClass('active');
            }
        })
    })
</script>
</head>
<body class="bg-steel">
    <div class="app-bar fixed-top darcula header-background" data-role="appbar">
        <span class="app-bar-element branding">用户控制台</span>
        <span class="app-bar-divider" style="background:#87794E;"></span>
        <ul class="app-bar-menu">
        <li><a href="{formatUrl('home/')}">园区首页</a></li>
        </ul>

        <div class="app-bar-element place-right">
            <span class="dropdown-toggle"><span class="mif-cog"></span>用户名</span>
            <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px;border:2px solid #87794E;">
                <h2 class="text-light">快速设置</h2>
                <ul class="unstyled-list fg-dark">
                    <li><a href="" class="fg-white1 fg-hover-yellow">账户设置</a></li>
                    <li><a href="" class="fg-white2 fg-hover-yellow">密码设置</a></li>
                    <li><a href="{formatUrl('home/logout')}" class="fg-white3 fg-hover-yellow">退出</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row" style="height: 100%">
                <div class="cell size-x200 bg-taupe" id="cell-sidebar" style="height: 100%">
                    <ul class="sidebar bg-taupe">
                        <li class="active"><a href="#">
                            <span class="mif-apps icon"></span>
                            <span class="title">我的园区</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-enter icon"></span>
                            <span class="title">入驻申请</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-wrench icon"></span>
                            <span class="title">我的物业</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-palette icon"></span>
                            <span class="title">公共资源</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-coins icon"></span>
                            <span class="title">投资申请</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-filter icon"></span>
                            <span class="title">项目需求</span>
                        </a></li>
                    </ul>
                </div>
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                    <h1 class="text-light">{$userinfo['userName']}&nbsp;<span class="text-small">账号类别：企业员工</span>&nbsp;<span class="text-small">关联企业：<a href="#">毛里旅游在线</a></span><span class="mif-drive-eta place-right"><span class="text-small">结伴回家</span></h1>
                    <hr class="thin bg-grayLighter">
                    <button class="button primary" onclick="pushMessage('info')"><span class="mif-plus"></span> 添加应用</button>
                    <button class="button success" onclick="pushMessage('success')"><span class="mif-play"></span> 监控</button>
                    <button class="button warning" onclick="pushMessage('warning')"><span class="mif-loop2"></span> 门禁</button>
                    <button class="button alert" onclick="pushMessage('alert')">关闭公司电源</button>                       
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
                </div>
            </div>
        </div>
    </div>
</body>
</html>