<div class="padding20 main-content clear-float" style="width:960px;">
            <div class="tile-area no-padding">
                <div class="tile-group no-margin no-padding" style="width: 100%">
                <div class="ol-transparent" style="float: left;">
                <div class="tile" style="width:280px;height:400px;">
				    <div class="tile-content iconic">
				        <h1 style="text-align:center;">办事大厅</h1>
				        <span class="icon mif-apps"></span>
				    </div>
				</div>
                </div>
                <div class="ol-transparent" style="float: right; width:620px;">
			    <div class="tile" style="width:196px;height:196px;" onclick="location.href='{formatUrl('officehall/application')}'">
				    <div class="tile-content iconic">
				        <span class="tile-label">入驻申请</span>
				        <span class="icon mif-enter"></span>
				    </div>
				</div>
				{if $info['user_second_type']==2}
				<div class="tile" style="width:196px;height:196px;" onclick="location.href='{formatUrl('officehall/property')}'">
				    <div class="tile-content iconic">
				        <span class="tile-label">物业相关</span>
				        <span class="icon mif-wrench"></span>
				    </div>
				</div>
				<div class="tile" style="width:196px;height:196px;" onclick="location.href='{formatUrl('officehall/resource')}'">
				    <div class="tile-content iconic">
				        <span class="tile-label">公共资源</span>
				        <span class="icon mif-palette"></span>
				    </div>
				</div>
				<div class="tile" style="width:196px;height:196px;" onclick="location.href='{formatUrl('officehall/invest')}'">
				    <div class="tile-content iconic">
				        <span class="tile-label">投资申请</span>
				        <span class="icon mif-coins"></span>
				    </div>
				</div>	
				{/if}					
				<div class="tile" style="width:196px;height:196px;" onclick="location.href='{formatUrl('officehall/project')}'">
				    <div class="tile-content iconic">
				        <span class="tile-label">项目需求</span>
				        <span class="icon mif-filter"></span>
				    </div>
				</div>
				<div class="tile" style="width:196px;height:196px;" onclick="location.href='{formatUrl('officehall/form')}'">
				    <div class="tile-content iconic">
				        <span class="tile-label">表格下载</span>
				        <span class="icon mif-files-empty"></span>
				    </div>
				</div>			
				</div>
				</div>
			</div>
</div>