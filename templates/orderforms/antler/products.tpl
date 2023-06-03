{include file="orderforms/antler/common.tpl"}

<div id="order-standard_cart">
    <div class="header-lined">
        <div class="text-center">
            <h2 class="section-heading mergecolor">
                {if $productGroup.headline}
                {$productGroup.headline}
                {else}
                {$productGroup.name}
                {/if}
            </h2>
            {if $productGroup.tagline}
                <p class="section-subheading mergecolor">{$productGroup.tagline}</p>
            {/if}
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
    {if $errormessage}
    <div class="alert alert-danger">
        {$errormessage}
    </div>
    {/if}

    {include file="orderforms/antler/sidebar-categories-collapsed.tpl"}
    
    <div class="product mt-80" id="products">
        <div class="row row-eq-height">

            {foreach $products as $key => $product}
            
            <div class="col-md-4 plan-content pricing special {if $product.isFeatured}feature-plan{/if}">
                <div class="product clearfix" id="{$idPrefix}">
                    {if $product.isFeatured}
                    <div class="badge feat tt-lower bg-danger">{$LANG.featuredProduct|upper}</div>
                    {/if}
                    <div class="header-content top-content bg-seccolorstyle noshadow topradius">
                        <header>
                            <span class="title" id="product{$product@iteration}-name">{$product.name}</span><br>
                            {if $product.stockControlEnabled}
                            <span class="fromer mergecolor">
                                {$product.qty} {$LANG.orderavailable} -

                                {if $product.pricing.minprice.setupFee}
                                <small class="setupfee">{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                {else}
                                <small class="setupfee">{$LANG.orderpromofreesetup}</small>
                                {/if}
                            </span>
                            {/if}
                        </header>
                        <div class="product-pricing mergecolor" id="product{$product@iteration}-price">
                            {if $product.bid}
                            {$LANG.bundledeal}<br />
                            {if $product.displayprice}
                            <span class="price mergecolor">{$product.displayprice}</span>
                            {/if}
                            {else}
                            {if $product.pricing.hasconfigoptions}
                            {$LANG.startingfrom}
                            {/if}
                            <span class="price mergecolor fw700">{$product.pricing.minprice.price}</span>
                            <span class="period mergecolor f-20">{if $product.pricing.minprice.cycle eq "monthly"}
                                {$LANG.orderpaymenttermmonthly}
                                {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                {$LANG.orderpaymenttermquarterly}
                                {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                {$LANG.orderpaymenttermsemiannually}
                                {elseif $product.pricing.minprice.cycle eq "annually"}
                                {$LANG.orderpaymenttermannually}
                                {elseif $product.pricing.minprice.cycle eq "biennially"}
                                {$LANG.orderpaymenttermbiennially}
                                {elseif $product.pricing.minprice.cycle eq "triennially"}
                                {$LANG.orderpaymenttermtriennially}
                            {/if}</span>
                            <br>
                            {/if}
                        </div>
                        <a href="{$product.productUrl}" class="btn btn-default-yellow-fill btn-order-now" id="{$idPrefix}-order-button"{if $product.hasRecommendations} data-has-recommendations="1"{/if}> {$LANG.ordernowbutton}</a>
                    </div>

                    <div class="product-desc list-info">
                        {if $product.featuresdesc}
                        <div class="prod-desc-div" id="product{$product@iteration}-description">
                            {$product.featuresdesc}
                        </div>
                        {/if}

                        <ul class="prod-desc-ul">
                            {foreach $product.features as $feature => $value}
                            <li id="product{$product@iteration}-feature{$value@iteration}">
                                <span class="feature-value">{$value}</span>
                                {$feature}
                            </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </div>
            {if $product@iteration % 3 == 0}
        </div>
        <div class="row row-eq-height">
            {/if}
            {/foreach}
        </div>
    </div>
</div>
<script type="text/javascript" src="{$WEB_ROOT}/templates/orderforms/antler/js/main.js?v={$versionHash}"></script>