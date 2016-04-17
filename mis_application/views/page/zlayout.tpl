<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>孵化器</title>
<link href="/public/dist/css/zui.min.css" rel="stylesheet">
<link href="/public/dist/css/zui-theme.css" rel="stylesheet">
<link href="/public/common/css/common.css?v=06" rel="stylesheet">
<script src="/public/metro/js/jquery-2.1.3.min.js"></script>
<script src="/public/dist/js/zui.min.js"></script>
<!--[if lt IE 9]>
<script src="/public/dist/lib/ieonly/html5shiv.js"></script>
<![endif]-->
</head>
<body>
    <header class="margin5-z no-margin-left-z no-margin-right-z">
            <div class="clear-float-z header-background wrap-width">
            <div class="container-z">
                <div class="place-right-z">
                    <ul class="horizontal-menu-z compact-z navbar-z">
                    {if $userinfo['userId']}
                    <li><a href="javascript:">欢迎您，{$userinfo['userName']}</a></li>
                    {else}
                    <li><a href="javascript:">注册</a></li>
                    <li><a href="{formatUrl('login/')}">登录</a></li>
                    {/if}
                    <li><a href="{formatUrl('myhome/')}">用户中心</a></li>
                    <li>
                        <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown">网站导航</a>
                        <ul class="dropdown-menu d-menu">
                        <li><a href="#">办事大厅</a></li>
                        <li><a href="#">企业风采</a></li>
                        <li><a href="#">松山湖</a></li>
                        <li><a href="#">政策资讯</a></li>
                        </ul>
                    </li>                
                   </ul>                   
                    <form>
                        <div class="input-control-z margin20-z" style="width: 300px">
                            <input type="text" name="q" placeholder="搜索...">
                            <button class="button-z"><i class="icon icon-search"></i></button>
                        </div>
                    </form>
                </div>
                <a class="place-left-z rylogo" style="background:url(/public/common/images/rylogo.png) no-repeat;" href="{formatUrl('home/')}" title="">
                    <h1></h1>
                </a>
            </div>
            </div>
    </header>
    <div class="container">
        {$LAYOUT_CONTENT}           
    </div>
    <footer>
            <div class="bg-grayLight-z">
                <ul class="horizontal-menu-z compact-z footer-text-z">
                    <li><a href="http://www.ry168.cn/">©{$web['website_copyright']}</a></li>
                    <li class="place-right-z"><a href="http://www.miitbeian.gov.cn/">{$web['website_record_no']}</a></li>
                    <li class="place-right-z"><a href="#">合作单位</a></li>
                    <li class="place-right-z"><a href="#">建议</a></li>
                    <li class="place-right-z"><a href="#">帮助</a></li>
                    <li class="place-right-z"><a href="#">联系我们</a></li>
                </ul>
            </div>
     </footer>     
</body>
</html>
