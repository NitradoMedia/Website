
<span class="navigation-header"><i>{$LANG.clientareanavservices}</i></span>
<li data-username="Home" class="nav-item">
<a href="{$WEB_ROOT}/index.php" class="nav-link active"><span class="coodiv-micon"><i class="feather icon-home"></i></span><span class="coodiv-mtext">{$LANG.clientareanavhome}</span><span class="template-new-menu">{$LANG.domainCheckerSalesGroup.new}</span></a>
</li>
{if $loggedin}
<li data-username="my services" class="nav-item  coodiv-hasmenu">
<a  class="nav-link"><span class="coodiv-micon"><i class="feather icon-briefcase"></i></span><span class="coodiv-mtext">{$LANG.navservices}</span></a>
<ul class="coodiv-submenu">
<li><a href="{$WEB_ROOT}/clientarea.php?action=services">{$LANG.clientareanavservices}</a></li>
<li><a href="{$WEB_ROOT}/clientarea.php?action=products&module=licensing">{$LANG.licensingaddon.mylicenses}</a></li>
<li><a href="{$WEB_ROOT}/cart.php">{$LANG.navservicesorder}</a></li>
<li><a href="{$WEB_ROOT}/cart.php?gid=addons">{$LANG.clientareaviewaddons}</a></li>
</ul>
</li>
{/if}
<li data-username="store" class="nav-item coodiv-hasmenu">
<a class="nav-link "><span class="coodiv-micon"><i class="feather icon-box"></i></span><span class="coodiv-mtext">{$LANG.navStore}</span></a>
<ul class="coodiv-submenu">

<!-- START All Product navs -->
<li><a href="{$WEB_ROOT}/cart.php">{$LANG.navBrowseProductsServices}</a></li>
<!-- END All Product navs -->

<!-- START Product group navs -->
{foreach from=$productgroups item=productgroup}
<li><a href="{$WEB_ROOT}/cart.php?gid={$productgroup.id}">{$productgroup.name}</a></li>
{/foreach}
	

<!-- START domain register and renewals navs -->
	
<!-- END Product group navs -->


<!-- START Product Addons navs -->
<!-- END Product Addons navs -->


<!-- START domain register and renewals navs -->
	{if $loggedin}
<!--<li><a href="{$WEB_ROOT}/cart.php?gid=renewals">{$LANG.domainrenewals}</a></li>
<!--<li><a href="{$WEB_ROOT}/cart.php?gid=renewals">{$LANG.domainrenewals}</a></li>
<li><a href="{$WEB_ROOT}/cart.php?a=add&domain=register">{$LANG.navregisterdomain}</a></li>
<li><a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">{$LANG.transferinadomain}</a></li>-->
	
<!-- END domain register and renewals navs -->


</ul>
</li>
<li data-username="domains" class="nav-item coodiv-hasmenu">
<a class="nav-link "><span class="coodiv-micon"><i class="feather icon-globe"></i></span><span class="coodiv-mtext">{$LANG.cartproductdomain}</span></a>
<ul class="coodiv-submenu">
<li><a href="{$WEB_ROOT}/clientarea.php?action=domains">{$LANG.clientareanavdomains}</a></li>{/if}

<!-- START domain register and renewals navs -->
<li><a href="{$WEB_ROOT}/cart.php?a=add&domain=register">{$LANG.navregisterdomain}</a></li>
	
<!-- END domain register and renewals navs -->


</ul>
</li>
<li data-username="Home" class="nav-item">
<a href="{$WEB_ROOT}/affiliates.php" class="nav-link"><span class="coodiv-micon"><i class="feather icon-user-plus"></i></span><span class="coodiv-mtext">{$LANG.affiliatestitle}</span></a>
</li>
{if $loggedin}

<li data-username="store" class="nav-item coodiv-hasmenu">
<a class="nav-link "><span class="coodiv-micon"><i class="feather icon-credit-card"></i></span><span class="coodiv-mtext">{$LANG.navbilling}</span></a>
<ul class="coodiv-submenu">
<li><a href="{$WEB_ROOT}/clientarea.php?action=invoices">{$LANG.invoices}</a></li>
<li><a href="{$WEB_ROOT}/clientarea.php?action=quotes">{$LANG.quotestitle}</a></li>
<li><a href="{$WEB_ROOT}/clientarea.php?action=masspay&all=true">{$LANG.masspaytitle}</a></li>
</ul>
</li>
{/if}
<span class="navigation-header"><i>{$LANG.navsupport}</i></span>
<li data-username="support" class="nav-item coodiv-hasmenu">
<a class="nav-link "><span class="coodiv-micon"><i class="feather icon-life-buoy"></i></span><span class="coodiv-mtext">{$LANG.navsupport}</span></a>
<ul class="coodiv-submenu">
<li><a href="{$WEB_ROOT}/supporttickets.php">{$LANG.navtickets}</a></li>
<li><a href="{$WEB_ROOT}/submitticket.php">{$LANG.navopenticket}</a></li>
</ul>
</li>

<li data-username="announcements" class="nav-item coodiv-hasmenu">
<a class="nav-link"><span class="coodiv-micon"><i class="feather icon-file-text"></i></span><span class="coodiv-mtext">{$LANG.announcementstitle}</span> <span class="template-new-menu another-color">{$LANG.domainCheckerSalesGroup.new}</span></a>
<ul class="coodiv-submenu">
<li><a href="{$WEB_ROOT}/announcements.php">{$LANG.announcementstitle}</a></li>
<li><a href="{$WEB_ROOT}/terms.php">{$LANG.ordertos}</a></li>

</ul>
</li>
</li>
</li>
</li>
</li>