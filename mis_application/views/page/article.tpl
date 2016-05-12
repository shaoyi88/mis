<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;文章列表&nbsp;</div>
<div class="articleList" style="min-height:500px;">
    {if empty($dataList)}
    <div class="articleArea">
        <p>暂无文章</p>
    </div>
    {else}
    <div class="articleArea">
    <ul>
    {foreach $dataList as $item}
        <li style="line-height:30px;border-bottom:1px dashed #dcdcdc;"><a href="{formatUrl('article/info?id=')}{$item['article_id']}">{$item['article_title']}</a>&nbsp;&nbsp;{date('Y-m-d',$item['add_time'])}</li>
	{/foreach}
	</ul>	
	</div>
    {/if}
    {if isset($pageUrl)}{$pageUrl}{/if}
</div>