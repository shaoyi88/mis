<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta http-equiv="Pragma" content="no-cache">
    <title>中美融易智慧园区</title>

    <link href="/public/new/css/bootstrap.min.css" rel="stylesheet">
    <link href="/public/new/css/font-awesome.min.css" rel="stylesheet">
    <link href="/public/new/css/animate.min.css" rel="stylesheet">
    <link href="/public/new/css/prettyPhoto.css" rel="stylesheet">
    <link href="/public/new/css/main.css?v=108" rel="stylesheet">
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
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                        <div class="top-number"><p><i class="fa fa-phone-square"></i>  +0769 23078883</p></div>
                    </div>
                    <div class="col-sm-6 col-xs-8">
                       <div class="social">
                            {if $userinfo['userId']}
                            <span style="color:#fff;">欢迎您，{$userinfo['userName']}。&nbsp;</span>
                            {/if}
                            <ul class="social-share">
			                    {if $userinfo['userId']}
			                    <li><a href="{formatUrl('myhome/')}">用户中心</a></li>
			                    <li><a href="{formatUrl('home/logout')}">退出</a></li>
			                    {else}
                                <li><a href="{formatUrl('login/')}">登录</a></li>
                                <li><a href="{formatUrl('home/register')}">注册</a></li>
                                {/if}
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="搜索">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div>
                       </div>
                    </div>
                </div>
            </div>
        </div>

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
                        <li><a href="javascript:;">易创客</a></li>
                        <li><a href="http://www.ry168.cn" target=_blank>融易集团</a></li>
                        <li><a href="javascript:;">联系我们</a></li>                        
                    </ul>
                </div>
            </div>
        </nav>		
    </header>    
    {$LAYOUT_CONTENT}   
    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                   ©{$web['website_copyright']}&nbsp;&nbsp;<a href="http://www.miitbeian.gov.cn/">{$web['website_record_no']}</a>
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">主页</a></li>
                        <li><a href="#">帮助</a></li>
                        <li><a href="{formatUrl('home/advice')}">投诉/建议</a></li>
                        <li><a href="#">联系我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="/public/new/js/jquery.prettyPhoto.js"></script>
    <script src="/public/new/js/jquery.isotope.min.js"></script>
    <script src="/public/new/js/main.js"></script>
    <script src="/public/new/js/wow.min.js"></script>
</body>
</html>