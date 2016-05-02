<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  招商管理<span class="c-gray en">&gt;</span> <a href="{formatUrl('investment/potential')}">潜在客户管理</a> <span class="c-gray en">&gt;</span> 详情</nav>
<div class="pd-20">
	{if empty($info)}
	<p>该潜在客户不存在</p>
	{else}
	<form class="Huiform" action="{formatUrl('investment/doFollowPotential')}" method="post">
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
    		<tr>
      		     <th class="text-r">处理状态：</th>
      			 <td>{if $info['deal_status']==0}待跟进{else}已跟进{/if}</td>
    		</tr>
    		<tr>
      		     <th class="text-r">处理信息：</th>
      			 <td>{$info['msg']}</td>
    		</tr>
    		{if checkRight('potential_follow') && $info['deal_status'] == 0 && $info['follow_by'] == $userId}
    			<tr>
        			<th class="text-r" style="width:100px">跟进信息<span class="c-red">*</span></th>
        			<td>
        				<textarea style="width:400px;height:200px" name="msg" nullmsg="请输入跟进信息"  datatype="s"></textarea>
        			</td>
        		</tr>
          		<tr>
        			<th></th>
      				<td colspan="2">
      					<input name="enterprise_id" type="hidden" value="{$info['enterprise_id']}">
      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>确认</button>
      				</td>
      			</tr>
    		{/if}
    		{if checkRight('potential_follow') && $info['deal_status'] == 0 && $info['follow_by'] == 0}
	        		<tr>
	          		     <th class="text-r" style="width:100px">指派跟进人<span class="c-red">*</span></th>
		          			<td>
		          		     	<select name="follow_by" nullmsg="请选择跟进人" datatype="*">
          		     				<option value="">请选择跟进人</option>
          		     				{foreach $adminList as $item}
          		     					<option value="{$item['admin_id']}">{$item['admin_name']}</option>
          		     				{/foreach}
          		     			</select>
		          		     </td>
		        		</tr>
		          		<tr>
		        			<th></th>
		      				<td colspan="2">
		      					<input name="enterprise_id" type="hidden" value="{$info['enterprise_id']}">
		      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
		      				</td>
		      			</tr>
		       {/if}
		</tbody>
	</table>
	</form>
	{/if}
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/mis/js/enterprise_potential.js""></script>