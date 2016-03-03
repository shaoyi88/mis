<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>融易创新园区</title>
<link href="/public/metro/css/metro.css" rel="stylesheet">
<link href="/public/metro/css/metro-icons.css" rel="stylesheet">
<link href="/public/metro/css/metro-responsive.css" rel="stylesheet">
<link href="/public/common/css/common.css?v=04" rel="stylesheet">
<script src="/public/metro/js/jquery-2.1.3.min.js"></script>
<script src="/public/metro/js/metro.js"></script>
<!--[if lt IE 9]>
<script src="/public/dist/lib/ieonly/html5shiv.js"></script>
<![endif]-->
</head>
<body> 
    <header class="margin5 no-margin-left no-margin-right">
            <div class="clear-float header-background wrap-width">
            <div class="container">
                <div class="place-right">
                    <ul class="horizontal-menu compact navbar">
                    <li><a href="#">注册</a></li>
                    <li><a href="{formatUrl('login/')}">登录</a></li>
                    <li><a href="#">用户中心</a></li>
                    <li>
                        <a href="#" class="dropdown-toggle">网站导航</a>
                        <ul class="d-menu" data-role="dropdown">
                        <li><a href="#">办事大厅</a></li>
                        <li><a href="#">企业风采</a></li>
                        <li><a href="#">松山湖</a></li>
                        <li><a href="#">政策咨询</a></li>
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
                <a class="place-left rylogo" href="#" title="">
                    <h1></h1>
                </a>
            </div>
            </div>
    </header>
    <div class="container">
        {$LAYOUT_CONTENT}           
    </div>
    <footer>
            <div class="bottom-menu-wrapper">
                <ul class="horizontal-menu compact footer-text">
                    <li><a href="#">&copy; 融易集团</a></li>
                    <li class="place-right"><a href="#">备案号</a></li>
                    <li class="place-right"><a href="#">合作单位</a></li>
                    <li class="place-right"><a href="#">建议</a></li>
                    <li class="place-right"><a href="#">帮助</a></li>
                    <li class="place-right"><a href="#">联系我们</a></li>
                </ul>
            </div>
     </footer>     
</body>
</html>
