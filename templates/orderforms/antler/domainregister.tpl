{include file="orderforms/antler/common.tpl"}
<div id="order-standard_cart">
    <div class="row">

        <div class="col-md-12">
            <div class="header-lined">
                <div class="text-center">
                    <h2 class="section-heading mergecolor border-0">{$LANG.registerdomain}</h2>
                    <p class="section-subheading mergecolor">{$LANG.orderForm.findNewDomain}</p>
                </div>
                <div class="dropnav-header-lined">
                    <button id="dropside-content" type="button" class="drop-down-btn dropside-content" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="ico-more-vertical d-block f-20"></span>
                    </button>
                    <div class="dropdown-menu bg-seccolorstyle" aria-labelledby="dropside-content">
                        {include file="orderforms/antler/sidebar-categories.tpl"}
                    </div>
                </div>

            </div>
        </div>

        <div class="col-md-12 mt-50">
            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}
            <div class="domain-checker-container overlay">
                <div class="domain-checker-bg clearfix">
                    <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainChecker">
                        <input type="hidden" name="a" value="checkDomain">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                                <div class="input-group input-group-lg input-group-box">
                                    <input type="text" name="domain" class="form-control" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
                                    <span class="input-group-btn">
                                        <button type="submit" id="btnCheckAvailability" class="btn btn-default-yellow-fill domain-check-availability{$captcha->getButtonClass($captchaForm)}">{$LANG.search}</button>
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
        </div>

        <div class="col-md-12">
            <div id="DomainSearchResults" class="w-hidden">
                <div id="searchDomainInfo" class="domain-checker-result-headline">
            <p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching"><i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.searching'}...</p>
            <div id="primaryLookupResult" class="domain-lookup-result w-hidden">
                <p class="domain-invalid domain-checker-invalid">{lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span></p>
                <p class="domain-unavailable domain-checker-unavailable">{lang key='orderForm.domainIsUnavailable'}</p>
                <p class="domain-tld-unavailable domain-checker-unavailable">{lang key='orderForm.domainHasUnavailableTld'}</p>
                <p class="domain-available domain-checker-available">{$LANG.domainavailablemessage}</p>
                <a class="domain-contact-support btn btn-primary">{$LANG.domainContactUs}</a>
                <div id="idnLanguageSelector" class="form-group idn-language-selector w-hidden">
                    <div class="row">
                        <div class="col-sm-10 col-lg-12 offset-lg-2 mb-4">
                            <div class="margin-10 text-center mergecolor">
                                {lang key='cart.idnLanguageDescription'}
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8 col-lg-6 col-sm-offset-2 col-lg-offset-3 offset-sm-2 offset-lg-3 mb-5">
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
                    <span class="price mergecolor"></span>
                    <button class="btn btn-primary btn-add-to-cart" data-whois="0" data-domain="">
                        <span class="to-add">{$LANG.addtocart} <i class="fas fa-arrow-circle-right"></i></span>
                        <span class="loading"><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</span>
                        <span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
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
                            <div id="spotlight{$data.tldNoDots}" class="spotlight-tld bg-seccolorstyle bg-pratalight mergecolor">
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
                                    <button type="button" class="btn btn-add-to-cart w-hidden" data-whois="0" data-domain="">
                                        <span class="to-add">{lang key='orderForm.add'}</span>
                                        <span class="loading">
                                            <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                                        </span>
                                        <span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
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
                <div class="panel-heading card-header">
                    {lang key='orderForm.suggestedDomains'}
                </div>
                <div id="suggestionsLoader" class="panel-body card-body domain-lookup-loader domain-lookup-suggestions-loader">
                    <i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.generatingSuggestions'}
                </div>
                <div id="domainSuggestions" class="domain-lookup-result list-group w-hidden">
                    <div class="domain-suggestion list-group-item w-hidden bg-seccolorstyle bg-pratalight mergecolor">
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
                                <span class="loading">
                                    <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                                </span>
                                <span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
                                <span class="unavailable">{$LANG.domaincheckertaken}</span>
                            </button>
                            <button type="button" class="btn btn-primary domain-contact-support w-hidden">
                                {lang key='domainChecker.contactSupport'}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="panel-footer card-footer more-suggestions text-center w-hidden bg-colorstyle mergecolor">
                    <a class="mergecolor" id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;">{lang key='domainsmoresuggestions'}</a>
                    <span id="noMoreSuggestions" class="no-more small w-hidden text-muted">{lang key='domaincheckernomoresuggestions'}</span>
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
                            <div class="col-lg-4 col-sm-6">
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

            <div class="mt-50 mb-50 text-center">
                <h2 class="section-heading mergecolor border-0 mergecolor">{lang key='pricing.browseExtByCategory'}</h2>
                <div class="tld-filters text-center">
                    {foreach $categoriesWithCounts as $category => $count}
                    <a class="tld-filters-button btn btn-default-yellow-fill" href="#" data-category="{$category}">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</a>
                    {/foreach}
                </div>
            </div>

            <div class="listtable table-responsive">
                <div class="bg-seccolorstyle bg-white br-12 noshadow">
                    <table class="table table-list dataTable">
                        <thead>
                            <tr>
                                <th>{lang key='orderdomain'}</th>
                                <th>{lang key='pricing.register'}</th>
                                <th>{lang key='pricing.transfer'}</th>
                                <th>{lang key='pricing.renewal'}</th>
                            </tr>
                        </thead>
                        <tbody>
                        {foreach $pricing['pricing'] as $tld => $price}
                            <tr class="tld-row" data-category="{foreach $price.categories as $category}|{$category}|{/foreach}">
                                    
                                <td class="col-md-3 two-row-center px-4">
                                    <strong>.{$tld}</strong>
                                    {if $price.group}
                                        <span class="tld-sale-group tld-sale-group-{$price.group}">
                                            {lang key='domainCheckerSalesGroup.'|cat:$price.group}
                                        </span>
                                    {/if}
                                </td>

                                <td class="col-xs-3 text-center">
                                    {if isset($price.register) && current($price.register) > 0}
                                        {current($price.register)}
                                        <small class="text-muted ml-3">({key($price.register)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if})</small>
                                    {elseif isset($price.register) && current($price.register) == 0}
                                        <small>{lang key='orderfree'}</small>
                                    {else}
                                        <small>{lang key='na'}</small>
                                    {/if}
                                </td>
                                <td class="col-xs-3 text-center">
                                    {if isset($price.transfer) && current($price.transfer) > 0}
                                        {current($price.transfer)}
                                        <small class="text-muted ml-3">({key($price.transfer)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if})</small>
                                    {elseif isset($price.transfer) && current($price.transfer) == 0}
                                        <small>{lang key='orderfree'}</small>
                                    {else}
                                        <small>{lang key='na'}</small>
                                    {/if}
                                </td>
                                <td class="col-xs-3 text-center">
                                    {if isset($price.renew) && current($price.renew) > 0}
                                        {current($price.renew)}
                                        <small class="text-muted ml-3">({key($price.renew)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if})</small>
                                    {elseif isset($price.renew) && current($price.renew) == 0}
                                        <small>{lang key='orderfree'}</small>
                                    {else}
                                        <small>{lang key='na'}</small>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="text-center mt-50 mb-5">
                <h2 class="section-heading mergecolor border-0 mergecolor">{lang key='pricing.selectExtCategory'}</h2>
            </div>
            
        </div>
        
        <div class="row">
            <div class="{if $domainTransferEnabled}col-md-6{else}col-md-8 col-md-offset-2{/if}">
                <div class="domain-promo-box bg-seccolorstyle bg-white br-12 border-0 noshadow mb-20">
                    <a href="{$WEB_ROOT}/cart.php"><i class="ico-eye"></i></a>
                    <div class="clearfix">
                        <div class="domain-ico">
                            <img class="svg mb-10 wh-50" src="templates/{$template}/assets/fonts/svg/cloudmanaged.svg" alt="">
                        </div>
                        <div class="domain-promo-content mergecolor">
                            <h3>{lang key='orderForm.addHosting'}</h3>
                            <p class="font-bold">{lang key='orderForm.chooseFromRange'}</p>
                            <p>{lang key='orderForm.packagesForBudget'}</p>
                        </div>
                    </div>
                </div>
            </div>
            {if $domainTransferEnabled}
            <div class="col-md-6">
                <div class="domain-promo-box bg-seccolorstyle bg-white br-12 border-0 noshadow">
                    <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer"><i class="ico-eye"></i></a>
                    <div class="clearfix">
                        <div class="domain-ico">
                            <img class="svg mb-10 wh-50" src="templates/{$template}/assets/fonts/svg/freenetwork.svg" alt="">
                        </div>
                        <div class="domain-promo-content mergecolor">
                            <h3>{lang key='orderForm.transferToUs'}</h3>
                            <p class="font-bold">{lang key='orderForm.transferExtend'}*</p>
                            <p>* {lang key='orderForm.extendExclusions'}</p>
                        </div>
                    </div>
                </div>
            </div>
            {/if}
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
<script type="text/javascript" src="{$WEB_ROOT}/templates/orderforms/antler/js/main.js?v={$versionHash}"></script>