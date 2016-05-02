<div class="pd-20">
	<div class="text-c">
		<p class="f-20 text-success">欢迎使用{$website_title}管理系统！</p>
		<p class="f-20 text-success">现在时间：{date('Y-m-d H:i:s', time())}</p>
		<p>您有以下待处理事项，请点击进入到对应栏目进行处理：</p>
		
		{if isset($activityNum)}
		<div class="tab" _href="{formatUrl('workbench/activity')}" data-title="活动审批" style="cursor:pointer;display:inline-block;width:200px;height:100px;background:#81ccf3;text-align: center;color: #fff;margin: 10px;padding:10px 0;">
			<p style="margin: 6px 0;">活动审批</p>
			<div style="font-size: 34px;">{$activityNum}</div>
		</div>
		{/if}
		{if isset($userNum)}
		<div class="tab" _href="{formatUrl('workbench/enterprise')}" data-title="企业审批" style="cursor:pointer;display:inline-block;width:200px;height:100px;background:#d9a0e5;text-align: center;color: #fff;margin: 10px;padding:10px 0;">
			<p style="margin: 6px 0;">企业审批</p>
			<div style="font-size: 34px;">{$userNum}</div>
		</div>
		{/if}
		{if isset($propertyNum)}
		<div class="tab" _href="{formatUrl('workbench/property')}" data-title="物业服务" style="cursor:pointer;display:inline-block;width:200px;height:100px;background:#f1a945;text-align: center;color: #fff;margin: 10px;padding:10px 0;">
			<p style="margin: 6px 0;">物业服务</p>
			<div style="font-size: 34px;">{$propertyNum}</div>
		</div>
		{/if}
		{if isset($businessNum)}
		<div class="tab" _href="{formatUrl('workbench/business')}" data-title="企业服务" style="cursor:pointer;display:inline-block;width:200px;height:100px;background:#bababa;text-align: center;color: #fff;margin: 10px;padding:10px 0;">
			<p style="margin: 6px 0;">企业服务</p>
			<div style="font-size: 34px;">{$businessNum}</div>
		</div>
		{/if}
	</div>
</div>
<script type="text/javascript" src="/public/mis/js/index.js"></script>
<script type="text/javascript" src="/public/mis/js/welcome.js""></script>