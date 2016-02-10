<?php

$config['menus'] = array(
	array(
		'module' => '系统管理',
		'menu' => array(
			array('分组权限管理', formatUrl('role/index'), 'role_list'),
			array('系统用户管理', formatUrl('admin/index'), 'admin_list'),
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

$config['rights'] = array(
	array(
		'module' => '系统管理',
		'roles' => array(
			array('分组权限列表', 'role_list'),
			array('分组权限增加', 'role_add'),
			array('分组权限编辑', 'role_edit'),
			array('分组权限删除', 'role_del', TRUE),
			array('系统用户列表', 'admin_list'),
			array('系统用户增加', 'admin_add'),
			array('系统用户编辑', 'admin_edit'),
			array('系统用户删除', 'admin_del'),
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