{include file="orderforms/antler/common.tpl"}
<script>
var _localLang = {
'addToCart': '{$LANG.orderForm.addToCart|escape}',
'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
</script>
<div id="order-standard_cart">

    <div class="col-md-12">
        <div class="header-lined">
            <div class="text-center">
                <h2 class="section-heading mergecolor border-0">{$LANG.cartdomainsconfig}</h2>
                <p class="section-subheading mergecolor">{$LANG.orderForm.reviewDomainAndAddons}</p>
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

    <div class="row">
        <div class="col-md-12 mt-50">
            <div class="sec-main bg-colorstyle sec-bg1 nopadding noshadow">
                {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}
                <form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains" id="frmConfigureDomains">
                    <input type="hidden" name="update" value="true" />
                    {if $errormessage}
                    <div class="alert alert-danger" role="alert">
                        <p>{$LANG.orderForm.correctErrors}:</p>
                        <ul>
                            {$errormessage}
                        </ul>
                    </div>
                    {/if}
                    
                    {foreach $domains as $num => $domain}
                    <div class="domainsaddionsbox">

                        <div class="bg-seccolorstyle bg-pratalight p-50 br-12 noshadow mb-5">
                            <div class="row m-0 lh-xl">

                                <div class="col-xs-12 col-md-4 text-center">
                                    <h3 class="domainsaddionsboxtitle mergecolor f-28 m-0">{$domain.domain}</h3>
                                </div>
                                <div class="col-xs-12 col-md-4 text-center">
                                    <p class="text-muted f-14 m-0">{$LANG.orderregperiod}: {$domain.regperiod} {$LANG.orderyears}</p>
                                </div>
                            
                                <div class="col-xs-12 col-md-4 d-flex">
                                    <div class="domainsaddionsbox-hosting-add text-right m-auto">
                                        {if $domain.hosting}
                                        <span class="yes btn btn-md btn-default-yellow-fill bg-success">{$LANG.cartdomainshashosting}</span>
                                        {else}
                                        <span class="no">
                                            <a class="btn btn-md btn-default-yellow-fill bg-danger" href="{$WEB_ROOT}/cart.php">{$LANG.cartdomainsnohosting}</a>
                                        </span>
                                        {/if}
                                    </div>
                                    {if $domain.eppenabled}
                                    <div class="form-group prepend-icon">
                                        <input type="text" name="epp[{$num}]" id="inputEppcode{$num}" value="{$domain.eppvalue}" class="field" placeholder="{$LANG.domaineppcode}" />
                                        <label for="inputEppcode{$num}" class="field-icon">
                                            <i class="fas fa-lock"></i>
                                        </label>
                                        <span class="field-help-text">
                                            {$LANG.domaineppcodedesc}
                                        </span>
                                    </div>
                                    {/if}
                                </div>
                            </div>
                        </div>

                        {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}
                        <div class="row addon-products">
                            
                            {if $domain.dnsmanagement}
                            <div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount}">
                                <div class="bg-seccolorstyle bg-pratalight p-50 br-12 noshadow mb-5">
                                    <div class="panel panel-default panel-addon p-0 mergecolor{if $domain.dnsmanagementselected} panel-addon-selected{/if}">
                                        <div class="panel-body p-0">
                                            <label class="chcktoadd">
                                                <input type="checkbox" name="dnsmanagement[{$num}]"{if $domain.dnsmanagementselected} checked{/if} />
                                                <span class="mergecolor">{$LANG.domaindnsmanagement}</span>
                                            </label>
                                            <i data-toggle="tooltip" data-placement="left" title="{$LANG.domainaddonsdnsmanagementinfo}" class="feather icon-alert-circle chcktoaddmore"></i>
                                            <span class="btn btn-md btn-default-yellow-fill bg-success adddomainprice">{$domain.dnsmanagementprice} / {$domain.regperiod} {$LANG.orderyears}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/if}

                            {if $domain.idprotection}
                            <div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount}">
                                <div class="bg-seccolorstyle bg-pratalight p-50 br-12 noshadow mb-5">
                                    <div class="panel panel-default panel-addon p-0 mergecolor{if $domain.idprotectionselected} panel-addon-selected{/if}">
                                        <div class="panel-body p-0">
                                            <label class="chcktoadd">
                                                <input type="checkbox" name="idprotection[{$num}]"{if $domain.idprotectionselected} checked{/if} />
                                                <span class="mergecolor">{$LANG.domainidprotection}</span>
                                            </label>
                                            <i data-toggle="tooltip" data-placement="left" title="{$LANG.domainaddonsidprotectioninfo}" class="feather icon-alert-circle chcktoaddmore"></i>
                                            <span class="btn btn-md btn-default-yellow-fill bg-success adddomainprice">{$domain.idprotectionprice} / {$domain.regperiod} {$LANG.orderyears}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/if}
                            
                            {if $domain.emailforwarding}
                            <div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount}">
                                <div class="bg-seccolorstyle bg-pratalight p-50 br-12 noshadow mb-5">
                                    <div class="panel panel-default panel-addon p-0 mergecolor{if $domain.emailforwardingselected} panel-addon-selected{/if}">
                                        <div class="panel-body p-0">
                                            <label class="chcktoadd">
                                                <input type="checkbox" name="emailforwarding[{$num}]"{if $domain.emailforwardingselected} checked{/if} />
                                                <span class="mergecolor">{$LANG.domainemailforwarding}</span>
                                            </label>
                                            <i data-toggle="tooltip" data-placement="left" title="{$LANG.domainaddonsemailforwardinginfo}" class="feather icon-alert-circle chcktoaddmore"></i>
                                            <span class="btn btn-md btn-default-yellow-fill bg-successadddomainprice">{$domain.emailforwardingprice} / {$domain.regperiod} {$LANG.orderyears}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/if}
                        </div>
                    </div>
                    {/if}

                    <div class="of-auto bg-seccolorstyle bg-pratalight mergecolor p-50 br-12 mb-30">
                        <div class="col-md-12">
                            {foreach from=$domain.fields key=domainfieldname item=domainfield}
                                <div class="col-md-4">
                                    <div class="text-muted mb-4 f-16">{$domainfieldname}:</div>
                                    <div>{$domainfield}</div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    {/foreach}

                    {if $atleastonenohosting}
                    <div class="box-domainnameservers">

                        <div class="text-center">
                            <h2 class="section-heading mergecolor border-0">{$LANG.domainnameservers}</h2>
                            <p class="section-subheading mergecolor">{$LANG.cartnameserversdesc}</p>
                        </div>

                        <div class="of-auto px-0 mt-50 mb-50 bg-seccolorstyle bg-pratalight mergecolor br-12 p-50">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="text-muted" for="inputNs1">{$LANG.domainnameserver1}</label>
                                    <input type="text" class="form-control" id="inputNs1" name="domainns1" value="{$domainns1}" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="text-muted" for="inputNs2">{$LANG.domainnameserver2}</label>
                                    <input type="text" class="form-control" id="inputNs2" name="domainns2" value="{$domainns2}" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="text-muted" or="inputNs3">{$LANG.domainnameserver3}</label>
                                    <input type="text" class="form-control" id="inputNs3" name="domainns3" value="{$domainns3}" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="text-muted" for="inputNs1">{$LANG.domainnameserver4}</label>
                                    <input type="text" class="form-control" id="inputNs4" name="domainns4" value="{$domainns4}" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="text-muted" for="inputNs5">{$LANG.domainnameserver5}</label>
                                    <input type="text" class="form-control" id="inputNs5" name="domainns5" value="{$domainns5}" />
                                </div>
                            </div>
                        </div>
                    </div>
                    {/if}
                    <div class="text-center">
                        <button type="submit" class="btn btn-default-yellow-fill btn-lg">
                        {$LANG.continue}
                        &nbsp;<i class="fas fa-arrow-circle-right"></i>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
{include file="orderforms/antler/recommendations-modal.tpl"}