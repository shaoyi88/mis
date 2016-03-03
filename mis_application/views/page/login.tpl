<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="description" content="Metro, a sleek, intuitive, and powerful framework for faster and easier web development for Windows Metro Style.">
<meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development">
<meta name="author" content="Sergey Pimenov and Metro UI CSS contributors">
<link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />
<title>用户登录</title>
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
        .login-form {
            width: 25rem;
            height: 18.75rem;
            position: fixed;
            top: 50%;
            margin-top: -9.375rem;
            left: 50%;
            margin-left: -12.5rem;
            background-color: #ffffff;
            opacity: 0;
            -webkit-transform: scale(.8);
            transform: scale(.8);
        }
    </style>
    <script>
        $(function(){
            var form = $(".login-form");
            form.css({
                opacity: 1,
                "-webkit-transform": "scale(1)",
                "transform": "scale(1)",
                "-webkit-transition": ".5s",
                "transition": ".5s"
            });
        });
    </script>
</head>
<body class="ribbed-taupe">
    <div class="login-form padding20 block-shadow">
        <form action="{formatUrl('login/actionLogin')}" method="post" data-role="validator">
            <h1 class="text-light">用户登录</h1>
            <hr class="thin"/>
            <br />
            <div class="input-control text full-size" data-role="input">
                <label for="user_login">账户:</label>
                <input type="text" name="user_login" id="user_login" data-validate-func="required" data-validate-hint="请输入账户！">
                <button class="button helper-button clear"><span class="mif-cross"></span></button>
            </div>
            <br />
            <br />
            <div class="input-control password full-size" data-role="input">
                <label for="user_password">密码:</label>
                <input type="password" name="user_password" id="user_password" data-validate-func="required" data-validate-hint="请输入密码！">
                <button class="button helper-button reveal"><span class="mif-looks"></span></button>
            </div>
            <br />
            <br />
            <div class="form-actions">
                <button type="submit" class="button primary">登录</button>
                <button type="button" class="button link">取消</button>
            </div>
            <div class="padding10 fg-darkRed">{$msg}</div>
        </form>
    </div>
</body>
</html>