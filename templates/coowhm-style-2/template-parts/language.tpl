<li>
<div class="dropdown language-dropdwn">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" >
<img src="{$WEB_ROOT}/templates/{$template}/img/flags/{$language}.svg" class="img-radius-30 img-15 headerflags" alt="{$activeLocale.localisedName}">
</a>
<div class="dropdown-menu dropdown-menu-right notification language-slector-container">
<div class="noti-head">
<h6 class="d-inline-block m-b-0">{$LANG.chooselanguage}</h6>
<div class="float-right">
<a class="cart-items-view">{$activeLocale.localisedName}</a>
</div>
</div>
<ul>
{foreach $locales as $locale}
<li>
<a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a>
</li>
{/foreach}
</ul>
</div>
</div>
</li>
<script>
$('img.headerflags').each(function () {
var sourceName = $(this).attr('src').toLowerCase();
$(this).attr('src', sourceName);
});
</script>