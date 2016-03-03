<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 系统管理<span class="c-gray en">&gt;</span> 系统配置 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
{if isset($msg)}
<div class="header">
	<div class="Huialert Huialert-danger"><i class="icon-remove"></i>{$msg}</div>
</div>
{/if}
<div class="pd-20">
	<form class="Huiform" id="form-role-add" action="{formatUrl('sys/doConfig')}" method="post">
		<table class="table table-bg">
			<tbody>
				<tr>
          		     <th class="text-r" width="180">网站名称：</th>
          			 <td><input class="input-text" style="width:250px" name="website_title" type="text" value="{if isset($info)}{$info['website_title']}{/if}" placeholder="请输入网站名称"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">网站关键词：</th>
          			 <td><textarea style="width:600px;height:100px" name="website_keyword" placeholder="请输入网站关键词">{if isset($info)}{$info['website_keyword']}{/if}</textarea>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">网站描述：</th>
          			 <td><textarea style="width:600px;height:100px" name="website_desc" placeholder="请输入网站描述">{if isset($info)}{$info['website_desc']}{/if}</textarea>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">底部版权信息：</th>
          			 <td><input class="input-text" style="width:250px" name="website_copyright" type="text" value="{if isset($info)}{$info['website_copyright']}{/if}" placeholder="请输入底部版权信息"></td>
        		</tr>
        		<tr>
          		     <th class="text-r" width="180">备案号：</th>
          			 <td><input class="input-text" style="width:250px" name="website_record_no" type="text" value="{if isset($info)}{$info['website_record_no']}{/if}" placeholder="请输入备案号"></td>
        		</tr>
				<tr>
          			<th></th>
          			<td>
          				{if isset($info)}
							<input name="sys_id" type="hidden" value="{$info['sys_id']}">
						{/if}
            			<button type="submit" class="btn btn-success radius"><i class="icon-ok"></i>保存</button>
          			</td>
        		</tr>
			</tbody>
		</table>
	</form>
</div>