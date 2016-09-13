<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  招商管理<span class="c-gray en">&gt;</span> <a href="{formatUrl('investment/apply')}">入驻申请管理</a> <span class="c-gray en">&gt;</span> 详情</nav>
<div class="pd-20">
	{if empty($info)}
	<p>该入驻申请不存在</p>
	{else}
	<form class="Huiform" action="{formatUrl('investment/doAuditApply')}" method="post">
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
      		     <th class="text-r">状态：</th>
      			 <td>{$apply_deal_status[$info['deal_status']]}{if $info['deal_status']>1}&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius checkapproval" href="javascript:;">查看立项表</a>{/if}</td>
    		</tr>
    		{if $info['deal_status'] >2} 
    		<tr>
      		     <th class="text-r">审核信息：</th>
      			 <td>{$info['msg']}</td>
    		</tr>
    		<tr>
		          		     <th class="text-r" width="180">是否需要领导协助：</th>
		          			 <td>{if $info['deal_status'] >2 && $info['need_help'] == 0}否{else if $info['deal_status'] >2 && $info['need_help'] == 1}是{/if}</td>
		        		</tr>
		        		{if $info['attachment']}
		        		<tr>
		          		     <th class="text-r" width="180">附件：</th>
		          			 <td><a class="c-primary" href="{$info['attachment']}" target="_blank"><u class="c-primar">附件下载</u></a></td>
		        		</tr>
		        		{/if}
    		{/if}
    		{if checkRight('activity_audit') && $info['deal_status'] == 0 && $info['follow_by'] == $userId}
    			<tr>
        			<th class="text-r" style="width:100px">立项判断<span class="c-red">*</span></th>
        			<td>
        				<input type="radio" name="deal_status" value="2" nullmsg="立项判断不能为空！" datatype="*">立项
		          		&nbsp;&nbsp;
		          		<input type="radio" name="deal_status" value="1" nullmsg="立项判断不能为空！" datatype="*">放弃
        			</td>
        		</tr>
        		<tr>
        			<th></th>
      				<td colspan="2">
      					<input name="enterprise_id" type="hidden" value="{$info['enterprise_id']}">
      					<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i>确认</button>
      				</td>
      			</tr>
            {/if}
    		{if checkRight('activity_audit') && $info['deal_status'] == 2 && $info['follow_by'] == $userId}
    			<tr>
        			<th class="text-r" style="width:100px">审核结果<span class="c-red">*</span></th>
        			<td>
        				<input type="radio" name="deal_status" value="3" nullmsg="审核结果不能为空！" datatype="*">通过
		          		&nbsp;&nbsp;
		          		<input type="radio" name="deal_status" value="4" nullmsg="审核结果不能为空！" datatype="*">不通过
        			</td>
        		</tr>
        		<tr>
					<th class="text-r" style="width:100px">是否需要领导协助 <span class="c-red">*</span></th>
          			<td>
          		     	<input type="radio" name="need_help" value="1" nullmsg="请选择是否需要领导协助！" datatype="*">是
          		     	&nbsp;&nbsp;
          		     	<input type="radio" name="need_help" value="0" nullmsg="请选择是否需要领导协助！" datatype="*">否
          		     </td>
        		</tr>
				<tr>
					<th class="text-r" style="width:100px">上传附件</th>
          			<td>
          		     	<div id="uploader">
          		     		<div class="btns"><div id="picker">选择文件</div></div>
							<p id="result"></p>
						</div>
						<input type="hidden" name="attachment" value="" id="attachment">
          		    </td>
        		</tr>
    			<tr>
        			<th class="text-r" style="width:100px">审核信息<span class="c-red">*</span></th>
        			<td>
        				<textarea style="width:400px;height:200px" name="msg" nullmsg="请输入审核信息"  datatype="s"></textarea>
        			</td>
        		</tr>
          		<tr>
        			<th></th>
      				<td colspan="2">
      					<input name="enterprise_id" type="hidden" value="{$info['enterprise_id']}">
      					<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i>确认</button>
      				</td>
      			</tr>
    		{/if}
    		{if checkRight('apply_assign') && $info['deal_status'] == 0 && $info['follow_by'] == 0}
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
{if $info['deal_status']>1}
<div class="pd-20 text-c" style="display:none" id="approvalWindow">
	<table class="table table-bg table-border table-bordered">
	    <tr>
  		     <th class="text-r" width="100">注册地点：</th>
  			 <td>{$approval['registered_address']}</td>
		</tr>
		<tr>
  		     <th class="text-r">行业分类：</th>
  			 <td>{$approval['industry_classification']}</td>
		</tr>
		<tr>
			<th class="text-r">股东情况：</th>
			<td>
				{$approval['shareholder']}
			</td>
    	</tr>
    	<tr>
			<th class="text-r">主营业务及产品</th>
			<td>
				{$approval['primary_business']}
			</td>
    	</tr>
    	<tr>
			<th class="text-r">技术和专利情况</th>
			<td>
				{$approval['technology_patents']}
			</td>
    	</tr>
    	<tr>
			<th class="text-r">团队判断</th>
			<td>
				{$approval['team_judgment']}
			</td>
    	</tr>
    	<tr>
			<th class="text-r">商业模式</th>
			<td>
				{$approval['business_model']}
			</td>
    	</tr>
    	<tr>
			<th class="text-r">营收及财务状况</th>
			<td>
				{$approval['revenue_financial']}
			</td>
    	</tr>
    	<tr>
			<th class="text-r">所处市场情况</th>
			<td>
				{$approval['market']}
			</td>
    	</tr>
		<tr>
			<th class="text-r">竞争力判断</th>
			<td>
				{$approval['competitive_judgment']}
			</td>
    	</tr>
  	</table>
</div>
{/if}
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>
<input type="hidden" id="uploadUrl" value="{formatUrl('file/upload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/file.js""></script>
<script type="text/javascript" src="/public/mis/js/apply.js?v=0724"></script>