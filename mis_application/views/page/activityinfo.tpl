<section id="blog" class="container">
	    {if empty($activityInfo)}
	    <div class="center">
            <h2>该活动不存在</h2>
            <p class="lead">&nbsp;</p>
        </div>
	    {else}
        <div class="center">
            <h2>{$activityInfo['activity_title']}</h2>
            <p class="lead">&nbsp;</p>
        </div>

        <div class="blog">
            <div class="row">
                <div class="col-md-8">
                    <div class="blog-item">
                            <div class="row">  
                                <div class="col-xs-12 col-sm-2 text-center">
                                    <div class="entry-meta">
                                        <span id="publish_date">{date('Y-m-d', $activityInfo['add_time'])}</span>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-10 blog-content">
                                    <p>时间：{if $activityInfo['activity_start_time']}{date('Y-m-d',$activityInfo['activity_start_time'])}{/if}{if $activityInfo['activity_end_time']&&$activityInfo['activity_start_time']!=$activityInfo['activity_end_time']}至{date('Y-m-d',$activityInfo['activity_end_time'])}{/if}</p>
                                    <p>地点：{$activityInfo['activity_location']}</p>
                                </div>
                                <div class="col-xs-12 col-sm-10 blog-content">
                                    {$activityInfo['activity_content']}
                                </div>
                            </div>
                        </div>
                        
                </div>        
                        
                <aside class="col-md-4">
                     

                    <div class="widget categories">
                        <h3>标签</h3>
                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="blog_category">
                                    <li><a href="#">互联网 <span class="badge">04</span></a></li>
                                    <li><a href="#">制造业 <span class="badge">10</span></a></li>
                                    <li><a href="#">物联网 <span class="badge">06</span></a></li>
                                    <li><a href="#">大健康 <span class="badge">25</span></a></li>
                                </ul>
                            </div>
                        </div>                     
                    </div>
    				
    				<div class="widget archieve">
                        <h3>更多活动</h3>
                        <div class="row">
                            <div class="col-sm-12">
                                <ul class="blog_archieve">
                                    {foreach $list as $val}
                                    {if $val['activity_id']!=$activityInfo['activity_id']}
                                    <li><a href="{formatUrl('activity/info?id=')}{$val['activity_id']}"><i class="fa fa-angle-double-right"></i> {$val['activity_title']}</a></li>
                                    {/if}
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
<script type="text/javascript">
$(document).ready(function(){
    $(".blog-content img").width('100%');
})
</script>