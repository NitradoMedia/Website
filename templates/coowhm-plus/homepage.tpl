<div class="container-fluid main-fluid">
{if $twitterusername}
	
	<div class="row padding-100-0-0">
		<div class="col-md-12">
			<div class="main-title center-text">
                <h6>{$LANG.announcementsdescription}</h6>
                <h2>{$LANG.twitterlatesttweets}</h2>
            </div>
		</div>
	</div>
	
	
    <div id="twitterFeedOutput">
        <p class="text-center"><img src="{$BASE_PATH_IMG}/loading.gif" /></p>
    </div>
    <script type="text/javascript" src="templates/{$template}/js/twitter.js"></script>
{elseif $announcements}

	<div class="row padding-100-0-0">
		<div class="col-md-12">
			<div class="main-title center-text">
                <h6>{$LANG.announcementsdescription}</h6>
                <h2>{$LANG.latestannouncements}</h2>
            </div>
		</div>
	</div>
					
	<div class="row justify-content-left">
	{foreach $announcements as $announcement}
	{if $announcement@index < 3}
		<div class="col-md-4">
			<div class="our-latest-news-box wow fadeIn" data-wow-delay="0">
					<h5>{$announcement.title}</h5>
					<p>{$announcement.summary}</p>

				<div class="our-latest-news-box-footer">
					<span>{$carbon->translatePassedToFormat($announcement.rawDate, 'M jS')}</span>
					<a data-toggle="tooltip" data-placement="left" title="" data-original-title="{$LANG.readmore}" href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}"><i class="feather icon-eye"></i></a>
				</div>
				{include file="$template/template-parts/blog-loader.tpl"}
			</div>
		</div>
	{/if}
	{/foreach}				
	</div>

{/if}
{if $language eq 'arabic'}
{include file="$template/template-parts/elements/rtl-elements/homepage-discount.tpl"}
{else}
{include file="$template/template-parts/elements/homepage-discount.tpl"}
{/if}
</div>