{if $twitterusername}
    <h2>{$LANG.twitterlatesttweets}</h2>
    <div id="twitterFeedOutput">
        <p class="text-center"><img src="{$BASE_PATH_IMG}/loading.gif" /></p>
    </div>
    <script type="text/javascript" src="templates/{$template}/js/twitter.js"></script>
{elseif $announcements}

		<div class="card-header">
        <h5><i class="feather icon-inbox"></i> {$LANG.news}</h5>
        </div>
		<div class="card-block">
		{foreach $announcements as $announcement}
        {if $announcement@index < 2}
            <div class="announcement-single">
                <h3 class="homepage-announcement-title">
                <span>
                {$carbon->translatePassedToFormat($announcement.rawDate, 'M jS')}
                </span>
                <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">{$announcement.title}</a>
				 <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="label label-read-more-anononcement">{$LANG.readmore} &raquo;</a>
                </h3>
                {if $announcementsFbRecommend}
                    <script>
                        (function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) {
                                return;
                            }
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));
                    </script>
                    <div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                    <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                {/if}
            </div>
        {/if}
    {/foreach}
	</div>
{/if}
