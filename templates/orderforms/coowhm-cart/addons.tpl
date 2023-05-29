{include file="orderforms/coowhm-cart/common.tpl"}

<div id="order-standard_cart">

    <div class="row">

        <div class="col-md-12">

            <div class="header-lined">
                <h1>{$LANG.cartproductaddons}</h1>
				
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

            {if count($addons) == 0}
                <div class="alert alert-warning text-center" role="alert">
                    {$LANG.cartproductaddonsnone}
                </div>
                <p class="text-center">
                    <a href="clientarea.php" class="btn btn-default">
                        <i class="fas fa-arrow-circle-left"></i>
                        {$LANG.orderForm.returnToClientArea}
                    </a>
                </p>
            {/if}

            <div class="products">
                <div class="row row-eq-height">
                    {foreach $addons as $num => $addon}
                        <div class="col-md-6">
                        <div class="product clearfix" id="product{$num}">
                            <form method="post" action="{$smarty.server.PHP_SELF}?a=add" class="form-inline">
                                <input type="hidden" name="aid" value="{$addon.id}" />
                                <header class="col-12">
                                    <span>{$addon.name}</span>
                                </header>
                                <div class="product-desc product-desc-full-width">
                                    <p>{$addon.description|nl2br}</p>
                                    <div class="input-group">
                                        <select name="productid" id="inputProductId{$num}" class="field form-control">
                                            {foreach $addon.productids as $product}
                                                <option value="{$product.id}">
                                                    {$product.product}{if $product.domain} - {$product.domain}{/if}
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    </div>
                                <div class="clearfix"></div>
                                <footer class="col-12 text-right">
                                    <div class="product-pricing">
                                        {if $addon.free}
                                            {$LANG.orderfree}
                                        {else}
                                            <span class="price">{$addon.recurringamount} {$addon.billingcycle}</span>
                                            {if $addon.setupfee}<br />+ {$addon.setupfee} {$LANG.ordersetupfee}{/if}
                                        {/if}
                                    </div>
                                    <button type="submit" class="btn btn-success btn-sm">
                                        <i class="fas fa-shopping-cart"></i>
                                        {$LANG.ordernowbutton}
                                    </button>
                                </footer>
                            </form>
                        </div>
                        </div>
                    {if $num % 2 != 0}
                </div>
                <div class="row row-eq-height">
                    {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>
