
                </div><!-- /.main-content -->
                {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                    <div class="col-md-3 pull-md-left sidebar sidebar-secondary" style="clear: left;">
                        {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                    </div>
                {/if}
            
            <div class="clearfix"></div>
        </div>
    </div>
</section>
</div>

<div id="footer" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 row-title">
                <h4>Get in touch</h4>
                <h5>You’re a step further to make the best desicion</h5>
            </div>
        </div>
        <div class="row main-footer-content">
            <p>Hostrocket network covers +250 countries and devices ranging from<br> 
                desktops and laptops to smart phones and tablets.</p>
        </div>
        <div class="row">
            <div class="col-xs-12 col-md-4">
                <div class="contact-box">
                    <i class="hroc hroc-whatsapp"></i> +(038) 38 638036
                </div>
            </div>
            <div class="col-xs-12 col-md-4">
                <div class="contact-box">
                    <i class="hroc hroc-envelope"></i> hello@hostrocket.com
                </div>
            </div>
            <div class="col-xs-12 col-md-4">
                <div class="contact-box">
                    <i class="hroc hroc-instagram"></i> @hostrocket
                </div>
            </div>
        </div>
    </div>
</div>

<div id="fullpage-overlay" class="hidden">
    <div class="outer-wrapper">
        <div class="inner-wrapper">
            <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg">
            <br>
            <span class="msg"></span>
        </div>
    </div>
</div>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">{$LANG.close}</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body panel-body">
                {$LANG.loading}
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fas fa-circle-notch fa-spin"></i>
                    {$LANG.loading}
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    {$LANG.close}
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    {$LANG.submit}
                </button>
            </div>
        </div>
    </div>
</div>

{include file="$template/includes/generate-password.tpl"}

<script src="{assetPath file='slick.min.js'}"></script>
<script src="{assetPath file='main.js'}"></script>
{$footeroutput}

</body>
</html>
