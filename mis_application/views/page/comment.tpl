<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;<a href="{formatUrl('article/info?id=')}{$articleInfo['article_id']}">{$articleInfo['article_title']}</a>&nbsp;>&nbsp;<span class="icon mif-pencil"></span>&nbsp;评论&nbsp;</div>
<div class="commentList" style="min-height:500px;">
    {if empty($articleComment)}
    <div class="commentArea">
        <p>暂无评论</p>
    </div>
    {else}
    <div class="commentArea">
    {foreach $articleComment as $item}
		<div class="panel">
		    <div class="heading bg-white">
		        <span class="title fg-black">{$item['comment_context']}</span>
		    </div>
		    <div class="content" style="text-align:right">
		        <span class="fg-darkCobalt">{$item['user_nickname']}&nbsp;</span>发表于<span class="fg-grayLight">{date('Y-m-d H:i:s',$item['comment_time'])}</span>&nbsp;
		    </div>
		</div>
	{/foreach}
	</div>
    {/if}
    <div class="input-control text" style="margin-top:20px;">
        <input type="text" id="context" placeholder="我来说两句..." style="width:950px;">
    </div>
    <div class="panel">
        <button class="button primary comBtn">评论</button>
    </div>
</div>
<div data-role="dialog" id="login" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" data-type="info" data-background="bg-grayLight">
	<div class="login-form padding40 block-shadow">
		<div class="input-control text full-size" data-role="input">
	        <label for="user_login">账户:</label>
	        <span class="mif-user prepend-icon"></span>
	        <input type="text" name="user_login" id="user_login" data-validate-func="required" data-validate-hint="请输入账户！">
	        <button class="button helper-button clear"><span class="mif-cross"></span></button>
	    </div>
	    <br />
	    <br />
	    <div class="input-control password full-size" data-role="input">
	        <label for="user_password">密码:</label>
	        <span class="mif-lock prepend-icon"></span>
	        <input type="password" name="user_password" id="user_password" data-validate-func="required" data-validate-hint="请输入密码！">
	        <button class="button helper-button reveal"><span class="mif-looks"></span></button>
	    </div>
	    <br />
	    <br />
	    <div class="form-actions">
	        <button class="button primary dologin">登录</button>&nbsp;&nbsp;
	        <button class="button primary canlog" onclick="hideMetroDialog('#login')">取消</button>
	    </div>
	    <div class="padding10 fg-darkRed"></div>
    </div>
</div>
<input type="hidden" id="commentUrl" value="{formatUrl('article/addComment')}"></input>
<input type="hidden" id="loginUrl" value="{formatUrl('login/ajaxLogin')}"></input>
<input type="hidden" id="articleID" value="{$articleInfo['article_id']}"></input>
<script type="text/javascript">
$(function(){
    $(".comBtn").click(addComment);
    $(".dologin").click(ajaxLogin);
});
function addComment(){
    var ajaxurl = $("#commentUrl").val();
    var id = $("#articleID").val();
    var text = $("#context").val();
    if(text==''){
        alert("评论内容不能为空");
        return false;
    }
    var lock = 1;
    $(".comBtn").html("...");
    if(lock==1){
        lock = 2;
	    $.ajax({
	        url: ajaxurl,
	        type: 'post',
	        data : {
	        	article_id : id,
	        	comment_context: text,
	        },
	        dataType: 'json',
	        success : function(data){
	            if(data.status==-1){
	                showDialog('#login');
	            }else if(data.status==1){
	                var info = '<div class="panel"><div class="heading bg-white"><span class="title fg-black">'+data.info.comment_context+'</span></div><div class="content" style="text-align:right"><span class="fg-darkCobalt">'+data.info.user_name+'&nbsp;</span>发表于<span class="fg-grayLight">'+data.info.comment_time+'</span>&nbsp;</div></div>';
			        $(".commentArea>p").empty();
			        $(".commentArea").before(info);
			        $("#context").val('');
	            }else{
	            	alert('评论失败，请稍后再试');            	
	            }	            
	            $(".comBtn").html("评论");
	            lock = 1;
	        }
	    });
    }      
}
function showDialog(id){
     var dialog = $(id).data('dialog');
     dialog.open();
}
function ajaxLogin(){
    var ajaxurl = $("#loginUrl").val();
    var name = $("#user_login").val();
    if(name==''){
        alert("登录账号不能为空");
        return false;
    }
    var pwd = $("#user_password").val();
    if(pwd==''){
        alert("密码不能为空");
        return false;
    }
    var lock = 1;
    if(lock==1){
        lock = 2;
	    $.ajax({
	        url: ajaxurl,
	        type: 'post',
	        data : {
	        	user_login : name,
	        	user_password: pwd,
	        },
	        dataType: 'json',
	        success : function(data){
	            if(data.status==1){
	                hideMetroDialog('#login');
	            }else{
	            	alert(data.error);            	
	            }	            
	            lock = 1;
	        }
	    });
    }      
}
</script>