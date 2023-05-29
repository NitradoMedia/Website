<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="coodiv team (https://themeforest.net/user/coodiv)">
	<link rel="icon" href="{$WEB_ROOT}/templates/{$template}/favicon.ico">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"} 
	{$headoutput}
    </head>
    <body class="body-move body-style-1 {if $loginpage eq 0 and $templatefile ne " clientregister "}full-body-login{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">
    {$headeroutput}
	<!-- {include file="$template/template-parts/demo-panel.tpl"} -->
	<div id="loading-bg"><!-- start loading page -->
	<div class="loading">
	<div class="effect-1 effects"></div>
	<div class="effect-2 effects"></div>
	<div class="effect-3 effects"></div>
	</div>
	<div class="loading-text">{$LANG.loading}</div>
	</div><!-- end loading page -->
	{if $loginpage eq 0 and $templatefile ne "clientregister"}<!-- login and register page without the default header and footer -->
    <nav class="coodiv-navbar">
        <div class="navbar-wrapper">
            <div class="navbar-brand header-logo">
                <a href="{$WEB_ROOT}/index.php" class="the-logo">
                    <img class="logo" src="{$WEB_ROOT}/templates/{$template}/img/logo.png" alt="{$companyname}"><!-- site logo image -->
                    <span class="b-title">{$companyname}</span><!-- website title -->
                </a>
            </div>
            <div class="navbar-content scroll-div">
                <ul class="nav coodiv-inner-navbar">
                    {include file="$template/template-parts/menu.tpl"}<!-- the main menu -->
                </ul>
            </div>
        </div>
    </nav>
    <header class="navbar coodiv-header navbar-expand-lg navbar-light">
        <div class="m-header">
            <a class="mobile-menu" id="mobile-collapse1" href="javascript:"><span></span></a>
            <a href="{$WEB_ROOT}/index.php" class="the-logo">
                    <img class="logo" src="{$WEB_ROOT}/templates/{$template}/img/logo.png" alt="{$companyname}"><!-- site logo image -->
                    <span class="b-title">{$companyname}</span><!-- website title -->
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li><a class="mobile-menu" id="mobile-collapse"><span></span></a></li>
                {include file="$template/template-parts/search.tpl"}<!-- search bar -->
            </ul>
            <ul class="navbar-nav ml-auto">
            {if $languagechangeenabled && count($locales) > 1}
			{include file="$template/template-parts/language.tpl"}<!-- language selector -->
			{/if}
			{include file="$template/template-parts/cart.tpl"}<!-- shopping cart -->
			{include file="$template/template-parts/notifications.tpl"}<!-- the notifications -->
			{include file="$template/template-parts/login.tpl"}<!-- account informations -->
            </ul>
        </div>
    </header>
    <div class="header-hight-fixed"></div>
    <div class="coodiv-main-container">
        <div class="coodiv-wrapper">
            <div class="coodiv-content">
                <div class="coodiv-inner-content">
                    <div class="main-body">
                        <div class="page-wrapper">
					
                            {if $templatefile == 'homepage'} 
							{if $registerdomainenabled || $transferdomainenabled}
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="domain-chaker-homepage" method="post" action="domainchecker.php">
                                        <h5>{$LANG.homebegin}<span>{$LANG.exampledomain}</span></h5>
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="domain" placeholder="{$LANG.exampledomain}" autocapitalize="none" />
                                            <span class="input-group-btn">
						                    <button type="submit" class="btn search" value="{$LANG.domainsregister}"><i class="fas fa-shopping-cart"></i><span>{$LANG.domainsregister}</span></button>
						                    <button type="submit" name="transfer" class="btn transfer" value="{$LANG.domainstransfer}"><i class="fas fa-exchange-alt"></i><span>{$LANG.domainstransfer}</span></button>
						                    </span>
                                        </div>
                                    </form>
                                </div>
                            </div>
							{/if}
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card daily-sales">
                                        <div class="card-header">
                                            <h5><i class="feather icon-box"></i>{$LANG.howcanwehelp}</h5>
                                        </div>
                                        <div class="card-block">
                                            <div class="row how-can-help-box-container">
                                                {if $registerdomainenabled || $transferdomainenabled}
                                                <div class="col-md-3 how-can-help-box">
                                                    <div class="how-can-help-box-icon">
                                                    <i class="flaticon-020-gold-ingot"></i>
                                                    </div>
                                                    <span class="the-title">{$LANG.buyadomain}</span>
                                                    <p class="the-text">{$LANG.cartdomainsconfigdesc}</p>
                                                    <a href="domainchecker.php" class="btn btn-how-can-help-box">{$LANG.domainsregister}</a>
                                                </div>
                                                {/if}
                                                <div class="col-md-3 how-can-help-box {if !$registerdomainenabled || !$transferdomainenabled}col-md-offset-1{/if}">
                                                    <div class="how-can-help-box-icon">
                                                        <i class="flaticon-028-coin-1"></i>
                                                    </div>
                                                    <span class="the-title">{$LANG.orderhosting}</span>
                                                    <p class="the-text">{$LANG.cloudSlider.feature01DescriptionTwo}</p>
                                                    <a href="cart.php" class="btn btn-how-can-help-box">{$LANG.ordertitle}</a>
                                                </div>
                                                <div class="col-md-3 how-can-help-box">
                                                    <div class="how-can-help-box-icon">
                                                        <i class="flaticon-034-credit-card-1"></i>
                                                    </div>
                                                    <span class="the-title">{$LANG.makepayment}</span>
                                                    <p class="the-text">{$LANG.masspaydescription}</p>
                                                    <a href="clientarea.php" class="btn btn-how-can-help-box">{$LANG.invoicespaynow}</a>
                                                </div>
                                                <div class="col-md-3 how-can-help-box">
                                                    <div class="how-can-help-box-icon">
                                                        <i class="flaticon-008-idea"></i>
                                                    </div>
                                                    <span class="the-title">{$LANG.getsupport}</span>
                                                    <p class="the-text">{$LANG.cloudSlider.feature02DescriptionTwo}</p>
                                                    <a href="submitticket.php" class="btn btn-how-can-help-box">{$LANG.supportticketspagetitle}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/if} 
							{include file="$template/includes/validateuser.tpl"}
							{include file="$template/includes/verifyemail.tpl"}
                            <section id="main-body">
                                <div class="{if $skipMainBodyContainer}-fluid without-padding{/if}">
                                    <div class="row">
                                        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())} {if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
                                        <div class="col-md-12">
                                            {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
                                        </div>
                                        {/if} 
										{/if}<!-- Container for main page display content -->
                                        <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-12{else}col-xs-12{/if} main-content">
                                            {if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
											{include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=false}
											{/if} 
											{/if}<!-- login and register page without the default header and footer -->
                                            