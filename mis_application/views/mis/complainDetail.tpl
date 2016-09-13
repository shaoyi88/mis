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
        		<tr>
          		     <th class="text-r" width="180">回复信息：</th>
          			 <td>{$info['feedback']}</td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">是否需要领导协助：</th>
          			 <td>{if $info['status'] != 0 && $info['need_help'] == 0}否{else if $info['status'] != 0 && $info['need_help'] == 1}是{/if}</td>
        		</tr>
        		{if $info['attachment']}
        		<tr>
          		     <th class="text-r" width="180">附件：</th>
          			 <td><a class="c-primary" href="{$info['attachment']}" target="_blank"><u class="c-primar">附件下载</u></a></td>
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
          			<th></th>
          			<td>
          				<input name="status" value="1" type="hidden"></input>
          				<input name="complain_id" value="{$info['complain_id']}" type="hidden"></input>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 提交</button>
          			</td>
        		</tr>
        		{/if}
        		{if $info['status'] == 1 && checkRight('complain_reply') && $info['follow_by'] == $userId}
        		<tr>
          			<th></th>
          			<td>
          				<input name="status" value="2" type="hidden"></input>
          				<input name="complain_id" value="{$info['complain_id']}" type="hidden"></input>
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i> 确认处理完毕</button>
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
<input type="hidden" id="uploadUrl" value="{formatUrl('file/upload')}"></input>
<link rel="stylesheet" type="text/css" href="/public/common/js/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/public/common/js/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="/public/mis/js/file.js""></script>
<script type="text/javascript" src="/public/mis/js/complain.js""></script>