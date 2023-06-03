<link type="text/css" rel="stylesheet" href="{assetPath file="style.css"}" property="stylesheet" />
<script>
jQuery(document).ready(function () {
    jQuery('#btnShowSidebar').click(function () {
        if (jQuery(".product-selection-sidebar").is(":visible")) {
            jQuery('.row-product-selection').css('left','0');
            jQuery('.product-selection-sidebar').fadeOut();
            jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-right"></i> {$LANG.showMenu}');
        } else {
            jQuery('.product-selection-sidebar').fadeIn();
            jQuery('.row-product-selection').css('left','300px');
            jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-left"></i> {$LANG.hideMenu}');
        }
    });
});
</script>

{if $showSidebarToggle}
    <button type="button" class="btn btn-default btn-sm" id="btnShowSidebar">
        <i class="fas fa-arrow-circle-right"></i>
        {$LANG.showMenu}
    </button>
{/if}

<div class="row row-product-selection">
    <div class="col-md-3 sidebar product-selection-sidebar" id="premiumComparisonSidebar">
        {include file="orderforms/standard_cart/sidebar-categories.tpl"}
    </div>
    <div class="col-md-12">

        <div id="order-hostbox_cart" class="page-container pricing-section">
            <div class="txt-center">
                <div class="row-title less-margin">
                    <h3 id="headline">
                        {if $productGroup.headline}
                            {$productGroup.headline}
                        {else}
                            {$productGroup.name}
                        {/if}
                    </h3>
                </div>
                {if $productGroup.tagline}
                <div class="row-sub-title">
                    <h5 id="tagline">
                        {$productGroup.tagline}
                    </h5>
                </div>
                {/if}
                {if $errormessage}
                    <div class="alert alert-danger">
                        {$errormessage}
                    </div>
                {elseif !$productGroup}
                    <div class="alert alert-info">
                        {lang key='orderForm.selectCategory'}
                    </div>
                {/if}
            </div>
            <div id="products" class="price-table-container">
                <div class="row">
                    {foreach $products as $product}
                        {assign var="counter" value=$product@iteration%3}
                        {if $counter==0}
                    		{assign var=counter value=4}
                		{/if}
                        <div id="product{$product@iteration}" class="col-sm-6 col-md-6 col-lg-3 price-column">
                            <div class="price-table pr-color{$counter} sm-3{if $product.isFeatured} top-choice{/if}">
                                <div class="price-title" id="product{$product@iteration}-name">{$product.name}</div>

                                {assign var="countava" value=0}
                                {if $product.pricing.rawpricing.monthly != -1}
                                    {assign var=countava value=$countava+1}
                                {/if}
                                {if $product.pricing.rawpricing.quarterly != -1}
                                    {assign var=countava value=$countava+1}
                                {/if}
                                {if $product.pricing.rawpricing.semiannually != -1}
                                    {assign var=countava value=$countava+1}
                                {/if}
                                {if $product.pricing.rawpricing.annually != -1}
                                    {assign var=countava value=$countava+1}
                                {/if}
                                {if $product.pricing.rawpricing.biennially != -1}
                                    {assign var=countava value=$countava+1}
                                {/if}
                                {if $product.pricing.rawpricing.triennially != -1}
                                    {assign var=countava value=$countava+1}
                                {/if}
                                <div id="product{$product@iteration}-price" class="price">
                                    {assign var=mycurrency value={$product.pricing.minprice.price->toPrefixed()|mb_substr:0:1}}
                                    {if $product.bid}
                                        {$LANG.bundledeal}
                                        {if $product.displayprice}
                                            <div class="display-price">{$product.displayPriceSimple}</div>
                                        {/if}
                                    {elseif $product.paytype eq "free"}
                                            <div class="free-plan">{$LANG.orderfree}</div>
                                    {elseif $product.paytype eq "onetime"}
                                            <div class="one-time">
                                                <div class="price-num">{$product.pricing.minprice.price->toPrefixed()}</div> 
                                                <div class="setup-fee">+ {$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee} </div>
                                                <div>{$LANG.orderpaymenttermonetime}</div>
                                            </div>
                                    {else}
                                        {if $product.pricing.hasconfigoptions}
                                            {*
                                            {$LANG.from}
                                            *}
                                        {/if}
                                        {if $countava>1}
                                            <div class="tab-content">
                                                {if $product.pricing.rawpricing.monthly != -1}
                                                    <div role="tabpanel" class="tab-pane fade in active show" id="monthly{$product@iteration}">
                                                        <span class="price-num"><span class="currency">{$mycurrency}</span>{$product.pricing.rawpricing.monthly}</span>
                                                        {if $product.pricing.rawpricing.msetupfee > 0}
                                                            <div class="setup-fee">
                                                                {$mycurrency}{$product.pricing.rawpricing.msetupfee} {$LANG.ordersetupfee}
                                                            </div>
                                                        {/if}
                                                    </div>
                                                {/if}
                                                {if $product.pricing.rawpricing.quarterly != -1}
                                                    <div role="tabpanel" class="tab-pane fade" id="quarterly{$product@iteration}">
                                                        <span class="price-num"><span class="currency">{$mycurrency}</span>{$product.pricing.rawpricing.quarterly}</span>
                                                        {if $product.pricing.rawpricing.qsetupfee > 0}
                                                            <div class="setup-fee">
                                                                {$mycurrency}{$product.pricing.rawpricing.qsetupfee} {$LANG.ordersetupfee}
                                                            </div>
                                                        {/if}
                                                    </div>
                                                {/if}
                                                {if $product.pricing.rawpricing.semiannually != -1}
                                                    <div role="tabpanel" class="tab-pane fade" id="semiannually{$product@iteration}">
                                                        <span class="price-num"><span class="currency">{$mycurrency}</span>{$product.pricing.rawpricing.semiannually}</span>
                                                        {if $product.pricing.rawpricing.ssetupfee > 0}
                                                            <div class="setup-fee">
                                                                {$mycurrency}{$product.pricing.rawpricing.ssetupfee} {$LANG.ordersetupfee}
                                                            </div>
                                                        {/if}
                                                    </div>
                                                {/if}
                                                {if $product.pricing.rawpricing.annually != -1}
                                                    <div role="tabpanel" class="tab-pane fade" id="annually{$product@iteration}">
                                                        <span class="price-num"><span class="currency">{$mycurrency}</span>{$product.pricing.rawpricing.annually}</span>
                                                        {if $product.pricing.rawpricing.asetupfee > 0}
                                                            <div class="setup-fee">
                                                                {$mycurrency}{$product.pricing.rawpricing.asetupfee} {$LANG.ordersetupfee}
                                                            </div>
                                                        {/if}
                                                    </div>
                                                {/if}
                                                {if $product.pricing.rawpricing.biennially != -1}
                                                    <div role="tabpanel" class="tab-pane fade" id="biennially{$product@iteration}">
                                                        <span class="price-num"><span class="currency">{$mycurrency}</span>{$product.pricing.rawpricing.biennially}</span>
                                                        {if $product.pricing.rawpricing.bsetupfee > 0}
                                                            <div class="setup-fee">
                                                                {$mycurrency}{$product.pricing.rawpricing.bsetupfee} {$LANG.ordersetupfee}
                                                            </div>
                                                        {/if}
                                                    </div>
                                                {/if}
                                                {if $product.pricing.rawpricing.triennially != -1}
                                                    <div role="tabpanel" class="tab-pane fade" id="triennially{$product@iteration}">
                                                        <span class="price-num"><span class="currency">{$mycurrency}</span>{$product.pricing.rawpricing.triennially}</span>
                                                        {if $product.pricing.rawpricing.tsetupfee > 0}
                                                            <div class="setup-fee">
                                                                {$mycurrency}{$product.pricing.rawpricing.tsetupfee} {$LANG.ordersetupfee}
                                                            </div>
                                                        {/if}
                                                    </div>
                                                {/if}
                                            </div>
                                            <ul class="duration nav nav-tabs" role="tablist">
                                                {if $product.pricing.rawpricing.monthly != -1}
                                                    <li role="presentation"><a href="#monthly{$product@iteration}" aria-controls="monthly{$product@iteration}" role="tab" data-toggle="tab" class="active show">{$LANG.orderpaymenttermmonthly}</a></li>
                                                {/if}
                                                {if $product.pricing.rawpricing.quarterly != -1}
                                                    <li role="presentation"><a href="#quarterly{$product@iteration}" aria-controls="quarterly{$product@iteration}" role="tab" data-toggle="tab">{$LANG.orderpaymenttermquarterly}</a></li>
                                                {/if}
                                                {if $product.pricing.rawpricing.semiannually != -1}
                                                    <li role="presentation"><a href="#semiannually{$product@iteration}" aria-controls="semiannually{$product@iteration}" role="tab" data-toggle="tab">{$LANG.orderpaymenttermsemiannually}</a></li>
                                                {/if}
                                                {if $product.pricing.rawpricing.annually != -1}
                                                    <li role="presentation"><a href="#annualy{$product@iteration}" aria-controls="annualy{$product@iteration}" role="tab" data-toggle="tab">{$LANG.orderpaymenttermannually}</a></li>
                                                {/if}
                                                {if $product.pricing.rawpricing.biennially != -1}
                                                    <li role="presentation"><a href="#biennially{$product@iteration}" aria-controls="biennially{$product@iteration}" role="tab" data-toggle="tab">{$LANG.orderpaymenttermbiennially}</a></li>
                                                {/if}
                                                {if $product.pricing.rawpricing.triennially != -1}
                                                    <li role="presentation"><a href="#triennially{$product@iteration}" aria-controls="triennially{$product@iteration}" role="tab" data-toggle="tab">{$LANG.orderpaymenttermtriennially}</a></li>
                                                {/if}
                                            </ul>
                                        {else}
                                            <div class="price-num">{$product.pricing.minprice.price->toPrefixed()}</div>
                                            <div class="billing-cycle">{$product.pricing.minprice.cycle}</div>
                                        {/if}
                                        {if $countava<=1}
                                            {if $product.pricing.minprice.setupFee}
                                                <div class="setup-fee">
                                                    {$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}
                                                </div>
                                            {/if}
                                        {/if}
                                    {/if}
                                </div>
                                <div id="productDescription{$product@iteration}" class="details-list-holder">
                                    {foreach $product.features as $feature => $value}
                                        <div id="product{$product@iteration}-feature{$value@iteration}">
                                            <span>{$value}</span> {$feature}
                                        </div>
                                    {foreachelse}
                                        <div id="product{$product@iteration}-description">
                                            {$product.description}
                                        </div>
                                    {/foreach}
                                </div>
                                {if $product.qty eq "0"}
                                    <span id="product{$product@iteration}-unavailable" class="price-btn unavailable">
                                        {$LANG.outofstock}
                                    </span>
                                {else}
                                    <a href="{$WEB_ROOT}/cart.php?a=add&amp;{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="price-btn" id="product{$product@iteration}-order-button">
                                        {$LANG.ordernowbutton}
                                    </a>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>

            {if count($productGroup.features) > 0}
                <div class="includes-features">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <div class="head-area">
                                <span class="primary-bg-color">
                                    {$LANG.orderForm.includedWithPlans}
                                </span>
                            </div>
                            <ul class="list-features">
                                {foreach $productGroup.features as $features}
                                    <li>{$features.feature}</li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                </div>
            {/if}

        </div>
    </div>
</div>
