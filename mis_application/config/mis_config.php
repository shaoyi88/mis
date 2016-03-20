<?php
/*
 * 菜单
 */
$config['menus'] = array(
	array(
		'module' => '工作台',
		'menu' => array(
			array('活动审批', formatUrl('home/coding'), ''),
			array('企业审批', formatUrl('home/coding'), ''),
			array('物业服务', formatUrl('home/coding'), ''),
			array('企业服务', formatUrl('home/coding'), ''),
		),
		'right' => 'workbench'
	),
	array(
		'module' => '招商管理',
		'menu' => array(
			array('潜在客户管理', formatUrl('home/coding'), ''),
			array('入驻企业管理', formatUrl('home/coding'), ''),
		),
		'right' => 'investment'
	),
	array(
		'module' => '用户管理',
		'menu' => array(
			array('系统分组管理', formatUrl('role/index'), 'role_list'),
			array('系统用户管理', formatUrl('admin/index'), 'admin_list'),
			array('园区用户管理', formatUrl('user/index'), 'user_list'),
		),
		'right' => 'user'
	),
	array(
		'module' => '楼宇管理',
		'menu' => array(
			array('楼宇类型管理', formatUrl('home/coding'), ''),
			array('楼宇信息管理', formatUrl('home/coding'), ''),
		),
		'right' => 'building'
	),
	array(
		'module' => '企业服务',
		'menu' => array(
			array('公共资源管理', formatUrl('home/coding'), ''),
			array('项目需求管理', formatUrl('home/coding'), ''),
		),
		'right' => 'business'
	),
	array(
		'module' => '物业服务',
		'menu' => array(
			array('物业信息管理', formatUrl('home/coding'), ''),
			array('物业办理', formatUrl('home/coding'), ''),
		),
		'right' => 'property'
	),
	array(
		'module' => '信息管理',
		'menu' => array(
			array('资讯类别管理', formatUrl('article/type'), 'article_type'),
			array('资讯管理', formatUrl('article/index'), 'article_list'),
			array('园区活动管理', formatUrl('activity/index'), 'activity_list'),
			array('文档管理', formatUrl('netdisk/dirList'), 'dir_list'),
		),
		'right' => 'information'
	),
	array(
		'module' => '俱乐部管理',
		'menu' => array(
			array('会员管理', formatUrl('club/userList'), 'club_userList'),
			array('活动管理', formatUrl('club/activityList'), 'club_activityList'),
			array('产品管理', formatUrl('club/productList'), 'club_productList'),
		),
		'right' => 'club'
	),
	array(
		'module' => '系统管理',
		'menu' => array(
			array('系统配置', formatUrl('sys/index'), 'sys_config'),
			array('投诉建议管理', formatUrl('feedback/index'), 'feedback_list'),
		),
		'right' => 'sys'
	),
);

/*
 * 权限
 */
$config['rights'] = array(
	array(
		'module' => '工作台',
		'roles' => array(
		),
		'right' => 'workbench'
	),
	array(
		'module' => '招商管理',
		'roles' => array(
		),
		'right' => 'investment'
	),
	array(
		'module' => '用户管理',
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
			array('园区用户删除', 'user_del', TRUE)
		),
		'right' => 'user'
	),
	array(
		'module' => '楼宇管理',
		'roles' => array(
		),
		'right' => 'building'
	),
	array(
		'module' => '企业服务',
		'roles' => array(
		),
		'right' => 'business'
	),
	array(
		'module' => '物业服务',
		'roles' => array(
		),
		'right' => 'property'
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
			array('资讯删除', 'article_del', TRUE),
			array('园区活动列表', 'activity_list'),
			array('园区活动添加', 'activity_add'),
			array('园区活动删除', 'activity_del'),
			array('园区活动审核', 'activity_audit'),
			array('园区活动报名删除', 'activity_register_del'),
			array('园区活动评论删除', 'activity_comment_del', TRUE),
			array('目录列表', 'dir_list'),
			array('目录添加', 'dir_add'),
			array('目录编辑', 'dir_edit'),
			array('目录删除', 'dir_del')
		),
		'right' => 'information'
	),
	array(
		'module' => '俱乐部管理',
		'roles' => array(
			array('俱乐部用户列表', 'club_userList'),
			array('俱乐部用户增加', 'club_userAdd'),
			array('俱乐部用户编辑', 'club_userEdit'),
			array('俱乐部用户删除', 'club_userDel', TRUE),
			array('俱乐部活动列表', 'club_activityList'),
			array('俱乐部活动增加', 'club_activityAdd'),
			array('俱乐部活动编辑', 'club_activityEdit'),
			array('俱乐部活动删除', 'club_activityDel', TRUE),
			array('俱乐部产品列表', 'club_productList'),
			array('俱乐部产品增加', 'club_productAdd'),
			array('俱乐部产品编辑', 'club_productEdit'),
			array('俱乐部产品删除', 'club_productDel', TRUE)
		),
		'right' => 'club'
	),
	array(
		'module' => '系统管理',
		'roles' => array(
			array('系统配置', 'sys_config'),
			array('投诉建议列表', 'feedback_list'),
			array('投诉建议回复', 'feedback_reply')
		),
		'right' => 'sys'
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
	'0' => '孵化器用户',
	'1' => '投资人俱乐部用户',
	'2' => '基金用户'
);

/**
 * 
 * 用户二级类型
 */
$config['user_second_type'] = array(
	'1' => '个人用户',
	'2' => '企业用户',
	'3' => '创客用户'
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

/**
 * 活动审核状态
 */
$config['activity_audit_type'] = array(
	'0' => '待审核',
	'1' => '审核通过',
	'2' => '审核拒绝'
);

/**
 * 
 * 系统默认设置
 */
$config['default_sys_config'] = array(
	'website_title' => '融易创新园区信息平台',
	'website_keyword' => '关键词',
	'website_desc' => '描述',
	'website_copyright' => '2016 xxx.com. All rights reserved',
	'website_record_no' => '粤ICP备XXX'
);