<?php
/*
 * 菜单
 */
$config['menus'] = array(
	array(
		'module' => '工作台',
		'menu' => array(
			array('活动审批', formatUrl('workbench/activity'), array('activity_audit','activity_assign')),
			array('企业审批', formatUrl('workbench/enterprise'), array('enterprise_user_approve','enterprise_user_assign','apply_assign','apply_audit')),
			array('物业服务', formatUrl('workbench/property'), array('repair_confirm', 'repair_assign', 'complain_reply', 'complain_assign')),
			array('企业服务', formatUrl('workbench/business'), array('project_apply_confirm', 'project_apply_assign', 'room_booking_confirm', 'room_booking_assign', 'potential_follow', 'potential_assign')),
		),
		'right' => 'workbench'
	),
	array(
		'module' => '招商管理',
		'menu' => array(
			array('入驻流程配置', formatUrl('investment/flow'), 'flow_list'),
			array('入驻申请管理', formatUrl('investment/apply'), 'apply_list'),
			array('潜在客户管理', formatUrl('investment/potential'), 'potential_list'),
			array('入驻企业管理', formatUrl('enterprise/index'), 'enterprise_list'),
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
			array('楼宇信息管理', formatUrl('building/index'), 'building_list')
		),
		'right' => 'building'
	),
	array(
		'module' => '企业服务',
		'menu' => array(
			array('多功能厅管理', formatUrl('room/roomList?t=0'), 'room_list'),
			array('VIP室管理', formatUrl('room/roomList?t=1'), 'room_list'),
			array('企业需求管理', formatUrl('project/index'), 'project_list'),
			array('投资申请管理', formatUrl('investment/index'), 'project_list')
		),
		'right' => 'business'
	),
	array(
		'module' => '物业服务',
		'menu' => array(
			array('企业需求管理', formatUrl('property/need'), 'need_list'),
			array('物业报修管理', formatUrl('property/repair'), 'repair_list'),
			array('物业投诉管理', formatUrl('property/complain'), 'complain_list'),
			array('费用管理', formatUrl('property/feeList'), 'fee_list'),
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
		'module' => '招商管理',
		'roles' => array(
			array('入驻流程列表', 'flow_list'),
			array('入驻流程添加', 'flow_add'),
			array('入驻流程编辑', 'flow_edit'),
			array('入驻流程删除', 'flow_del', TRUE),
			array('入驻申请列表', 'apply_list'),
			array('入驻申请审核指派', 'apply_assign'),
			array('入驻申请审核', 'apply_audit', TRUE),
			array('入驻企业列表', 'enterprise_list'),
			array('入驻企业添加', 'enterprise_add'),
			array('入驻企业编辑', 'enterprise_edit'),
			array('入驻企业删除', 'enterprise_del', TRUE),
			array('潜在客户管理', 'potential_list'),
			array('潜在客户添加', 'potential_add'),
			array('潜在客户删除', 'potential_del'),
			array('潜在客户跟进指派', 'potential_assign'),
			array('潜在客户跟进', 'potential_follow', TRUE),
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
			array('园区用户删除', 'user_del', TRUE),
			array('企业用户审批', 'enterprise_user_approve'),
			array('企业用户审批指派', 'enterprise_user_assign')
			
		),
		'right' => 'user'
	),
	array(
		'module' => '楼宇管理',
		'roles' => array(
			array('楼宇信息列表', 'building_list'),
			array('楼宇信息增加', 'building_add'),
			array('楼宇信息编辑', 'building_edit'),
			array('楼宇信息删除', 'building_del')
		),
		'right' => 'building'
	),
	array(
		'module' => '企业服务',
		'roles' => array(
			array('房间管理列表', 'room_list'),
			array('房间增加', 'room_add'),
			array('房间编辑', 'room_edit'),
			array('房间删除', 'room_del'),
			array('房间预订确认指派', 'room_booking_assign'),
			array('房间预订确认', 'room_booking_confirm'),
			array('房间租用申请导出', 'room_booking_export'),
			array('房间使用情况导出', 'room_used_export', TRUE),
			array('项目需求列表', 'project_list'),
			array('项目需求查看', 'project_detail'),
			array('项目需求增加', 'project_add'),
			array('项目需求编辑', 'project_edit'),
			array('项目需求删除', 'project_del'),
			array('项目申请确认', 'project_apply_confirm'),
			array('项目申请确认指派', 'project_apply_assign')
		),
		'right' => 'business'
	),
	array(
		'module' => '物业服务',
		'roles' => array(
			array('企业需求列表', 'need_list'),
			array('企业需求确认', 'need_confirm', TRUE),
			array('物业报修列表', 'repair_list'),
			array('物业报修确认指派', 'repair_assign'),
			array('物业报修确认', 'repair_confirm', TRUE),
			array('物业投诉列表', 'complain_list'),
			array('物业投诉回复指派', 'complain_assign'),
			array('物业投诉回复', 'complain_reply', TRUE),
			array('费用管理列表', 'fee_list'),
			array('费用增加', 'fee_add'),
			array('费用编辑', 'fee_edit'),
			array('费用删除', 'fee_del'),
			array('费用支付', 'fee_pay'),
			array('缴费通知单导出', 'fee_export'),
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
			array('园区活动审核指派', 'activity_assign'),
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
	'0' => '待审核',
	'1' => '审核通过',
	'2' => '审核拒绝'
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

/**
 * 
 * 楼宇类型
 */
$config['building_type'] = array(
	'0' => '空置',
	'1' => '报备',
	'2' => '已租',
	'3' => '已售'
);

/**
 * 物业报修类型
 */
$config['repair_type'] = array(
	'0' => '灯具维修',
	'1' => '空调维修',
	'2' => '门窗维修',
	'3' => '水龙头维修',
	'4' => '下水道疏通',
	'5' => '开关插座维修',
	'6' => '线路维修',
	'7' => '土建维修（墙面涂料、墙砖、地砖）',
	'8' => '其他'
);

/**
 * 物业报修状态
 */
$config['repair_status'] = array(
	'0' => '已提交',
	'1' => '已跟进',
	'2' => '处理完毕'
);

/**
 * 物业投诉状态
 */
$config['complain_status'] = array(
	'0' => '已提交',
	'1' => '已跟进',
	'2' => '处理完毕'
);

/**
 * 
 * 费用类型
 * @var unknown_type
 */
$config['fee_type'] = array(
	'0' => '水费管理',
	'1' => '电费管理',
	'2' => '物业费管理'
);

/**
 * 企业需求类型
 */
$config['apply_type'] = array(
	'0' => '基础服务',
	'1' => '工商税务',
	'2' => '市场信息',
	'3' => '活动策划',
	'4' => '政策信息',
	'5' => '法律服务',
	'6' => '专利服务',
	'7' => '投资融资',
);

/**
 * 需求申请状态
 */
$config['apply_status'] = array(
	'0' => '已提交',
	'1' => '已跟进',
	'2' => '已处理'
);

/**
 * 项目申请状态
 */
$config['project_apply_status'] = array(
	'0' => '已提交',
	'1' => '已跟进'
);

/**
 * 房间类型
 */
$config['room_type'] = array(
	'0' => '多功能厅',
	'1' => 'VIP室'
);

/**
 * 
 * 会议预订状态
 */
$config['room_booking_status'] = array(
	'0' => '已提交',
	'1' => '确认通过',
	'2' => '确认不通过'
);

/**
 * 用户菜单,key对应用户类型
 */
$config['user_home_menu'] = array(
		'0' => array(
		    array('入驻申请','application','enter'),
			array('我的物业','property','wrench',2),
			array('公共资源','resource','palette',2),
			array('投资申请','invest','coins',2),
			array('企业需求','project','filter'),
			array('企业风采','corporate','cog',2),
			//array('我的活动','activity','calendar'),
		),
		'1' => array(
		    array('我的活动','activity','calendar'),
			array('我的项目','myproj','shareable'),
		),
		'2' => array(
		    array('我的基金','myfund','strikethrough'),
			array('交易记录','mydeal','list-numbered'),
		),
);

/**
 * 企业物业需求类型
 */
$config['need_type'] = array(
	'0' => '咨询',
	'1' => '安保',
	'2' => '保洁',
	'3' => '其他',
);

/**
 * 企业需求状态
 */
$config['need_status'] = array(
	'0' => '已提交',
	'1' => '已跟进'
);

/**
 * 投资需求状态
 */
$config['invest_apply_status'] = array(
	'0' => '已提交',
	'1' => '已跟进',
	'2' => '申请通过',
	'3' => '申请不通过',
);

/**
 * 
 * 入驻申请状态
 * @var unknown_type
 */
$config['apply_deal_status'] = array(
	'0' => '已提交',
	'1' => '放弃立项',
	'2' => '已立项',
	'3' => '审核通过',
	'4' => '审核未通过',
);

/**
 * 初始费用信息
 */
$config['init_fee'] = array(
	'building_rent_fee' 	=> 50,   // 租金单价
	'building_property_fee' => 6,  	 // 物业费单价
	'water_fee'             => 3.57, // 水费单价
	'elec_fee'              => 1.2   // 电费单价
);