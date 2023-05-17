<li class="width-s-none-display">
    <div class="dropdown">
        <a class="dropdown-toggle f-15" href="#" data-toggle="dropdown"><i class="icon feather icon-bell"></i>{if count($clientAlerts) > 0}<div class="dotted-animation"><span class="animate-circle"></span><span class="main-circle"></span></div>{/if}</a>
        <div class="dropdown-menu dropdown-menu-right notification">
            <div class="noti-head">
                <h6 class="d-inline-block m-b-0">{$LANG.notifications}</h6>
                <div class="float-right">
                <span class="notification-number">{if count($clientAlerts) > 0}{$LANG.notificationsnew}{else}0{/if}</span>
                </div>
            </div>
            <div class="noti-body">
			{if count($clientAlerts) > 0}
			<ul class="client-alerts">
            {foreach $clientAlerts as $alert}
            <li><a href="{$alert->getLink()}">
		    <i class="feather icon-{if $alert->getSeverity() == 'danger'}help-circle{elseif $alert->getSeverity() == 'warning'}alert-octagon{elseif $alert->getSeverity() == 'info'}info{else}check-circle{/if}"></i>
			<div class="message">{$alert->getMessage()}</div>
			</a></li>
            {/foreach}
            </ul>
			{else}
            <span class="alert alert-danger notification-alert">{$LANG.notificationsnone}</span>
            {/if}			
            </div>
            <div class="noti-footer">
            <a href="clientarea.php">{$LANG.domainRenewal.showAll}</a>
            </div>
        </div>
    </div>
</li>  