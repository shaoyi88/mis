        <div class="main-content clear-float" style="width:960px;">
            <div class="tile-area no-padding">
                <div class="tile-group no-margin no-padding" style="width: 100%">
                    <div class="ol-transparent" style="float: right;width:310px; ">
						<div class="panel">
						    <div class="heading bg-taupe">
						        <span class="title">{date('Y年m月d日')}&nbsp;星期{$week[date('w')]}</span>
						    </div>
						    <div class="content">
						        <div class="middle" style="float:left;width:80px;">
						        <img src="/public/page/images/cond/{$weatherNow['cond']['code']}.png" width="70">
						        </div>
						        <div style="float:left;">
						        <p>{$weatherNow['cond']['txt']}</p>
						        <p>当前温度{$weatherNow['tmp']}°，相对湿度{$weatherNow['hum']}%</p>
						        </div>
						        <div class="clear-float"></div>
						    </div>
						</div>
					    <div class="panel">
						    <div class="heading bg-teal">
						        <span class="icon mif-apps bg-taupe"></span>
						        <span class="title">办事大厅</span>
						    </div>
						    <div class="content bg-white">
								<div class="tile" style="width:143px;" onclick="location.href='{formatUrl('officehall/application')}'">
								    <div class="tile-content iconic">
								        <span class="tile-label">入驻申请</span>
								        <span class="icon mif-enter"></span>
								    </div>
								</div>
								<div class="tile" style="width:143px;" onclick="location.href='{formatUrl('officehall/property')}'">
								    <div class="tile-content iconic">
								        <span class="tile-label">物业相关</span>
								        <span class="icon mif-wrench"></span>
								    </div>
								</div>
								<div class="tile" style="width:143px;" onclick="location.href='{formatUrl('officehall/resource')}'">
								    <div class="tile-content iconic">
								        <span class="tile-label">公共资源</span>
								        <span class="icon mif-palette"></span>
								    </div>
								</div>
								<div class="tile" style="width:143px;" onclick="location.href='{formatUrl('officehall/invest')}'">
								    <div class="tile-content iconic">
								        <span class="tile-label">投资申请</span>
								        <span class="icon mif-coins"></span>
								    </div>
								</div>
								<div class="tile" style="width:143px;" onclick="location.href='{formatUrl('officehall/project')}'">
								    <div class="tile-content iconic">
								        <span class="tile-label">项目需求</span>
								        <span class="icon mif-filter"></span>
								    </div>
								</div>
								<div class="tile" style="width:143px;" onclick="location.href='{formatUrl('officehall/')}'">
								    <div class="tile-content iconic">
								        <span class="tile-label">更多</span>
								        <span class="icon mif-more-horiz"></span>
								    </div>
								</div>
								<div class="clear-float"></div>
						    </div>
						</div>                        
                    </div> 
                    <div class="tile-large ol-transparent" data-role="tile">
                        <div class="tile-content">
                            <div class="carousel" data-role="carousel" data-height="100%" data-width="100%" data-controls="false">
                                <div class="slide">
                                    <img src="/public/page/images/rycenter1.jpg" data-role="fitImage" data-format="fill">
                                </div>
                                <div class="slide">
                                    <img src="/public/page/images/rycenter2.jpg"  data-role="fitImage" data-format="fill">
                                </div>
                                <div class="slide">
                                    <img src="/public/page/images/rycenter3.jpg"  data-role="fitImage" data-format="fill">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tile bg-red fg-white" data-role="tile" onclick="window.open('http://www.ry168.cn');">
                        <div class="tile-content iconic">
                            <p style="text-align:center;">融易集团</p>
                            <span class="icon mif-home"></span>
                        </div>
                    </div>
                    <div class="tile bg-darkOrange fg-white" data-role="tile" onclick="location.href='{formatUrl('incubator')}'">
                        <div class="tile-content iconic">
                            <p style="text-align:center;">孵化器</p>
                            <span class="icon mif-location-city"></span>
                        </div>
                    </div>
                    <div class="tile bg-teal fg-white" data-role="tile" onclick="location.href='{formatUrl('maker')}'">
                        <div class="tile-content iconic">
                            <p style="text-align:center;">易创客</p>
                            <span class="icon mif-library"></span>
                        </div>
                    </div>
                    <div class="tile bg-green fg-white" data-role="tile" onclick="location.href='{formatUrl('club')}'">
                        <div class="tile-content iconic">
                            <p style="text-align:center;">投资人俱乐部</p>
                            <span class="icon mif-organization"></span>
                        </div>
                    </div>

                    <div class="tile-big tile-wide-y bg-white" data-role="tile" style="height:320px; ">
                        <div class="tile-content">
                            <div class="panel" style="height: 100%">
                                <div class="heading bg-darkRed fg-white"><span class="title text-light">园区新闻</span></div>
                                <div class="content fg-dark clear-float" style="height: 100%">
                                    <img src="/public/page/images/rynew1.jpg" class="place-left margin10" style="height: 230px">
                                    <h3 class="text-light">济宁开发区领导团莅临参观融易大厦</h3>
                                    <p>2016年1月15日山东省济宁市经济开发区管委会主任杜强、副主任贾庆华、济宁市城投集团董市长田海臣、软通动力副总裁陈志明等一行9人来访融易集团并参观松山湖高新区。</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tile tile-wide-y bg-olive" data-role="tile" style="height:320px; ">
                        <div class="tile-content">
                            <div class="panel">
                                <div class="heading bg-taupe fg-white"><span class="title text-light">今日活动</span></div>
                                <div class="content bg-olive fg-white clear-float">
                                    <img src="/public/page/images/today_activity.jpg" class="">
                                    <strong>东莞投资人座谈会</strong><br/> 
                                                                        时间：{date('m-d')} 19:00<br/>
                                                                        地点：融易大厦3楼咖啡厅<br/>
                                                                        嘉宾：XX集团董事长、XX公司副总裁、XX投资总监                                                                         
                                </div>
                            </div>
                        </div>
                    </div>                  
                </div>              
                <div class="clear-float"></div>
                <h3 class="fg-darkRed text-light margin5"><span class="mif-quote mif-2x" style="vertical-align: top !important;"></span>企业风采</h3>
                <div class="tile-group no-margin no-padding" style="width: 100%;">
                    <div class="tile-large ol-transparent" data-role="tile">
						<div class="tile-content slide-left">
					        <div class="slide">
					            <img src="/public/page/images/qyfc/001.jpg" data-role="fitImage" data-format="fill">
					        </div>
					        <div class="slide-over op-taupe text-small fg-white padding10">
					                        企业风采展示
					        </div>
					    </div>
                    </div>
                    <div class="tile-wide ol-transparent" data-role="tile">
                        <div class="tile-content slide-down">
					        <div class="slide">
					            <img src="/public/page/images/qyfc/008.jpg" data-role="fitImage" data-format="fill">
					        </div>
					        <div class="slide-over op-taupe text-small fg-white padding10">
					                        企业风采展示
					        </div>
					    </div>
                    </div>
                    <div class="tile ol-transparent" data-role="tile" data-effect="slideUp">
                        <div class="tile-content">
                            <div class="live-slide"><img src="/public/page/images/qyfc/003.jpg" data-role="fitImage" data-format="fill"></div>
                            <div class="live-slide"><img src="/public/page/images/qyfc/004.jpg" data-role="fitImage" data-format="fill"></div>
                        </div>
                    </div>
                    <div class="tile ol-transparent" data-role="tile" data-effect="slideDown">
                        <div class="tile-content">
	                        <div class="live-slide"><img src="/public/page/images/qyfc/005.jpg" data-role="fitImage" data-format="fill"></div>
	                        <div class="live-slide"><img src="/public/page/images/qyfc/006.jpg" data-role="fitImage" data-format="fill"></div>
                        </div>
                    </div>
                    <div class="tile ol-transparent" data-role="tile" data-effect="slideLeft">
                        <div class="tile-content">
	                        <div class="live-slide"><img src="/public/page/images/qyfc/007.jpg" data-role="fitImage" data-format="fill"></div>
	                        <div class="live-slide"><img src="/public/page/images/qyfc/009.jpg" data-role="fitImage" data-format="fill"></div>
                        </div>
                    </div>
                    <div class="tile ol-transparent" data-role="tile" data-effect="slideRight">
                        <div class="tile-content">
	                        <div class="live-slide"><img src="/public/page/images/qyfc/010.jpg" data-role="fitImage" data-format="fill"></div>
	                        <div class="live-slide"><img src="/public/page/images/qyfc/011.jpg" data-role="fitImage" data-format="fill"></div>
                        </div>
                    </div>
                    <div class="tile-wide ol-transparent" data-role="tile">
                        <div class="tile-content slide-down">
					        <div class="slide">
					            <img src="/public/page/images/qyfc/002.jpg" data-role="fitImage" data-format="fill">
					        </div>
					        <div class="slide-over op-taupe text-small fg-white padding10">
					                        企业风采展示
					        </div>
					    </div>
                    </div>
                </div>
            </div>
        </div>