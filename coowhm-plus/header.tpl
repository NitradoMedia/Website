<!DOCTYPE html>
<html lang="en" {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}dir="rtl"{/if}><head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="coodiv team (https://themeforest.net/user/coodiv)">
	<link rel="icon" href="{$WEB_ROOT}/templates/{$template}/favicon.ico">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    
    {include file="$template/includes/head.tpl"} 
	{$headoutput}
    </head>
    <body class="body-move default-version vertical-menu body-style-2 dark-mode {if $loginpage eq 0 and $templatefile ne "clientregister"}not-login-page{/if}{if $templatefile == 'homepage'} this-is-index-page{/if} {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}rtl-active{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">
    {$headeroutput}
	
	
	<div id="loading-bg"><!-- start loading page -->
	<div class="loading">
	<div class="effect-1 effects"></div>
	<div class="effect-2 effects"></div>
	<div class="effect-3 effects"></div>
	</div>
	<div class="loading-text">{$LANG.loading}</div>
	</div><!-- end loading page -->
	{if $loginpage eq 0 and $templatefile ne "clientregister"}<!-- login and register page without the default header and footer -->
    <nav class="coodiv-navbar navbar-collapsed">
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
				
				<!-- end dark and regular mode toggle -->
				<div class="ThemeColorModeContainer">
				<span id="ThemeColorMode"></span>
				<span class="ThemeColorModeText"></span>
				</div>
				<!-- end dark and regular mode toggle -->
				
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
    
	{if $templatefile == 'homepage'}
	{include file="$template/template-parts/elements/header-slider.tpl"}<!-- header slider -->
	{else}
	<div class="header-hight-fixed"></div>
	{/if}
    <div class="coodiv-main-container">
    <div class="coodiv-wrapper">
        <div class="coodiv-content">
            <div class="coodiv-inner-content">
                <div class="main-body">
                 <div class="page-wrapper">
                    {if $templatefile == 'homepage'}
					{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
					{include file="$template/template-parts/elements/rtl-elements/homepage-plans.tpl"}<!-- homepage plans RTL -->
					{include file="$template/template-parts/elements/rtl-elements/homepage-features.tpl"}<!-- homepage features RTL -->
					{else}
	                {include file="$template/template-parts/elements/homepage-plans.tpl"}<!-- homepage plans -->
					{include file="$template/template-parts/elements/homepage-features.tpl"}<!-- homepage features -->
					{/if}
	                {/if}	
	                {include file="$template/includes/validateuser.tpl"}					
                    {include file="$template/includes/verifyemail.tpl"}
                            <section id="{if $templatefile == 'homepage'}main-body-homepage{else}main-body{/if}">
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
                                            