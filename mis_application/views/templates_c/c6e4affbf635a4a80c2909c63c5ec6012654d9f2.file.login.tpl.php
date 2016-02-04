<?php /* Smarty version Smarty-3.1.11, created on 2016-02-04 06:34:24
         compiled from "E:\mis\mis_application\views\mis\login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:595656b2f0f0d3aa31-62369672%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c6e4affbf635a4a80c2909c63c5ec6012654d9f2' => 
    array (
      0 => 'E:\\mis\\mis_application\\views\\mis\\login.tpl',
      1 => 1454567018,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '595656b2f0f0d3aa31-62369672',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'msg' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.11',
  'unifunc' => 'content_56b2f0f0d77521_66646105',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56b2f0f0d77521_66646105')) {function content_56b2f0f0d77521_66646105($_smarty_tpl) {?><!DOCTYPE HTML><html><head><meta charset="utf-8"><meta name="renderer" content="webkit|ie-comp|ie-stand"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /><meta http-equiv="Cache-Control" content="no-siteapp" /><!--[if lt IE 9]><script type="text/javascript" src="/public/common/js/html5.js"></script><script type="text/javascript" src="/public/common/js/respond.min.js"></script><script type="text/javascript" src="/public/common/js/PIE_IE678.js"></script><![endif]--><link href="/public/common/css/lib.css" rel="stylesheet" type="text/css" /><link href="/public/mis/css/login.css" rel="stylesheet" type="text/css" /><link href="/public/common/css/lib-iconfont/iconfont.css" rel="stylesheet" type="text/css" /><title>系统登录</title></head><body><?php if (isset($_smarty_tpl->tpl_vars['msg']->value)){?><div class="header"><div class="Huialert Huialert-danger"><i class="icon-remove"></i><?php echo $_smarty_tpl->tpl_vars['msg']->value;?>
</div></div><?php }?><div class="loginWraper"><div class="loginBox"><form id="loginForm" class="form form-horizontal" action="<?php echo formatUrl('login/actionLogin');?>
" method="post"><div class="row cl"><label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label><div class="formControls col-8"><input id="userAccount" name="userAccount" type="text" placeholder="账户" class="input-text size-L" nullmsg="请输入账户！" datatype="s"></div></div><div class="row cl"><label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label><div class="formControls col-8"><input id="userPassword" name="userPassword" type="password" placeholder="密码" class="input-text size-L" nullmsg="请输入密码！" datatype="s"></div></div><div class="row"><div class="formControls col-8 col-offset-3"><input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"></div></div></form></div></div><div class="footer">Copyright © 管理系统</div><script type="text/javascript" src="/public/common/js/jquery.min.js"></script><script type="text/javascript" src="/public/common/js/lib.js"></script><script type="text/javascript" src="/public/common/js/Validform_v5.3.2.js"></script><script type="text/javascript" src="/public/mis/js/login.js"></script></body></html><?php }} ?>