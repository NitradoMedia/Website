{include file="orderforms/coowhm-cart/common.tpl"}

<div id="order-standard_cart">

    <div class="row">

        <div class="col-md-12">

            <div class="header-lined">
                <h1>
                    {$LANG.registerdomain}
                </h1>

				<div class="d-flex">
				{include file="orderforms/coowhm-cart/currencies-selector.tpl"}
				<div class="side-bar-header-lined-drop-down">
				<button id="show-more-sidebar" type="button" class="drop-down-btn show-more-sidebar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-bars"></i>
				{$pagetitle}
				</button>
				<div class="dropdown-menu" aria-labelledby="show-more-sidebar">
  			    {include file="orderforms/coowhm-cart/sidebar-categories.tpl"}
   			    </div>
   			    </div>
				</div>
				
				
            </div>

        </div>

        <div class="col-md-12">

            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}

            <p>{$LANG.orderForm.findNewDomain}</p>

            <div class="domain-checker-container">
                <div class="domain-checker-bg clearfix">
                    <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainChecker">
                        <input type="hidden" name="a" value="checkDomain">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                                <div class="input-group input-group-lg input-group-box">
                                    <input type="text" name="domain" class="form-control" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
                                    <span class="input-group-btn">
                                        <button type="submit" id="btnCheckAvailability" class="btn btn-primary domain-check-availability{$captcha->getButtonClass($captchaForm)}">{$LANG.search}</button>
                                    </span>
                                </div>
                            </div>

                            {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}
                                <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                                    <div class="captcha-container" id="captchaContainer">
                                        {if $captcha == "recaptcha"}
                                            <br>
                                            <div class="form-group recaptcha-container"></div>
                                        {elseif $captcha != "recaptcha"}
                                            <div class="default-captcha default-captcha-register-margin">
                                                <p>{lang key="cartSimpleCaptcha"}</p>
                                                <div>
                                                    <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" align="middle" />
                                                    <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control input-sm" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
			<div class="col-md-8">
            <div id="DomainSearchResults" class="w-hidden">

                <div id="searchDomainInfo" class="domain-checker-result-headline">
                    <p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching"><i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.searching'}...</p>
                    <div id="primaryLookupResult" class="domain-lookup-result w-hidden">
                        <p class="domain-invalid domain-checker-invalid">{lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span></p>
                        <p class="domain-unavailable domain-checker-unavailable"><i class="feather icon-x"></i> {lang key='orderForm.domainIsUnavailable'}</p>
                        <p class="domain-available domain-checker-available"><i class="feather icon-check"></i> {$LANG.domainavailable1} <strong></strong> {$LANG.domainavailable2}</p>
                        <a class="domain-contact-support btn btn-primary">{$LANG.domainContactUs}</a>
						<div id="idnLanguageSelector" class="form-group w-hidden idn-language-selector">
                            <div class="row">
                                <div class="col-sm-10 col-sm-offset-1 col-lg-8 col-lg-offset-2">
                                    <div class="margin-10 text-center">
                                        {lang key='cart.idnLanguageDescription'}
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-8 col-lg-6 col-sm-offset-2 col-lg-offset-3">
                                    <select name="idnlanguage" class="form-control">
                                        <option value="">{lang key='cart.idnLanguage'}</option>
                                        {foreach $idnLanguages as $idnLanguageKey => $idnLanguage}
                                            <option value="{$idnLanguageKey}">{lang key='idnLanguage.'|cat:$idnLanguageKey}</option>
                                        {/foreach}
                                    </select>
                                    <div class="field-error-msg">
                                        {lang key='cart.selectIdnLanguageForRegister'}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="domain-price">
                            <span class="price"></span>
                            <button class="btn btn-primary btn-add-to-cart" data-whois="0" data-domain="">
                                <span class="to-add">{$LANG.addtocart}</span>
                                <span class="added"><i class="glyphicon glyphicon-shopping-cart"></i> {lang key='checkout'}</span>
                                <span class="unavailable">{$LANG.domaincheckertaken}</span>
                            </button>
                        </p>
                        <p class="domain-error domain-checker-unavailable"></p>
                    </div>
                </div>

                {if $spotlightTlds}
                    <div id="spotlightTlds" class="spotlight-tlds clearfix">
                        <div class="spotlight-tlds-container">
                            {foreach $spotlightTlds as $key => $data}
                                <div class="spotlight-tld-container spotlight-tld-container-{$spotlightTlds|count}">
                                    <div id="spotlight{$data.tldNoDots}" class="spotlight-tld">
                                        {if $data.group}
                                            <div class="spotlight-tld-{$data.group}">{$data.groupDisplayName}</div>
                                        {/if}
                                        {$data.tld}
                                        <span class="domain-lookup-loader domain-lookup-spotlight-loader">
                                            <i class="fas fa-spinner fa-spin"></i>
                                        </span>
                                        <div class="domain-lookup-result">
                                            <button type="button" class="btn unavailable w-hidden" disabled="disabled">
                                                {lang key='domainunavailable'}
                                            </button>
                                            <button type="button" class="btn invalid w-hidden" disabled="disabled">
                                                {lang key='domainunavailable'}
                                            </button>
                                            <span class="available price w-hidden">{$data.register}</span>
                                            <button type="button" class="btn w-hidden btn-add-to-cart" data-whois="0" data-domain="">
                                                <span class="to-add">{lang key='orderForm.add'}</span>
                                                <span class="added"><i class="glyphicon glyphicon-shopping-cart"></i> {lang key='checkout'}</span>
                                                <span class="unavailable">{$LANG.domaincheckertaken}</span>
                                            </button>
                                            <button type="button" class="btn btn-primary domain-contact-support w-hidden">
                                                {lang key='domainChecker.contactSupport'}
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <div class="suggested-domains{if !$showSuggestionsContainer} w-hidden{/if}">
                    <div class="panel-heading">
                        {lang key='orderForm.suggestedDomains'}
                    </div>
                    <div id="suggestionsLoader" class="panel-body domain-lookup-loader domain-lookup-suggestions-loader">
                        <i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.generatingSuggestions'}
                    </div>
                    <ul id="domainSuggestions" class="domain-lookup-result list-group w-hidden">
                        <li class="domain-suggestion list-group-item w-hidden">
                            <span class="domain"></span><span class="extension"></span>
                            <span class="promo w-hidden">
                                <span class="sales-group-hot w-hidden">{lang key='domainCheckerSalesGroup.hot'}</span>
                                <span class="sales-group-new w-hidden">{lang key='domainCheckerSalesGroup.new'}</span>
                                <span class="sales-group-sale w-hidden">{lang key='domainCheckerSalesGroup.sale'}</span>
                            </span>
                            <div class="actions">
                                <span class="price"></span>
                                <button type="button" class="btn btn-add-to-cart" data-whois="1" data-domain="">
                                    <span class="to-add">{$LANG.addtocart}</span>
                                    <span class="added"><i class="glyphicon glyphicon-shopping-cart"></i> {lang key='checkout'}</span>
                                    <span class="unavailable">{$LANG.domaincheckertaken}</span>
                                </button>
                                <button type="button" class="btn btn-primary domain-contact-support w-hidden">
                                    {lang key='domainChecker.contactSupport'}
                                </button>
                            </div>
                        </li>
                    </ul>
                    <div class="panel-footer more-suggestions w-hidden text-center">
                        <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;">{lang key='domainsmoresuggestions'}</a>
                        <span id="noMoreSuggestions" class="no-more small w-hidden">{lang key='domaincheckernomoresuggestions'}</span>
                    </div>
                    <div class="text-center text-muted domain-suggestions-warning">
                        <p>{lang key='domainssuggestionswarnings'}</p>
                    </div>
                </div>

            </div>

            <div class="domain-pricing">

                {if $featuredTlds}
                    <div class="featured-tlds-container">
                        <div class="row">
                            {foreach $featuredTlds as $num => $tldinfo}
                                {if $num % 3 == 0 && (count($featuredTlds) - $num < 3)}
                                    {if count($featuredTlds) - $num == 2}
                                        <div class="col-sm-2"></div>
                                    {else}
                                        <div class="col-sm-4"></div>
                                    {/if}
                                {/if}
                                <div class="col-sm-4 col-xs-6">
                                    <div class="featured-tld">
                                        <div class="img-container">
                                            <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png">
                                        </div>
                                        <div class="price {$tldinfo.tldNoDots}">
                                            {if is_object($tldinfo.register)}
                                                {$tldinfo.register->toPrefixed()}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
                                            {else}
                                                {lang key="domainregnotavailable"}
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <h4>{lang key='pricing.browseExtByCategory'}</h4>

                <div class="tld-filters">
                    {foreach $categoriesWithCounts as $category => $count}
                        <a class="tld-filters-button" href="#" data-category="{$category}">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</a>
                    {/foreach}
                </div>

                <div class="row-table-tld-pricing">
                <div class="row tld-pricing-header text-center">
                    <div class="col-sm-4 no-bg tld-column">{lang key='orderdomain'}</div>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-xs-4">{lang key='pricing.register'}</div>
                            <div class="col-xs-4">{lang key='pricing.transfer'}</div>
                            <div class="col-xs-4">{lang key='pricing.renewal'}</div>
                        </div>
                    </div>
                </div>
                {foreach $pricing['pricing'] as $tld => $price}
                    <div class="row tld-row" data-category="{foreach $price.categories as $category}|{$category}|{/foreach}">
                        <div class="col-sm-4 two-row-center">
                            <strong>.{$tld}</strong>
                            {if $price.group}
                                <span class="tld-sale-group tld-sale-group-{$price.group}">{$price.group}!</span>
                            {/if}
                        </div>
                        <div class="col-sm-8">
                            <div class="row register-inforows">
                                <div class="col-xs-4 text-left">
                                    {if current($price.register) >= 0}
                                        {current($price.register)}<br>
                                        <small>{key($price.register)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                    {else}
                                        <small>N/A</small>
                                    {/if}
                                </div>
                                <div class="col-xs-4 text-left">
                                    {if current($price.transfer) > 0}
                                        {current($price.transfer)}<br>
                                        <small>{key($price.transfer)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                    {else}
                                        <small>N/A</small>
                                    {/if}
                                </div>
                                <div class="col-xs-4 text-left">
                                    {if current($price.renew) > 0}
                                        {current($price.renew)}<br>
                                        <small>{key($price.renew)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                    {else}
                                        <small>N/A</small>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}
				</div>
                <div class="row tld-row no-tlds">
                    <div class="col-xs-12 text-center">
                        <br>
                        {lang key='pricing.selectExtCategory'}
                        <br><br>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="{if $domainTransferEnabled}col-md-6{else}col-md-8 col-md-offset-2{/if}">
                    <div class="domain-promo-box">

                        <div class="clearfix">
                            <img src="{$WEB_ROOT}/templates/{$template}/img/icons/svg/016-computer.svg" alt="">
                            <h3>{lang key='orderForm.addHosting'}</h3>
                            <p class="font-bold text-warning">{lang key='orderForm.chooseFromRange'}</p>
                        </div>

                        <p>{lang key='orderForm.packagesForBudget'}</p>

                        <a href="{$WEB_ROOT}/cart.php" class="btn btn-warning">
                            {lang key='orderForm.exploreNow'}
                        </a>
                    </div>
                </div>
                {if $domainTransferEnabled}
                    <div class="col-md-6">
                        <div class="domain-promo-box">

                            <div class="clearfix">
                               <img src="{$WEB_ROOT}/templates/{$template}/img/icons/svg/049-cpu.svg" alt="">
                                <h3>{lang key='orderForm.transferToUs'}</h3>
                                <p class="font-bold text-primary">{lang key='orderForm.transferExtend'}*</p>
                            </div>
							<p>* {lang key='orderForm.extendExclusions'}</p>

                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-primary">
                                {lang key='orderForm.transferDomain'}
                            </a>

                        </div>
                    </div>
                {/if}
            </div>
			</div>
			<div class="col-md-4">
			{include file="$template/template-parts/banners/banner-01.tpl"}
			</div>
			</div>

        </div>
    </div>
</div>

<script>
jQuery(document).ready(function() {
    jQuery('.tld-filters a:first-child').click();
{if $lookupTerm && !$captchaError && !$invalid}
    jQuery('#btnCheckAvailability').click();
{/if}
{if $invalid}
    jQuery('#primaryLookupSearching').toggle();
    jQuery('#primaryLookupResult').children().toggle();
    jQuery('#primaryLookupResult').toggle();
    jQuery('#DomainSearchResults').toggle();
    jQuery('.domain-invalid').toggle();
{/if}
});
</script>
