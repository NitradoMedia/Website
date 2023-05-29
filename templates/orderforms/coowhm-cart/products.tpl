{include file="orderforms/coowhm-cart/common.tpl"}

<div id="order-standard_cart">

    <div class="row">

        <div class="col-md-12">

            <div class="header-lined">
                <h1>
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                {if $productGroup.tagline}
                    <small>{$productGroup.tagline}</small>
                {/if}
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
			
			
            {if $errormessage}
                <div class="alert alert-danger">
                    {$errormessage}
                </div>
            {/if}
        </div>

        <div class="col-md-12">

            {include file="orderforms/coowhm-cart/sidebar-categories-collapsed.tpl"}



            <div class="coowhm-product" id="products">
                <div class="row row-eq-height">
                    {foreach $products as $key => $product}
                        <div class="col-md-4 product {if $product.isFeatured}feature-plan{/if}">
                            <div class="clearfix" id="product{$product@iteration}">
                                <header>
                                    <span class="product-name" id="product{$product@iteration}-name">{$product.name}</span>
                                    {if $product.qty}
                                        <span class="qty">
                                            {$product.qty} {$LANG.orderavailable}
                                        </span>
                                    {/if}
                                </header>
								
								<div class="product-pricing" id="product{$product@iteration}-price">
                                        {if $product.bid}
                                            {$LANG.bundledeal}<br />
                                            {if $product.displayprice}
                                                <span class="price">{$product.displayprice}</span>
                                            {/if}
                                           {else}
                                            {if $product.pricing.hasconfigoptions}
                                                {$LANG.startingfrom}
                                            {/if}
                                            <span class="price">{$product.pricing.minprice.price}</span>
                                            {if $product.pricing.minprice.cycle eq "monthly"}
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
                                            {/if}
                                            <br>
                                            
                                        {/if}
                                </div>

								<div class="product-desc">
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
								
								
                                <footer>
                                    <a href="{$product.productUrl}" class="btn btn-order-coowhm btn-order-now" id="{$idPrefix}-order-button"{if $product.hasRecommendations} data-has-recommendations="1"{/if}>
                                    {$LANG.ordernowbutton}
                                    </a>
									{if $product.pricing.minprice.setupFee}
                                    <small class="coowhm-setupFee">{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
									{else}
									<small class="coowhm-setupFee">{$LANG.orderpromofreesetup}</small>
                                    {/if}
                                </footer>
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
    </div>
</div>
{include file="orderforms/coowhm-cart/recommendations-modal.tpl"}