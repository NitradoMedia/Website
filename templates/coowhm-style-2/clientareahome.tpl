<div class="row profile-client-area">
<div class="col-md-8">
<div class="row">
<div class="col profile-photo">
<img class="gravatar img-radius-30 img-profile-client-area" src="{$WEB_ROOT}/templates/{$template}/img/gravatar.jpg" alt="Avatar" title="Avatar for {$loggedinuser.firstname}"/>
</div>
<div class="col profile-informations">
<h6>{$LANG.welcomeback}, {$clientsdetails.firstname} {$clientsdetails.lastname} <a href="clientarea.php?action=details"><i class="feather icon-edit"></i></a></h6>
<div class="profile-informations-info">
<span><i class="feather icon-at-sign"></i> {$clientsdetails.email} </span>
<span><i class="feather icon-phone"></i> {$clientsdetails.phonenumber} </span>
<span><i class="feather icon-paperclip"></i> {$clientsdetails.address1},{$clientsdetails.city} {$clientsdetails.country} </span>
</div>
<div class="profile-informations-text">
<span class="user-info-creditbalance">{$clientsstats.creditbalance}<a href="clientarea.php?action=addfunds">{$LANG.affiliatesbalance}</a></span>


</div>
</div>
</div>
</div>
<div class="col-md-4">
<div class="profile-informations-button">
<a href="{$WEB_ROOT}/cart.php"><i class="flaticon-028-coin-1"></i>{$LANG.navStore}</a>
<a href="cart.php?a=add&domain=register"><i class="flaticon-022-search"></i> {$LANG.clientareahostingdomain} </a>
</div>
</div>
</div>
<div class="row">
<div class="col-md-12 area-discreted-info-user">
<a href="clientarea.php?action=services"><i class="flaticon-007-safebox"></i> <span class="title">{$LANG.navservices}</span> <span>{$clientsstats.productsnumactive}</span></a>
{if $registerdomainenabled || $transferdomainenabled}
<a href="clientarea.php?action=domains"><i class="flaticon-004-diamond"></i> <span class="title">{$LANG.navdomains}</span> <span>{$clientsstats.numactivedomains}</span></a>
{elseif $condlinks.affiliates && $clientsstats.isAffiliate}
<a href="affiliates.php"><i class="flaticon-004-diamond"></i> <span class="title">{$LANG.affiliatessignups}</span> <span>{$clientsstats.numaffiliatesignups}</span></a>
{/if}
<a href="supporttickets.php"><i class="flaticon-020-gold-ingot"></i> <span class="title">{$LANG.navtickets}</span> <span>{$clientsstats.numactivetickets}</span></a>
<a href="clientarea.php?action=invoices"><i class="flaticon-033-money-bag"></i> <span class="title">{$LANG.navinvoices}</span> <span>{$clientsstats.numunpaidinvoices}</span></a>
<a href="clientarea.php?action=quotes"><i class="flaticon-010-piggy-bank"></i> <span class="title">{$LANG.quotes}</span> <span>{$clientsstats.numquotes}</span></a>
</div>
</div>

<div class="row">
<div class="col-md-12">
{foreach key=num item=invoice from=$invoices}
<div class="invoices-elements-tringo">
<span data-toggle="tooltip" data-placement="top" title="{$LANG.invoicesdatecreated}" class="time">{$invoice.datecreated}</span>
<span data-toggle="tooltip" data-placement="top" title="{$LANG.invoicesdatedue}" class="time-end">{$invoice.datedue}</span>
<span class="total" data-order="{$invoice.totalnum}">{$invoice.total}</span>
<a href="viewinvoice.php?id={$invoice.id}" class="invoice-pay-button status-{$invoice.statusClass}">{$invoice.status}</a>
</div>
{/foreach}
</div>
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
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="pull-right">
                                    <a href="{$item->getExtra('btn-link')}" class="btn btn-default bg-color-{$item->getExtra('color')} btn-xs">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                        {$item->getExtra('btn-text')}
                                    </a>
                                </div>
                            {/if}
                            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
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
