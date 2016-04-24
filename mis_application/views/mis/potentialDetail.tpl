<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  招商管理<span class="c-gray en">&gt;</span> <a href="{formatUrl('investment/potential')}">潜在客户管理</a> <span class="c-gray en">&gt;</span> 详情</nav>
<div class="pd-20">
	{if empty($info)}
	<p>该潜在客户不存在</p>
	{else}
	<table class="table table-border table-bordered table-bg">
		<tbody>
			<tr>
      		     <th class="text-r" width="180">企业名称：</th>
      			 <td>{$info['enterprise_name']}</td>
    		</tr>
			<tr>
      		     <th class="text-r">注册时间：</th>
      			 <td>{$info['reg_time']}</td>
    		</tr>
    		<tr>
      		     <th class="text-r">注册资金：</th>
      			 <td>{$info['registered_funds']}万元</td>
    		</tr>
    		<tr>
      		     <th class="text-r">上年营业收入：</th>
      			 <td>{$info['last_year_income']}万元</td>
    		</tr>
    		<tr>
      		     <th class="text-r">上年年末职工数：</th>
      			 <td>{$info['last_year_workers']}人</td>
    		</tr>
    		<tr>
      		     <th class="text-r">是否高新企业：</th>
      			 <td>{if $info['is_high_tech']==1}是{else}否{/if}</td>
    		</tr>
    		<tr>
      		     <th class="text-r">营业执照：</th>
      			 <td><img src="/./upload/enterprise/licence/{$info['enterprise_business_licence']}" max-width="600"></td>
    		</tr>
    		<tr>
      		     <th class="text-r">联系人：</th>
      			 <td>{$info['enterprise_contact']}</td>
    		</tr>
    		<tr>
      		     <th class="text-r">联系人手机：</th>
      			 <td>{$info['enterprise_contact_mobile']}</td>
    		</tr>
		</tbody>
	</table>
	{/if}
</div>
<script>

</script>