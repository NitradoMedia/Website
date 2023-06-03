{include file="orderforms/antler/common.tpl"}
<div id="order-standard_cart">
    <div class="row">
        <div class="col-md-12">
            <div class="header-lined">
                <div class="text-center">
                    <h1 class="section-heading mergecolor border-0">{$LANG.thereisaproblem}</h1>
                    <p class="section-subheading mergecolor">{$errormsg}</p>
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
        </div>
        <div class="col-md-12 mt-50">
            <div class="bg-seccolorstyle sec-bg1 p-50 br-12 noshadow">
                {include file="orderforms/antler/sidebar-categories-collapsed.tpl"}
                <div class="alert alert-danger error-heading">
                    <i class="fas fa-exclamation-triangle"></i>
                    {$errortitle}
                </div>
                <div class="row">
                    <div class="col-sm-12 text-center">
                        
                        <div class="text-center">
                            <a href="javascript:history.go(-1)" class="btn btn-default-yellow-fill">
                                <i class="fas fa-arrow-left"></i>&nbsp;
                                {$LANG.problemgoback}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>