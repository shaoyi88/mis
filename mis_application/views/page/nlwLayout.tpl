<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <title>{$headTitle}</title>

    <link href="/public/new/css/bootstrap.min.css" rel="stylesheet">
    <link href="/public/new/css/font-awesome.min.css" rel="stylesheet">
    <link href="/public/new/css/animate.min.css" rel="stylesheet">
    <link href="/public/new/css/prettyPhoto.css" rel="stylesheet">
    <link href="/public/new/css/main.css?v=129" rel="stylesheet">
    <link href="/public/new/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/public/new/js/html5shiv.js"></script>
    <script src="/public/new/js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="/public/new/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/public/new/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/public/new/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/public/new/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/public/new/images/ico/apple-touch-icon-57-precomposed.png">
    <script src="/public/new/js/jquery.js"></script>
    <script src="/public/new/js/bootstrap.min.js"></script>
</head>
<body class="homepage">

    <header id="header">

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="{formatUrl('home/')}"><img src="/public/new/images/logo.png" alt="logo"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li {if $nav==1}class="active"{/if}><a href="{formatUrl('home/')}">首页</a></li>
                        <li {if $nav==2}class="active"{/if}><a href="{formatUrl('home/zs')}">园区简介</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">园区服务</a>
                            <ul class="dropdown-menu">
                                <li><a href="{formatUrl('officehall/application')}">入驻申请</a></li>
                                <li><a href="{formatUrl('officehall/property')}">物业服务</a></li>
                                <li><a href="{formatUrl('officehall/resource')}">公共资源</a></li>
                                <li><a href="{formatUrl('officehall/invest')}">投资申请</a></li>
                                <li><a href="{formatUrl('officehall/project')}">企业需求</a></li>
                            </ul>
                        </li>                       
                        <li {if $nav==4}class="active"{/if}><a href="{formatUrl('home/maker')}">易创客</a></li>
                        <li><a href="http://www.ry168.cn" target=_blank>融易集团</a></li>
                        <li {if $nav==6}class="active"{/if}><a href="{formatUrl('home/contact')}">联系我们</a></li>                        
                    </ul>
                </div>
            </div>
        </nav>		
    </header>    
    {$LAYOUT_CONTENT}   
    
    <script src="/public/new/js/jquery.prettyPhoto.js"></script>
    <script src="/public/new/js/jquery.isotope.min.js"></script>
    <script src="/public/new/js/main.js"></script>
    <script src="/public/new/js/wow.min.js"></script>
</body>
</html>