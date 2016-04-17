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
</head>
<body class="bg-steel">
    <div class="app-bar fixed-top darcula header-background" data-role="appbar">
        <span class="app-bar-element branding">用户控制台</span>
        <span class="app-bar-divider" style="background:#87794E;"></span>
        <ul class="app-bar-menu">
        <li><a href="{formatUrl('home/')}">园区首页</a></li>
        </ul>

        <div class="app-bar-element place-right">
            <span class="dropdown-toggle"><span class="mif-cog"></span>设置</span>
            <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px;border:2px solid #87794E;">
                <h2 class="text-light">快速设置</h2>
                <ul class="unstyled-list fg-dark">
                    <li><a href="{formatUrl('myhome/user_setting')}" class="fg-white1 fg-hover-yellow">账户设置</a></li>
                    <li><a href="{formatUrl('myhome/password')}" class="fg-white2 fg-hover-yellow">密码设置</a></li>
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
                        <li {if $unav==1}class="active"{/if}><a href="#">
                            <span class="mif-apps icon"></span>
                            <span class="title">我的园区</span>
                        </a></li>
                        <li {if $unav==2}class="active"{/if}><a href="#">
                            <span class="mif-enter icon"></span>
                            <span class="title">入驻申请</span>
                        </a></li>
                        <li {if $unav==3}class="active"{/if}><a href="#">
                            <span class="mif-wrench icon"></span>
                            <span class="title">我的物业</span>
                        </a></li>
                        <li {if $unav==4}class="active"{/if}><a href="#">
                            <span class="mif-palette icon"></span>
                            <span class="title">公共资源</span>
                        </a></li>
                        <li {if $unav==5}class="active"{/if}><a href="#">
                            <span class="mif-coins icon"></span>
                            <span class="title">投资申请</span>
                        </a></li>
                        <li {if $unav==6}class="active"{/if}><a href="#">
                            <span class="mif-filter icon"></span>
                            <span class="title">项目需求</span>
                        </a></li>
                    </ul>
                </div>
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                    {$LAYOUT_CONTENT} 
                </div>
            </div>
        </div>
    </div>
<script>
    function pushMessage(mes,t){
        $.Notify({
            content: mes.split("|")[0],
            caption: mes.split("|")[1],
            type: t
        });
    }
    $(function(){
        {if isset($msg)}
        pushMessage("{$msg}","{$msgType}");
        {/if}
    })
</script>
</body>
</html>