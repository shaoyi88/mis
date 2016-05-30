<style>

.tile-group {
    left: 100px;
}

.tile, .tile-small, .tile-sqaure, .tile-wide, .tile-large, .tile-big, .tile-super {
    opacity: 0;
    -webkit-transform: scale(.8);
    transform: scale(.8);
}

#charmSettings .button {
    margin: 5px;
}

.schemeButtons {
    /*width: 300px;*/
}

@media screen and (max-width: 640px) {
    .tile-area {
        overflow-y: scroll;
    }
}

@media screen and (max-width: 320px) {
    .tile-area {
        overflow-y: scroll;
    }

}
.tile-area-scheme-dark {
    background-color: #eee;
}
.tile-area {
    min-width: 100%;
    height: 100%;
    position: relative;
    padding: 20px 0 0 0;
    overflow: hidden;
}
.tile-group {
    margin-left: 30px;
    min-width: 80px;
    width: auto;
    float: left;
    display: block;
    padding-top: 40px;
    position: relative;
}

</style>
<script src="/public/page/js/maker.js"></script>
    <div>
        <div class="place-right" style="width:265px;">
            <img src="/public/page/images/maker/immaker.png" width="265">
        </div>
        <div class="place-left" style="width:680px;">
        <h3>“易创客”众创空间</h3>
        <p>易创客”众创空间的核心价值不在于办公场地的提供，而是在于其提供的辅助创业创新的服务，向创业者提供各种类别、不同程度的服务。这些服务包括但不限于：综合服务、商务财税服务、市场服务、活动策划服务、政策信息服务、法律服务、知识产权服务、投融资服务等等。此外，帮助初创企业或项目团队进行奖励、补贴的政策申请，还通过与第三方合作的方式提供服务等</p>
        <button class="button primary" onclick="location.href='{formatUrl('maker/info')}'">详情介绍</button>&nbsp;&nbsp;<button class="button primary" onclick="location.href='{formatUrl('maker/mentor')}'">导师团队</button>
        </div>       
    </div>

    <div class="tile-area tile-area-scheme-dark fg-white" style="height: 100%; max-height: 100% !important;">

        <div class="tile-group double">
            <span class="tile-group-title fg-dark">通用</span>

            <div class="tile-container">

                <a href="javascript:" class="tile bg-indigo fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-calendar"></span>
                    </div>
                    <span class="tile-label">日程</span>
                </a>

                <div class="tile bg-darkBlue fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-envelop"></span>
                    </div>
                    <span class="tile-label">备忘</span>
                </div>

                <div class="tile-large bg-steel fg-white" data-role="tile">
                    <div class="tile-content" style="background: top left no-repeat; background-size: cover">
                        <img src="/public/page/images/maker/maker.png" width="310">
                    </div>
                </div>
            </div>
        </div>

        <div class="tile-group double">
            <span class="tile-group-title fg-dark">传媒摄影类</span>
            <div class="tile-container">
                <div class="tile-wide" data-role="tile" data-effect="slideLeft">
                    <div class="tile-content">
                        <a href="javascript:" class="live-slide"><img src="/public/metro/images/1.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="javascript:" class="live-slide"><img src="/public/metro/images/2.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="javascript:" class="live-slide"><img src="/public/metro/images/3.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="javascript:" class="live-slide"><img src="/public/metro/images/4.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="javascript:" class="live-slide"><img src="/public/metro/images/5.jpg" data-role="fitImage" data-format="fill"></a>
                    </div>
                    <div class="tile-label">作品</div>
                </div>
                <div class="tile" data-role="tile" data-role="tile" data-effect="slideUpDown">
                    <div class="tile-content">
                        <div class="live-slide"><img src="/public/metro/images/me.jpg" data-role="fitImage" data-format="fill"></div>
                        <div class="live-slide"><img src="/public/metro/images/spface.jpg" data-role="fitImage" data-format="fill"></div>
                    </div>
                    <div class="tile-label">图集</div>
                </div>
                <div class="tile-small bg-amber fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-video-camera"></span>
                    </div>
                </div>
                <div class="tile-small bg-green fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-gamepad"></span>
                    </div>
                </div>
                <div class="tile-small bg-pink fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-headphones"></span>
                    </div>
                </div>
                <div class="tile-small bg-yellow fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-lock"></span>
                    </div>
                </div>

                <div class="tile-wide bg-orange fg-white" data-role="tile">
                    <div class="tile-content image-set">
                        <img src="/public/metro/images/jeki_chan.jpg">
                        <img src="/public/metro/images/shvarcenegger.jpg">
                        <img src="/public/metro/images/vin_d.jpg">
                        <img src="/public/metro/images/jolie.jpg">
                        <img src="/public/metro/images/jek_vorobey.jpg">
                    </div>
                </div>

            </div>
        </div>

        <div class="tile-group one">
            <span class="tile-group-title fg-dark">写作类</span>

            <div class="tile-small bg-blue" data-role="tile">
                <div class="tile-content iconic">
                    <img src="/public/metro/images/outlook.png" class="icon">
                </div>
            </div>
            <div class="tile-small bg-darkBlue" data-role="tile">
                <div class="tile-content iconic">
                    <img src="/public/metro/images/word.png" class="icon">
                </div>
            </div>
            <div class="tile-small bg-green" data-role="tile">
                <div class="tile-content iconic">
                    <img src="/public/metro/images/excel.png" class="icon">
                </div>
            </div>
            <div class="tile-small bg-red" data-role="tile">
                <div class="tile-content iconic">
                    <img src="/public/metro/images/access.png" class="icon">
                </div>
            </div>
            <div class="tile-small bg-orange" data-role="tile">
                <div class="tile-content iconic">
                    <img src="/public/metro/images/powerpoint.png" class="icon">
                </div>
            </div>
            <div class="tile-small bg-taupe" data-role="tile">
                <div class="tile-content iconic">
                    <img src="/public/metro/images/onenote.png" class="icon">
                </div>
            </div>
            <div class="tile-small bg-cobalt" data-role="tile">
                <div class="tile-content iconic">
                    <img src="/public/metro/images/Blank_Folder.png" class="icon">
                </div>
            </div>
        </div>

        <div class="tile-group double">
            <span class="tile-group-title fg-dark">网络游戏类</span>
            <div class="tile-container">
                <div class="tile" data-role="tile">
                    <div class="tile-content">
                        <img src="/public/metro/images/grid2.jpg" data-role="fitImage" data-format="square">
                    </div>
                </div>
                <div class="tile-small" data-role="tile">
                    <div class="tile-content">
                        <img src="/public/metro/images/Battlefield_4_Icon.png" data-role="fitImage" data-format="square">
                    </div>
                </div>
                <div class="tile-small" data-role="tile">
                    <div class="tile-content">
                        <img src="/public/metro/images/Crysis-2-icon.png" data-role="fitImage" data-format="square" data-frame-color="bg-steel">
                    </div>
                </div>
                <div class="tile-small" data-role="tile">
                    <div class="tile-content">
                        <img src="/public/metro/images/WorldofTanks.png" data-role="fitImage" data-format="square" data-frame-color="bg-dark">
                    </div>
                </div>
                <div class="tile-small" data-role="tile">
                    <div class="tile-content">
                        <img src="/public/metro/images/halo.jpg" data-role="fitImage" data-format="square">
                    </div>
                </div>
                <div class="tile-wide bg-green fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <img src="/public/metro/images/x-box.png" class="icon">
                    </div>
                    <div class="tile-label">X-Box Live</div>
                </div>
            </div>
        </div>

        <div class="tile-group double">
            <span class="tile-group-title fg-dark">其它</span>
            <div class="tile-container">
                <div class="tile bg-teal fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-pencil"></span>
                    </div>
                    <span class="tile-label">记者</span>
                </div>
                <div class="tile bg-darkGreen fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-shopping-basket"></span>
                    </div>
                    <span class="tile-label">电商</span>
                </div>
                <div class="tile bg-cyan fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-skype"></span>
                    </div>
                    <div class="tile-label">社交</div>
                </div>
                <div class="tile bg-darkBlue fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-cloud"></span>
                    </div>
                    <span class="tile-label">云计算</span>
                </div>
            </div>
        </div>
    </div>
    <div class="clear-float"></div>
    <div data-role="dialog" id="s1" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" data-windows-style="true">
	      <h1>“易创客”众创空间</h1>
	      <p style="margin-top:10px;"><b>运营模式</b></p>
	      <p style="margin-top:10px;">模式1：活动聚合</p>
	      <p style="margin-top:10px;">以活动交流为主，定期举办想法或项目的发布、展示、路演等创业活动聚合，增加人气。</p>
	      <p style="margin-top:10px;">周一：头脑风暴；周二：创意沙龙；周三：导师点评；四：项目路演；周五：科技讲座；周六：案例分析</p>
	      <p style="margin-top:10px;">针对初创项目方最急需解决的资金问题，以资本为核心和纽带，聚集融易集团投资部、第三方投资机构，依托其平台吸引汇集优质的创业项目，为创业项目方提供融资服务，从而提升”易创客“价值与创业项目成功率。</p>
	      <p style="margin-top:10px;">进驻众创空间的早期创业者或团队分为三种：</p>
	      <p style="margin-top:10px;">第一种是流动创业者，”易创客“1450平方米的三层公共办公区的预计70%都是这部分创业者；</p>
	      <p style="margin-top:10px;">第二种是常驻团队，预计可以满足30个团队的需求，桌椅和办公位固定，这类团队的人员和项目均比较稳定，流动性小，能够自行维护日常的办公秩序。</p>
	      <p style="margin-top:10px;">第三种是稳定团队，筛选出15个左右团队进行深入跟踪服务，提升服务质量与服务水平。为后期的孵化与投资做前期准备。</p>
	      <p style="margin-top:10px;">这些团队在全国范围内进行招募，加入其会员体系之后，会为团队提供内部的、精准的资源活动分享服务（模式一）。</p>
	      <p style="margin-top:10px;">模式3：综合创业生态服务体系</p>
	      <p style="margin-top:10px;">提供综合型的完整的创业生态体系，包括：</p>
	      <p style="margin-top:10px;">1.0产业园服务：作为物联网与大健康两大产业集群的科技企业载体；形成产业集群发展；打造一站式研发、办公，休闲以及商业配套人文文化。</p>
	      <p style="margin-top:10px;">2.0科技服务：科技成果转化、专利技术、著作权、软件企业、高新技术企业以及科技项目申报辅导等，第三方增值服务支撑，包括研发项目管理培训、政策解读、企业运营管理提升等。</p>
	      <p style="margin-top:10px;">3.0资本资源融合：产业链资源整合、投融资、项目路演、并购重组、上市辅导、创业导师辅导等服务体系。</p>
	      <p style="margin-top:10px;">4.0生态服务：品牌传媒、工业设计、企业VI品牌建设、行业大数据研究等服务体系。人才招聘等公司成长的关键环节，打造完整的创业服务生态圈，帮助初创企业从模式验证到加速成长的演变，目的是促进创业公司快速成长。</p>
	      <p style="margin-top:10px;">通过完整的创业服务体系树立品牌，以吸引更多的优质创业项目入驻，在形成项目数量规模之后，提炼好的项目，完成模式二的筛选和投资需求。</p>
    </div>