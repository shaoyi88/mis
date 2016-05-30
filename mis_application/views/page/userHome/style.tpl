<h3>企业风采</h3>
<hr class="thin bg-grayLighter">
{if empty($info)}
<p>未添加企业风采，<a href="{formatUrl('myhome/addCorporate')}">点击添加企业风采</a></p>
{else}
<div>
{$info['enterprise_style']}
</div>
{/if}
<script>

</script>