{include file="orderforms/antler/common.tpl"}
<div id="order-standard_cart">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center">
                <h2 class="section-heading mergecolor border-0">{$LANG.orderconfirmation}</h2>
                <p class="section-subheading mergecolor">{$LANG.orderreceived}</p>
            </div>
            <div class="alert alert-info order-confirmation mt-5 mb-0">
                {$LANG.ordernumberis} <span>{$ordernumber}</span>
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
        <div class="col-md-12 mt-5">
            <div class="bg-seccolorstyle sec-bg1 p-80 br-12 noshadow">
                {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}
                <p class="text-center mergecolor">{$LANG.orderfinalinstructions}</p>
                {if $expressCheckoutInfo}
                    <div class="alert alert-info text-center">
                        {$expressCheckoutInfo}
                    </div>
                {elseif $expressCheckoutError}
                    <div class="alert alert-danger text-center">
                        {$expressCheckoutError}
                    </div>
                {elseif $invoiceid && !$ispaid}
                    <div class="alert alert-warning text-center">
                        {$LANG.ordercompletebutnotpaid}
                    </div>
                {/if}
                {foreach $addons_html as $addon_html}
                    <div class="order-confirmation-addon-output">
                        {$addon_html}
                    </div>
                {/foreach}
                {if $ispaid}
                    <!-- Enter any HTML code which should be displayed when a user has completed checkout here -->
                    <!-- Common uses of this include conversion and affiliate tracking scripts -->
                {/if}
                <div class="text-center">
                    <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoiceid}" target="_blank" class="btn btn-default-yellow-fill alert-link">
                       {$LANG.invoicespaynow} {$LANG.invoicenumber}{$invoiceid}
                    </a>

                    <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-default">
                        {$LANG.orderForm.continueToClientArea}
                        &nbsp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>

            {if $hasRecommendations}
                {include file="orderforms/antler/includes/product-recommendations.tpl"}
            {/if}

        </div>
    </div>
</div>
