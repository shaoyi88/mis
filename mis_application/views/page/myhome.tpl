<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>用户控制台--{$title}</title>
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
<body class="bg-white">
    <div class="app-bar fixed-top darcula header-background" data-role="appbar">
        <span class="app-bar-element branding"><a href="{formatUrl('officehall/')}" class="fg-white">办事大厅</a></span>
        <span class="app-bar-divider" style="background:#87794E;"></span>
        <ul class="app-bar-menu">
        <li><a href="{formatUrl('home/')}">园区首页</a></li>
        </ul>
        
        <div class="app-bar-element place-right">
        <span class="app-bar-element" onclick='location.href="{formatUrl('home/logout')}"'><span class="mif-exit"></span>退出</span>
        </div>        
        <div class="app-bar-element place-right">          
            <span class="dropdown-toggle"><span class="mif-cog"></span>设置</span>
            <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px;border:2px solid #87794E;">
                <h2 class="text-light">快速设置</h2>
                <ul class="unstyled-list fg-dark">
                    <li><a href="{formatUrl('myhome/user_setting')}" class="fg-white1 fg-hover-yellow">账户设置</a></li>
                    <li><a href="{formatUrl('myhome/password')}" class="fg-white2 fg-hover-yellow">密码设置</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row" style="height: 100%">
                <div class="cell size-x200 bg-taupe" id="cell-sidebar" style="height: 100%">
                    <ul class="sidebar bg-taupe">
                        <li {if $unav==1}class="active"{/if}><a href="{formatUrl('myhome')}">
                            <span class="mif-apps icon"></span>
                            <span class="title">我的园区</span>
                        </a></li>
                        {foreach $homemenu[$userinfo['userType']] as $key=>$m}
                        <li {if $unav==$key+2}class="active"{/if}><a href="{formatUrl('myhome/')}{$m[1]}">
                            <span class="mif-{$m[2]} icon"></span>
                            <span class="title">{$m[0]}</span>
                        </a></li>
                        {/foreach}
                    </ul>
                </div>
                <div class="cell auto-size padding10 bg-white" id="cell-content">
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