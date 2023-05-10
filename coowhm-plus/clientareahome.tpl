{include file="$template/includes/flashmessage.tpl"}

<div class="row">
<div class="container-clientarea">
<span class="container-clientarea-bg"></span>
<div class="clientarea-new-header">
<div class="col profile-photo">
<img class="gravatar img-radius-30 img-profile-client-area" src="{$WEB_ROOT}/templates/{$template}/img/gravatar.jpg" alt="Avatar" title="Avatar for {$loggedinuser.firstname}"/>
<a target="_blank" href="https://gravatar.com/">{$LANG.orderForm.edit}</a>
</div>
<h5 class="header-accout-details">
<span class="username">{$clientsdetails.firstname} {$clientsdetails.lastname} !</span>
<a class="edit" href="clientarea.php?action=details">{$LANG.orderForm.update}</a>
<a class="balance" href="clientarea.php?action=addfunds">{$clientsstats.creditbalance}</a>
<span class="dash">your dashboard</span> 
<span class="adress">{$clientsdetails.address1},<br>{$clientsdetails.city} <b>{$clientsdetails.country}</b></span></h5>
</div>

</div>
</div>

<div class="row cleinareahome-sevices-boxes">
<div class="col-md-5ths col-xs-6">
<a href="clientarea.php?action=services"><i class="flaticon-007-safebox"></i> <span class="title">{$LANG.navservices}</span> <span class="number">{$clientsstats.productsnumactive}</span></a>
</div>
{if $registerdomainenabled || $transferdomainenabled}
<div class="col-md-5ths col-xs-6">
<a href="clientarea.php?action=domains"><i class="flaticon-004-diamond"></i> <span class="title">{$LANG.navdomains}</span> <span class="number">{$clientsstats.numactivedomains}</span></a>
</div>
{elseif $condlinks.affiliates && $clientsstats.isAffiliate}
<div class="col-md-5ths col-xs-6">
<a href="affiliates.php"><i class="flaticon-004-diamond"></i> <span class="title">{$LANG.affiliatessignups}</span> <span class="number">{$clientsstats.numaffiliatesignups}</span></a>
</div>
{/if}
<div class="col-md-5ths col-xs-6">
<a href="supporttickets.php"><i class="flaticon-020-gold-ingot"></i> <span class="title">{$LANG.navtickets}</span> <span class="number">{$clientsstats.numactivetickets}</span></a>
</div>
<div class="col-md-5ths col-xs-6">
<a href="clientarea.php?action=invoices"><i class="flaticon-033-money-bag"></i> <span class="title">{$LANG.navinvoices}</span> <span class="number">{$clientsstats.numunpaidinvoices}</span></a>
</div>
<div class="col-md-5ths col-xs-6">
<a href="clientarea.php?action=quotes"><i class="flaticon-010-piggy-bank"></i> <span class="title">{$LANG.quotes}</span> <span class="number">{$clientsstats.numquotes}</span></a>
</div>
</div>

<div class="row">
{foreach key=num item=invoice from=$invoices}
<div class="invoices-elements-tringo">
<span data-toggle="tooltip" data-placement="top" title="{$invoice.invoicenum}" class="number">{$LANG.invoicestitle}</span>
<!-- <span data-toggle="tooltip" data-placement="top" title="{$LANG.invoicesdatecreated}" class="time">{$invoice.datecreated}</span> -->
<!-- <span  class="time-end">{$invoice.datedue}</span> -->
<span class="total" data-order="{$invoice.totalnum}">{$invoice.total}</span>
<i data-toggle="tooltip" data-placement="top" title="{$LANG.invoicesdatedue}: {$invoice.datedue}" class="feather icon-alert-circle icon-datedue-client"></i>
<i data-toggle="tooltip" data-placement="top" title="{$LANG.invoicesunpaid}" class="feather icon-alert-octagon status-{$invoice.statusClass}-icon"></i>
<a href="viewinvoice.php?id={$invoice.id}" class="invoice-pay-button-now">{$LANG.invoicespaynow}</a>
</div>
{/foreach}
</div>

{foreach from=$addons_html item=addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

<div class="client-home-panels">
    <div class="row">
        <div class="col-sm-12">

            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="panel panel-default panel-accent-{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="panel-body">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
					<div class="panel-footer-area">
					{if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                    <a href="{$item->getExtra('btn-link')}" class="btn btn-default sucsess">{$item->getExtra('btn-text')}</a>
                    {/if}
					</div>
                </div>
            {/function}
			
			{foreach $panels as $item}
                {if $item->getExtra('colspan')}
                    {outputHomePanels}
                    {assign "panels" $panels->removeChild($item->getName())}
                {/if}
            {/foreach}

        </div>
        <div class="col-sm-6">

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-sm-6">
            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>
