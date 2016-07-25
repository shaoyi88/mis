<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  招商管理<span class="c-gray en">&gt;</span> <a href="{formatUrl('investment/apply')}">入驻申请管理</a> <span class="c-gray en">&gt;</span> 详情</nav>
<div class="pd-20">
	{if empty($info)}
	<p>该入驻申请不存在</p>
	{else}
	<form class="Huiform" action="{formatUrl('investment/doApproval')}" method="post">
	<table class="table table-border table-bordered table-bg">
	    <input type="hidden" name="potential_id" value="{$info['enterprise_id']}">
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
      		     <th class="text-r">注册地点：<span class="c-red">*</span></th>
      			 <td><input type="text" class="input-text" name="registered_address" nullmsg="请输入注册地点"  datatype="*"></td>
    		</tr>
    		<tr>
      		     <th class="text-r">行业分类：<span class="c-red">*</span></th>
      			 <td><input type="text" class="input-text" name="industry_classification" nullmsg="请输入行业分类"  datatype="*"></td>
    		</tr>
    		<tr>
    			<th class="text-r" style="width:100px">股东情况<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="shareholder" nullmsg="请输入股东情况"  datatype="s"></textarea>
    			</td>
        	</tr>
        	<tr>
    			<th class="text-r" style="width:100px">主营业务及产品<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="primary_business" nullmsg="请输入主营业务及产品"  datatype="s"></textarea>
    			</td>
        	</tr>
        	<tr>
    			<th class="text-r" style="width:100px">技术和专利情况<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="technology_patents" nullmsg="请输入技术和专利情况"  datatype="s"></textarea>
    			</td>
        	</tr>
        	<tr>
    			<th class="text-r" style="width:100px">团队判断<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="team_judgment" nullmsg="请输入团队判断"  datatype="s"></textarea>
    			</td>
        	</tr>
        	<tr>
    			<th class="text-r" style="width:100px">商业模式<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="business_model" nullmsg="请输入商业模式"  datatype="s"></textarea>
    			</td>
        	</tr>
        	<tr>
    			<th class="text-r" style="width:100px">营收及财务状况<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="revenue_financial" nullmsg="请输入营收及财务状况"  datatype="s"></textarea>
    			</td>
        	</tr>
        	<tr>
    			<th class="text-r" style="width:100px">所处市场情况<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="market" nullmsg="请输入所处市场情况"  datatype="s"></textarea>
    			</td>
        	</tr>
    		<tr>
    			<th class="text-r" style="width:100px">竞争力判断<span class="c-red">*</span></th>
    			<td>
    				<textarea style="width:400px;height:200px" name="competitive_judgment" nullmsg="请输入竞争力判断"  datatype="s"></textarea>
    			</td>
        	</tr>
        	<tr>
    			<th></th>
  				<td colspan="2">
  					<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i>确认</button>
  				</td>
      		</tr>
		</tbody>
	</table>
	</form>
	{/if}
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>
<script type="text/javascript" src="/public/mis/js/apply.js""></script>