<div class="kb-search-background">
<form role="form" method="post" action="{routePath('knowledgebase-search')}">
    <div class="input-group input-group-lg kb-search">
        <input type="text" id="inputKnowledgebaseSearch" name="search" class="form-control" placeholder="{$LANG.clientHomeSearchKb}" />
        <span class="input-group-btn">
            <input type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
        </span>
    </div>
</form>
</div>


<h2>{$LANG.knowledgebasecategories}</h2>

{if $kbcats}
    <div class="row kbcategories">
	<div class="kc-bg-box-container col-md-8">
        {foreach from=$kbcats name=kbcats item=kbcat}
            <div class="col-sm-12">
                <a href="{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}">
                    <i class="feather icon-file"></i>
                    {$kbcat.name} <span>{$kbcat.numarticles} {$LANG.knowledgebasearticles}</Span>
                </a>
                <p>{$kbcat.description}</p>
            </div>
        {/foreach}
    </div>
	<div class="col-md-4">
	{include file="$template/template-parts/banners/banner-01.tpl"}
	</div>
	</div>
{else}
    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.knowledgebasenoarticles textcenter=true}
{/if}


