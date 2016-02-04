<?php /* Smarty version Smarty-3.1.11, created on 2016-02-04 06:39:59
         compiled from "E:\mis\mis_application\views\mis\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3242356b2f23f706560-35099267%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0e02b16387503f3857cc68b0916c9396c33637b0' => 
    array (
      0 => 'E:\\mis\\mis_application\\views\\mis\\index.tpl',
      1 => 1454566998,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3242356b2f23f706560-35099267',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'userName' => 1,
    'menus' => 1,
    'item' => 1,
    'sItem' => 1,
    'admin_id' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.11',
  'unifunc' => 'content_56b2f23f78afb6_16348356',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56b2f23f78afb6_16348356')) {function content_56b2f23f78afb6_16348356($_smarty_tpl) {?><header class="Hui-header cl"><a class="Hui-logo l" title="管理系统" href="javascript:;">管理系统</a><ul class="Hui-userbar"><li><?php echo $_smarty_tpl->tpl_vars['userName']->value;?>
</li><li><a class="changePassword" href="javascript:;" title="修改密码">修改密码</a></li><li><a href="<?php echo formatUrl('home/logout');?>
" title="退出">退出</a></li></ul><a aria-hidden="false" class="Hui-nav-toggle" href="#"></a></header><aside class="Hui-aside"><input runat="server" id="divScrollValue" type="hidden" value="" /><?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['menus']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?><?php if (checkRight($_smarty_tpl->tpl_vars['item']->value['right'])){?><div class="menu_dropdown bk_2"><dl><dt><?php echo $_smarty_tpl->tpl_vars['item']->value['module'];?>
<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt><dd><ul><?php  $_smarty_tpl->tpl_vars['sItem'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['sItem']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['item']->value['menu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['sItem']->key => $_smarty_tpl->tpl_vars['sItem']->value){
$_smarty_tpl->tpl_vars['sItem']->_loop = true;
?><?php if (checkRight($_smarty_tpl->tpl_vars['sItem']->value[2])){?><li><a _href="<?php echo $_smarty_tpl->tpl_vars['sItem']->value[1];?>
" data-title="<?php echo $_smarty_tpl->tpl_vars['item']->value['module'];?>
" href="javascript:void(0)"><?php echo $_smarty_tpl->tpl_vars['sItem']->value[0];?>
</a></li><?php }?><?php } ?></ul></dd></dl></div><?php }?><?php } ?></aside><div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div><section class="Hui-article-box"><div id="Hui-tabNav" class="Hui-tabNav"><div class="Hui-tabNav-wp"><ul id="min_title_list" class="acrossTab cl"><li class="active"><span title="我的桌面" data-href="<?php echo formatUrl('home/welcome');?>
">我的桌面</span><em></em></li></ul></div><div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div></div><div id="iframe_box" class="Hui-article"><div class="show_iframe"><div style="display:none" class="loading"></div><iframe scrolling="yes" frameborder="0" src="<?php echo formatUrl('home/welcome');?>
"></iframe></div></div></section><div class="pd-20 text-c" style="display:none" id="changePasswordWindow"><form class="Huiform" action="<?php echo formatUrl('admin/changePassword');?>
" method="post"><input type="hidden" name="admin_id" value="<?php echo $_smarty_tpl->tpl_vars['admin_id']->value;?>
" /><table class="table table-bg table-border table-bordered"><tr><td>新密码：</td><td><input type="password" class="input-text" autocomplete="off" placeholder="密码" name="admin_password" id="admin_password" datatype="*6-18" nullmsg="请输入密码！"></td></tr><tr><td>确认密码：</td><td><input type="password" class="input-text" autocomplete="off" placeholder="密码" id="admin_password2" recheck="admin_password" datatype="*6-18" nullmsg="请再输入一次密码！" errormsg="您两次输入的密码不一致！"></td></tr><tr><td colspan="2"><button style="margin-top:10px" type="submit" class="btn btn-success" id="" name=""><i class="icon-plus"></i>提交</button></td></tr></table></form></div><script type="text/javascript" src="/public/mis/js/index.js"></script><?php }} ?>