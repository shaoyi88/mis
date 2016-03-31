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
    <div class="wrap-width header-background zheader">
        <div class="zwrap">
	        <div class="zplace-right">
	            <ul class="znav">
	                {if $userinfo['userId']}
                    <li><a href="javascript:">欢迎您，{$userinfo['userName']}</a></li>
                    {else}
                    <li><a href="javascript:">注册</a></li>
                    <li><a href="{formatUrl('login/')}">登录</a></li>
                    {/if}
                    <li><a href="{formatUrl('myhome/')}">用户中心</a></li>
                    <li>
					    <a class="dropdown-toggle" data-toggle="dropdown" href="your/nice/url">网站导航 <span class="caret"></span></a>
					    <ul class="dropdown-menu">
					      <li><a href="#">办事大厅</a></li>
					      <li><a href="#">企业风采</a></li>
					      <li><a href="#">松山湖</a></li>
					      <li><a href="#">政策资讯</a></li>
					    </ul>
                    </li>   
	            </ul>
				<form class="navbar-form navbar-left" role="search">
			      <div class="form-group">
			        <input type="text" class="form-control" placeholder="搜索">
			      </div>
			      <button type="submit" class="btn btn-default"><i class="icon icon-search"></i></button>
			    </form>
	        </div>
	        <a class="zplace-left rylogo" style="background:url(/public/common/images/rylogo.png) no-repeat;" href="{formatUrl('home/')}" title="">&nbsp;</a>
        </div>
    </div>
    <div class="container">
        {$LAYOUT_CONTENT}           
    </div>
    <footer>
            <div class="bottom-menu-wrapper bg-grayLight">
                <ul class="horizontal-menu compact footer-text">
                    <li><a href="http://www.ry168.cn/">©{$web['website_copyright']}</a></li>
                    <li class="place-right"><a href="http://www.miitbeian.gov.cn/">{$web['website_record_no']}</a></li>
                    <li class="place-right"><a href="#">合作单位</a></li>
                    <li class="place-right"><a href="#">建议</a></li>
                    <li class="place-right"><a href="#">帮助</a></li>
                    <li class="place-right"><a href="#">联系我们</a></li>
                </ul>
            </div>
     </footer>     
</body>
</html>
