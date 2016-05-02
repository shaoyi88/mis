<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>  物业服务 <span class="c-gray en">&gt;</span> <a href="{formatUrl('property/complain')}">物业投诉管理</a> <span class="c-gray en">&gt;</span> 查看</nav>
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('property/complainReply')}" method="post">
		<table class="table table-border table-bordered table-bg">
			<tbody>
        		<tr>
          		     <th class="text-r" width="180">投诉内容：</th>
          			 <td>{$info['complain_content']}</td>
        		</tr>
        		{if $info['complain_img']}
        		<tr>
          		     <th class="text-r" width="180">投诉图片：</th>
          			 <td><img src="$info['complain_img']" width="200"></td>
        		</tr>
        		{/if}
        		<tr>
          		     <th class="text-r" width="180">联系人：</th>
          			 <td>{$info['contacts']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">联系电话：</th>
          			 <td>{$info['contacts_phone']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">联系邮箱：</th>
          			 <td>{$info['contacts_email']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">投诉时间：</th>
          			 <td>{date('Y-m-d H:i:s',$info['add_time'])}</td>
        		</tr>     		
        		{if $info['status'] == 1}
        		<tr>
          		     <th class="text-r" width="180">回复信息：</th>
          			 <td>{$info['feedback']}</td>
        		</tr>
        		{/if}
        		<tr>
          		     <th class="text-r" width="180">当前状态：</th>
          			 <td>{$complain_status[$info['status']]}</td>
        		</tr>
        		{if $info['status'] == 0 && checkRight('complain_reply') && $info['follow_by'] == $userId}
        		<tr>
          		     <th class="text-r" width="180"><span class="c-red">*</span>确认信息：</th>
          			 <td><textarea style="width:500px;height:140px;" name="feedback" cols="" rows="" class="textarea" id="feedback" nullmsg="确认信息不能为空！" datatype="s"></textarea></td>
        		</tr>
        		<tr>
          			<th></th>
          			<td>
          				<input name="complain_id" value="{$info['complain_id']}" type="hidden"></input>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
        		{/if}
        		{if checkRight('complain_assign') && $info['status'] == 0 && $info['follow_by'] == 0}
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
		      					<input name="complain_id" value="{$info['complain_id']}" type="hidden"></input>
		      					<button itype="submit" class="btn btn-success radius"><i class="icon-ok"></i>提交</button>
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
<script type="text/javascript" src="/public/mis/js/complain.js""></script>