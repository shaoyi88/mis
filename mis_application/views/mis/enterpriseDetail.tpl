<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  招商管理 <span class="c-gray en">&gt;</span> <a href="{formatUrl('enterprise/index')}">入驻企业管理</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
		<table class="table table-border table-bordered table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">企业名称：</th>
          			 <td>{$info['enterprise_name']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业注册时间：</th>
          			 <td>{date('Y-m-d',$info['enterprise_reg_time'])}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业注册资金：</th>
          			 <td>{$info['enterprise_registered_funds']}万</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业营业执照：</th>
          			 <td><img width="100" src="{$info['enterprise_business_licence']}"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业入驻时间：</th>
          			 <td>{date('Y-m-d',$info['enterprise_enter_time'])}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业法人：</th>
          			 <td>{$info['enterprise_artificial']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业联系人：</th>
          			 <td>{$info['enterprise_contact']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业联系人手机：</th>
          			 <td>{$info['enterprise_mobile']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">企业账户余额：</th>
          			 <td>{$info['enterprise_account']}元</td>
        		</tr>
        	</tbody>
		</table>
		
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>