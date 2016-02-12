<?php
/*
 * 菜单
 */
$config['menus'] = array(
	array(
		'module' => '系统管理',
		'menu' => array(
			array('系统分组管理', formatUrl('role/index'), 'role_list'),
			array('系统用户管理', formatUrl('admin/index'), 'admin_list'),
			array('园区用户管理', formatUrl('user/index'), 'user_list'),
			array('投诉建议管理', formatUrl('feedback/index'), 'feedback_list'),
		),
		'right' => 'sys'
	),
	array(
		'module' => '信息管理',
		'menu' => array(
			array('资讯类别管理', formatUrl('article/type'), 'article_type'),
			array('资讯管理', formatUrl('article/index'), 'article_list'),
		),
		'right' => 'information'
	)
);

/*
 * 权限
 */
$config['rights'] = array(
	array(
		'module' => '系统管理',
		'roles' => array(
			array('系统分组列表', 'role_list'),
			array('系统分组增加', 'role_add'),
			array('系统分组编辑', 'role_edit'),
			array('系统分组删除', 'role_del', TRUE),
			array('系统用户列表', 'admin_list'),
			array('系统用户增加', 'admin_add'),
			array('系统用户编辑', 'admin_edit'),
			array('系统用户删除', 'admin_del', TRUE),
			array('园区用户列表', 'user_list'),
			array('园区用户增加', 'user_add'),
			array('园区用户编辑', 'user_edit'),
			array('园区用户删除', 'user_del', TRUE),
			array('投诉建议列表', 'feedback_list'),
			array('投诉建议回复', 'feedback_reply')
		),
		'right' => 'sys'
	),
	array(
		'module' => '信息管理',
		'roles' => array(
			array('资讯类别列表', 'article_type_list'),
			array('资讯类别增加', 'article_type_add'),
			array('资讯类别编辑', 'article_type_edit'),
			array('资讯类别删除', 'article_type_del', TRUE),
			array('资讯列表', 'article_list'),
			array('资讯增加', 'article_add'),
			array('资讯编辑', 'article_edit'),
			array('资讯删除', 'article_del'),
		),
		'right' => 'information'
	)
);

/*
 * 投诉建议类型
 */
$config['feedback_type'] = array(
	'0' => '投诉',
	'1' => '建议'
);

/*
 * 投诉建议状态
 */
$config['feedback_status'] = array(
	'0' => '未回复',
	'1' => '已回复'
);

/**
 * 用户类型
 */
$config['user_type'] = array(
	'0' => '个人用户',
	'1' => '企业用户'
);

/**
 * 用户审核状态
 */
$config['user_audit_type'] = array(
	'0' => '未审核',
	'1' => '待审核',
	'2' => '审核通过',
	'3' => '审核拒绝'
);