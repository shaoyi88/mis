    <section id="main-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">

                <div class="item active" style="background-image: url(/public/new/images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">融汇天下，易生万物</h1>
                                    <h2 class="animation animated-item-2">打造投融资+产业孵化生态育成加速平台...</h2>
                                    <a class="btn-slide animation animated-item-3" href="{formatUrl('home/zs')}">更多介绍</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(/public/new/images/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">专业的孵化器运营管理团队</h1>
                                    <h2 class="animation animated-item-2">未来3-5年将管理10个科技孵化园，产生1000个以上可投资项目，打造“资本-产业-人才-服务-投资”的国际创新孵化器服务模式...</h2>
                                    <a class="btn-slide animation animated-item-3" href="{formatUrl('home/zs')}">更多介绍</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="item" style="background-image: url(/public/new/images/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">为企业提供最舒适的工作环境</h1>
                                    <h2 class="animation animated-item-2">现有多功能会议厅、多功能展馆、人才餐厅、订制式 VIP 会所、金融中介机构、 商务休闲等功能配套，能有效满足入驻企业办公及商务之专属需求...</h2>
                                    <a class="btn-slide animation animated-item-3" href="{formatUrl('home/zs')}">更多介绍</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>园区服务</h2>
                <p class="lead">入驻申请、物业相关服务、公共资源和企业服务</p>
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap" onclick="location.href='{formatUrl('officehall/application')}'">
                            <i class="fa fa-leaf"></i>
                            <h2>入驻申请</h2>
                            <h3>园区企业在入住园区前必须办理的手续</h3>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap" onclick="location.href='{formatUrl('officehall/property')}'">
                            <i class="fa fa-comments"></i>
                            <h2>物业</h2>
                            <h3>含报修、投诉、需求等物业服务</h3>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap" onclick="location.href='{formatUrl('officehall/resource')}'">
                            <i class="fa fa-cogs"></i>
                            <h2>公共资源</h2>
                            <h3>多功能厅和VIP室申请</h3>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap" onclick="location.href='{formatUrl('officehall/invest')}'">
                            <i class="fa fa-money"></i>
                            <h2>投资申请</h2>
                            <h3>企业项目投资申请</h3>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap" onclick="location.href='{formatUrl('officehall/project')}'">
                            <i class="fa fa-heart"></i>
                            <h2>企业需求</h2>
                            <h3>企业注册、工商财税、政策法律、专利知识产权服务</h3>
                        </div>
                    </div>
             
                </div>
            </div>    
        </div>
    </section>
    
    <section id="content">
        <div class="container">
        <h2>园区新闻</h2>
            <div class="row">
                <div class="col-xs-12 col-sm-8 wow fadeInDown">
                   <div class="tab-wrap"> 
                        <div class="media">
                            <div class="parrent pull-left">
                                <ul class="nav nav-tabs nav-stacked">
                                    {foreach $articleList as $k=>$v}
                                    <li class="{if $k==0}active{/if}"><a href="#tab{$k+1}" data-toggle="tab" class="{if $k==0}analistic-02{else}tehnical{/if}">{mb_substr($v['article_title'],0,17)}</a></li>
                                    {/foreach}
                                </ul>
                            </div>

                            <div class="parrent media-body">
                                <div class="tab-content">
                                
                                    {foreach $articleList as $k=>$v}
                                    <div class="tab-pane fade{if $k==0} active in{/if}" id="tab{$k+1}">
                                        <div class="media">
                                           <div class="pull-left">
                                                <input type="hidden" value="{preg_match_all($pattern,$v['article_content'],$match)}">
                                                <img class="img-responsive" src="{if isset($match[1])&&!empty($match[1])}{$match[1][0]}{else}/public/new/images/news.jpg{/if}" width="204">
                                            </div>
                                            <div class="media-body">
                                                 <h4>{$v['article_title']}</h4>
                                                 <p>{mb_substr(strip_tags(preg_replace("/<img.+?\/>/", "", $v['article_content'])),0,90)}...[<a href="{formatUrl('article/info?id=')}{$v['article_id']}">详情</a>]</p>
                                            </div>
                                        </div>
                                    </div>
                                    {/foreach}
                                     
                                </div> 
                            </div> 
                        </div>     
                    </div>              
                </div>

                <div class="col-xs-12 col-sm-4 wow fadeInDown">
                    <div class="testimonial">
                        <h2>产业集群</h2>
                         <div class="media testimonial-inner">
                            <div class="pull-left">
                                <img class="img-responsive img-circle" src="/public/new/images/wlw.jpg">
                            </div>
                            <div class="media-body">
                                <p>智能设备研发、电子信息服务平台、大数据网络运营平台、国际物联网O2O服务平台，智能家居、智能交通、智慧医疗服务平台、智慧城市等领域。</p>
                                <span><strong>-物联网</strong>智能装备&云产业</span>
                            </div>
                         </div>

                         <div class="media testimonial-inner">
                            <div class="pull-left">
                                <img class="img-responsive img-circle" src="/public/new/images/djk.jpg">
                            </div>
                            <div class="media-body">
                                <p>医药研发、互联网医疗、保健产品平台、医疗用品、医疗器械、健康管理、健康咨询、中医保健、养老产业等领域。</p>
                                <span><strong>-大健康</strong>生物医药技术产业</span>
                            </div>
                         </div>

                    </div>
                </div>

            </div>
        </div>
    </section>
    
    <section id="recent-works" style="padding:10px 0;">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2>园区风采</h2>
            </div>
            <div class="row">
                {section name=loop loop=8} 
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="/public/new/images/portfolio/recent/item{$smarty.section.loop.index+1}.jpg" alt="">
                        <a class="preview" href="/public/new/images/portfolio/full/item{$smarty.section.loop.index+1}.jpg" rel="prettyPhoto">
                        <div class="overlay">                          
                            <div class="recent-work-inner">
                                <h3>&nbsp;</h3>
                                <p>&nbsp;</p>
                                <i class="fa fa-eye"></i> 查看
                            </div>                            
                        </div>
                        </a>
                    </div>
                </div>
                {/section}       
            </div>
        </div>
    </section>
    
    <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 wow fadeInDown">
                    <div class="skill">
                        <h2>活动因子</h2>
                        <p>累计活动主题，涉及内容统计</p>

                        <div class="progress-wrap">
                            <h3>互联网</h3>
                            <div class="progress">
                              <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                <span class="bar-width">85%</span>
                              </div>

                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>制造业</h3>
                            <div class="progress">
                              <div class="progress-bar color2" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                               <span class="bar-width">45%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>物联网</h3>
                            <div class="progress">
                              <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                <span class="bar-width">80%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>大健康</h3>
                            <div class="progress">
                              <div class="progress-bar color4" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                <span class="bar-width">90%</span>
                              </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-sm-6 wow fadeInDown">
                    <div class="accordion">
                        <h2>最新活动</h2>
                        <div class="panel-group" id="accordion1">
                          <div class="panel panel-default">
                            <div class="panel-heading active">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                                                    智能制造与产业投融资高峰论坛
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>

                            <div id="collapseOne1" class="panel-collapse collapse in">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="/public/new/images/accordion1.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>2016-07-29</h4>
                                             <p>地点：2楼多功能会议厅<br/>嘉宾：刘晓星、何国清、陈广学<br/>已结束</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                                                    融易·草根天使会创业交流会
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseTwo1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="/public/new/images/accordion2.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>2016-07-20</h4>
                                             <p>地点：2楼VIP室<br/>嘉宾：草根天使会会长<br/>已结束</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                                                    互联网产业升级交流会
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseThree1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="/public/new/images/accordion3.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>2016-07-19</h4>
                                             <p>地点：2楼VIP室<br/>嘉宾：互联网协会副会长<br/>已结束</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
                                                                     松山湖企业家协会交流座谈会
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseFour1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="/public/new/images/accordion4.jpg">
                                        </div>
                                        <div class="media-body">
                                             <h4>2016-07-16</h4>
                                             <p>地点：19楼茶室<br/>嘉宾：企业家协会副会长<br/>已结束</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>  
    
    <section id="bottom" style="border-bottom:0;">
        <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="center wow fadeInDown">
                <h2>已入驻企业</h2>
                <p class="lead"></p>
            </div> 
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <ul>
                            <li>{if $ename[0]['enterprise_web']}<a href="http://{$ename[0]['enterprise_web']}">{$ename[0]['enterprise_name']}</a>{else}{$ename[0]['enterprise_name']}{/if}</li>
                            <li>{if $ename[1]['enterprise_web']}<a href="http://{$ename[1]['enterprise_web']}">{$ename[1]['enterprise_name']}</a>{else}{$ename[1]['enterprise_name']}{/if}</li>
                            <li>{if $ename[2]['enterprise_web']}<a href="http://{$ename[2]['enterprise_web']}">{$ename[2]['enterprise_name']}</a>{else}{$ename[2]['enterprise_name']}{/if}</li>
                            <li>{if $ename[3]['enterprise_web']}<a href="http://{$ename[3]['enterprise_web']}">{$ename[3]['enterprise_name']}</a>{else}{$ename[3]['enterprise_name']}{/if}</li>
                            <li>{if $ename[4]['enterprise_web']}<a href="http://{$ename[4]['enterprise_web']}">{$ename[4]['enterprise_name']}</a>{else}{$ename[4]['enterprise_name']}{/if}</li>
                        </ul>
                    </div>    
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <ul>
                            <li>{if $ename[5]['enterprise_web']}<a href="http://{$ename[5]['enterprise_web']}">{$ename[5]['enterprise_name']}</a>{else}{$ename[5]['enterprise_name']}{/if}</li>
                            <li>{if $ename[6]['enterprise_web']}<a href="http://{$ename[6]['enterprise_web']}">{$ename[6]['enterprise_name']}</a>{else}{$ename[6]['enterprise_name']}{/if}</li>
                            <li>{if $ename[7]['enterprise_web']}<a href="http://{$ename[7]['enterprise_web']}">{$ename[7]['enterprise_name']}</a>{else}{$ename[7]['enterprise_name']}{/if}</li>
                            <li>{if $ename[8]['enterprise_web']}<a href="http://{$ename[8]['enterprise_web']}">{$ename[8]['enterprise_name']}</a>{else}{$ename[8]['enterprise_name']}{/if}</li>
                            <li>{if $ename[9]['enterprise_web']}<a href="http://{$ename[9]['enterprise_web']}">{$ename[9]['enterprise_name']}</a>{else}{$ename[9]['enterprise_name']}{/if}</li>
                        </ul>
                    </div>    
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <ul>
                            <li>{if $ename[10]['enterprise_web']}<a href="http://{$ename[10]['enterprise_web']}">{$ename[10]['enterprise_name']}</a>{else}{$ename[10]['enterprise_name']}{/if}</li>
                            <li>{if $ename[11]['enterprise_web']}<a href="http://{$ename[11]['enterprise_web']}">{$ename[11]['enterprise_name']}</a>{else}{$ename[11]['enterprise_name']}{/if}</li>
                            <li>{if $ename[12]['enterprise_web']}<a href="http://{$ename[12]['enterprise_web']}">{$ename[12]['enterprise_name']}</a>{else}{$ename[12]['enterprise_name']}{/if}</li>
                            <li>{if $ename[13]['enterprise_web']}<a href="http://{$ename[13]['enterprise_web']}">{$ename[13]['enterprise_name']}</a>{else}{$ename[13]['enterprise_name']}{/if}</li>
                            <li>{if $ename[14]['enterprise_web']}<a href="http://{$ename[14]['enterprise_web']}">{$ename[14]['enterprise_name']}</a>{else}{$ename[14]['enterprise_name']}{/if}</li>
                        </ul>
                    </div>    
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <ul>
                            <li>{if $ename[15]['enterprise_web']}<a href="http://{$ename[15]['enterprise_web']}">{$ename[15]['enterprise_name']}</a>{else}{$ename[15]['enterprise_name']}{/if}</li>
                            <li>{if $ename[16]['enterprise_web']}<a href="http://{$ename[16]['enterprise_web']}">{$ename[16]['enterprise_name']}</a>{else}{$ename[16]['enterprise_name']}{/if}</li>
                            <li>{if $ename[17]['enterprise_web']}<a href="http://{$ename[17]['enterprise_web']}">{$ename[17]['enterprise_name']}</a>{else}{$ename[17]['enterprise_name']}{/if}</li>
                            <li>{if $ename[18]['enterprise_web']}<a href="http://{$ename[18]['enterprise_web']}">{$ename[18]['enterprise_name']}</a>{else}{$ename[18]['enterprise_name']}{/if}</li>
                            <li>{if $ename[19]['enterprise_web']}<a href="http://{$ename[19]['enterprise_web']}">{$ename[19]['enterprise_name']}</a>{else}{$ename[19]['enterprise_name']}{/if}</li>
                        </ul>
                    </div>    
                </div>
            </div>
        </div>
    </section>

    <section style="padding:10px 0;"></section>