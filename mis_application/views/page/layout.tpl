<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>融易创新园区</title>
<link href="/public/metro/css/metro.css?v=01" rel="stylesheet">
<link href="/public/metro/css/metro-icons.css" rel="stylesheet">
<link href="/public/metro/css/metro-responsive.css" rel="stylesheet">
<link href="/public/common/css/common.css" rel="stylesheet">
<script src="/public/metro/js/jquery-2.1.3.min.js"></script>
<script src="/public/metro/js/metro.js"></script>
<!--[if lt IE 9]>
<script src="/public/dist/lib/ieonly/html5shiv.js"></script>
<![endif]-->
<script src="/public/common/js/common.js"></script>
</head>
<body>
    <header class="margin5 no-margin-left no-margin-right">
            <div class="clear-float header-background wrap-width">
            <div class="container">
                <div class="place-right">
                    <ul class="horizontal-menu compact navbar">
                    {if $userinfo['userId']}
                    <li><a href="javascript:">欢迎您，{$userinfo['userName']}</a></li>
                    <li><a href="{formatUrl('home/logout')}">退出</a></li>
                    {else}
                    <li><a href="{formatUrl('home/register')}">注册</a></li>
                    <li><a href="{formatUrl('login/')}">登录</a></li>
                    {/if}
                    <li><a href="{formatUrl('myhome/')}">用户中心</a></li>
                    <li>
                        <a href="javascript:" class="dropdown-toggle">网站导航</a>
                        <ul class="d-menu" data-role="dropdown">
                        <li><a href="{formatUrl('officehall/')}">办事大厅</a></li>
                        <li><a href="{formatUrl('enterprise/')}">企业风采</a></li>
                        <li><a href="http://www.ssl.gov.cn/" target=_blank>松山湖</a></li>
                        <li><a href="http://www.ssl.gov.cn/dgssl/s41082/list.htm" target=_blank>政策资讯</a></li>
                        </ul>
                    </li>                
                   </ul>                   
                    <form>
                        <div class="input-control text margin20" style="width: 300px">
                            <input type="text" name="q" placeholder="搜索...">
                            <button class="button"><span class="mif-search"></span></button>
                        </div>
                    </form>
                </div>
                <a class="place-left rylogo" style="background:url(/public/common/images/rylogo.png) no-repeat;" href="{formatUrl('home/')}" title="">
                    <h1></h1>
                </a>
            </div>
            </div>
    </header>
    <div class="container">
        {if !isset($hideNav)}
        <ul class="m-menu" >
            <li><a href="/">首页</a></li>
            <li><a href="{formatUrl('incubator/')}">孵化器</a></li>
            <li><a href="{formatUrl('maker/')}">易创客</a></li>
            <li><a href="{formatUrl('club/')}">投资人俱乐部</a></li>
        </ul>
        {/if}
        {$LAYOUT_CONTENT}           
    </div>
    <footer>
            <div class="bottom-menu-wrapper bg-grayLight">
                <ul class="horizontal-menu compact footer-text">
                    <li><a href="http://www.ry168.cn/">©{$web['website_copyright']}</a></li>
                    <li class="place-right"><a href="http://www.miitbeian.gov.cn/">{$web['website_record_no']}</a></li>
                    <li class="place-right"><a href="#">合作单位</a></li>
                    <li class="place-right"><a href="{formatUrl('home/advice')}">投诉/建议</a></li>
                    <li class="place-right"><a href="#">帮助</a></li>
                    <li class="place-right"><a href="#">联系我们</a></li>
                </ul>
            </div>
     </footer>     
</body>
</html>
