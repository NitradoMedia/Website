{if !$loggedin & count($currencies) > 1}
				<div class="currencyChooser-dropdown">
					<button title="{$LANG.choosecurrency}" id="currencyChooser" type="button" class="drop-down-btn choose-currency" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-dollar-sign"></i> <span class="no-phone-display">{$LANG.choosecurrency}</span>
					</button>
					
					<div class="dropdown-menu" aria-labelledby="currencyChooser">
					{foreach from=$currencies item=currchoice}
				    <a class="currency {if $currency.id eq $currchoice.id}active{/if}" href="{$currentpagelinkback}currency={$currchoice.id}">
					{$currchoice.code}
					</a>
					{/foreach}
					</div>
				</div>
{/if}