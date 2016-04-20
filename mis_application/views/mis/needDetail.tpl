<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('property/need')}">企业需求管理</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('property/needConfirm')}" method="post">
		<table class="table table-border table-bordered table-bg">
			<tbody>
        		<tr>
          		     <th class="text-r" width="180">企业：</th>
          			 <td>{$info['enterprise_name']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">需求类型：</th>
          			 <td>{$need_type[$info['need_type']]}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">需求内容：</th>
          			 <td>{$info['need_content']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">提交时间：</th>
          			 <td>{date('Y-m-d H:i:s',$info['add_time'])}</td>
        		</tr>     		
        		<tr>
          		     <th class="text-r" width="180">当前状态：</th>
          			 <td>{$need_status[$info['status']]}</td>
        		</tr>
        		{if $info['status'] == 0 && checkRight('need_confrim')}
        		<tr>
          			<th></th>
          			<td>
          				<input name="need_id" value="{$info['need_id']}" type="hidden"></input>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 确认</button>
          			</td>
        		</tr>
        		{/if}
        	</tbody>
		</table>
	</form>
</div>
<div class="pd-20 text-c">
<a class="btn btn-primary radius" href="javascript:history.go(-1);" style="text-decoration:none;height:auto">返回</a>
</div>