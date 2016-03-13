<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  俱乐部管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('club/activityList')}">活动管理</a> <span class="c-gray en">&gt;</span> 活动详情</nav>
<div class="pd-20 text-c ml-10 mr-10" style="border-bottom:1px dotted #dbdbdb">
    <h2>{$info['activity_title']}</h2>
	<p>{$info['admin_name']}&nbsp;&nbsp;{date('Y-m-d H:i:s',$info['add_time'])}</p>
</div>
<div class="pd-20">
	{$info['activity_content']}
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>