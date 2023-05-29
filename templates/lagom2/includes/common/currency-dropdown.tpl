{if file_exists("templates/$template/includes/common/overwrites/currency-dropdown.tpl")}
     {include file="{$template}/includes/common/overwrites/currency-dropdown.tpl"}  
{else}
    {if $currentUrl|strstr:"?"}
        {$currentpagelinkback = rtrim($currentpagelinkback, '&amp;')}
        {$divChar = "&amp;"}
    {else}
        {$currentpagelinkback = rtrim($currentpagelinkback, '?')}
        {$divChar = "?"}
    {/if}
    {if !$loggedin && $currencies}
        <div class="dropdown-menu dropdown-menu-right">
            <div class="dropdown-menu-items has-scroll">
                {foreach $currencies as $currency}
                    <div class="dropdown-menu-item {if $activeCurrency.id == $currency.id}active{/if}">
                        <a href="{$currentpagelinkback}{$divChar}currency={$currency.id}">
                            <span>{$currency.code}</span>
                        </a>
                    </div>
                {/foreach}
            </div>                 
        </div>
    {/if}
{/if}