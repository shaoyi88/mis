<div class="hallb"><span class="icon mif-apps fg-cyan"></span>&nbsp;<a href="{formatUrl('article/info?id=')}{$articleInfo['article_id']}">文章列表</a>&nbsp;>&nbsp;<span class="icon mif-file-text"></span>&nbsp;文章详情</div>
<div class="articleList" style="min-height:500px;margin-top:30px;">
    {if empty($articleInfo)}
    <div class="articleArea">
        <p>该文章不存在</p>
    </div>
    {else}
    <h2>{$articleInfo["article_title"]}</h2>
    <p><span class="fg-grayLight">{date('Y-m-d H:i:s')}</span></p>
    <div class="place-right padding20" style="width:850px;border-top:1px double #dcdcdc;">      
        <div>{$articleInfo["article_content"]}</div>
    </div>
    <div class="place-left" style="width:100px;">
        <div calss="tool" style="position:fixed;top:350px;">
            <p style="cursor:pointer;" title="评论" onclick="location.href='{formatUrl('article/comment?id=')}{$articleInfo['article_id']}'"><span class="icon mif-pencil mif-2x"></span>&nbsp;<span class="fg-darkRed">{$articleCommentCount}</span></p>
        </div>
    </div>
    {/if}
</div>