<section id="blog" class="container">
	    {if empty($articleInfo)}
	    <div class="center">
            <h2>该文章不存在</h2>
            <p class="lead">&nbsp;</p>
        </div>
	    {else}
        <div class="center">
            <h2>{$articleInfo['article_title']}</h2>
            <p class="lead">&nbsp;</p>
        </div>

        <div class="blog">
            <div class="row">
                <div class="col-md-8">
                    <div class="blog-item">
                            <div class="row">  
                                <div class="col-xs-12 col-sm-2 text-center">
                                    <div class="entry-meta">
                                        <span id="publish_date">{date('Y-m-d', $articleInfo['add_time'])}</span>
                                        <span><i class="fa fa-user"></i> <a href="#">{$articleInfo['admin_name']}</a></span>
                                        <span><i class="fa fa-comment"></i> <a href="javascript:;">{$articleCommentCount} 评论</a></span>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-10 blog-content">
                                    {$articleInfo['article_content']}

                                </div>
                            </div>
                        </div>
                        
                        <h1 id="comments_title">{$articleCommentCount} 条评论 </h1>
                        {foreach $articleComment as $item}
                        <div class="media comment_section">
                            <div class="pull-left post_comments">
                                <a href="#"><img src="/public/new/images/blog/avatar3.png" class="img-circle" alt="" /></a>
                            </div>
                            <div class="media-body post_reply_comments">
                                <h3>{$item['user_name']}</h3>
                                <h4>{date('Y-m-d H:i:s',$item['add_time'])}</h4>
                                <p>{$item['comment']}</p>
                            </div>
                        </div>
                        {/foreach} 
                </div>        
                        
                <aside class="col-md-4">
    				
    				<div class="widget categories">
                        <h3>最新评论</h3>
                        <div class="row">
                            <div class="col-sm-12">
                                {if !empty($articleComment)}
                                {foreach $articleComment as $k=>$item}
                                {if $k<3}
                                <div class="single_comments">
    								<img src="/public/new/images/blog/avatar3.png" alt=""  />
    								<p>{$item['comment']}</p>
                                    <div class="entry-meta small muted">
                                        <span>By <a href="#">{$item['user_name']}</a></span ><span>{date('Y-m-d H:i:s',add_time)}</span>
                                    </div>
    							</div>
    							{/if}
    							{/foreach}
    							{else}
    							<p>暂无评论</p>
    							{/if}
                            </div>
                        </div>                     
                    </div>
                     

                    <div class="widget categories">
                        <h3>标签</h3>
                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="blog_category">
                                    <li><a href="#">松山湖 <span class="badge">04</span></a></li>
                                    <li><a href="#">证券 <span class="badge">10</span></a></li>
                                    <li><a href="#">融易 <span class="badge">06</span></a></li>
                                    <li><a href="#">投资 <span class="badge">25</span></a></li>
                                </ul>
                            </div>
                        </div>                     
                    </div>
    				
    				<div class="widget archieve">
                        <h3>更多新闻</h3>
                        <div class="row">
                            <div class="col-sm-12">
                                <ul class="blog_archieve">
                                    {foreach $list as $val}
                                    <li><a href="{formatUrl('article/info?id=')}{$val['article_id']}"><i class="fa fa-angle-double-right"></i> {$val['article_title']}</a></li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>                     
                    </div> 
                    
                                      
    					
    				
                </aside>     

            </div>

         </div>
         {/if}
</section>