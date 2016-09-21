
    <section id="contact-page" style="padding:10px 0;">
        <div class="container">
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form action="{formatUrl('login/actionLogin')}" method="post" data-role="validator">
                    <div class="col-xs-12 col-sm-8">
                         <div class="loginLp">
                             <img src="/public/new/images/loginP.jpg" width="100%">
                         </div>
                    </div>
                    <div class="col-xs-12 col-sm-4" style="background:#dedede;margin-top:90px;">
                        <div class="form-group">
                            <label>账户 *</label>
                            <input type="text" name="user_login" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>密码 *</label>
                            <input type="password" name="user_password" class="form-control" required="required">
                        </div>                        
                        <div class="form-group">
                            <input type="hidden" name="uri" value="{$uri}">
                            <button type="submit" name="submit" class="btn btn-primary" required="required">登录</button>&nbsp;&nbsp;
                            <button type="button" class="btn btn-primary" style="background:#404040;" onclick="location.href='{formatUrl('home/register')}'">注册</button>
                            &nbsp;&nbsp;
                            <button type="button" class="btn btn-primary" style="background:#dcdcdc;color:#191919;text-decoration:underline;" onclick="location.href='{formatUrl('home/find')}'">忘记密码?</button>
                        </div>
                        {if isset($msg)&&$msg}
                        <div class="form-group" style="color:#c00;">{$msg}</div>
                        {/if}
                    </div>
                </form> 
            </div>
        </div>
    </section>