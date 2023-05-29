{if $loginpage eq 0 and $templatefile ne "clientregister"}<!-- login and register page without the default header and footer -->
                                        </div><!-- /.main-content -->
                                    <div class="clearfix"></div>
                                </div><!-- end row -->
                            </div><!-- end container -->
                        </section><!-- end main body section -->
                    </div><!-- end page wrapper -->
                </div><!-- end main body -->
            </div><!-- end coodiv inner content -->
        </div><!-- end coodiv content -->
    </div><!-- end coodiv wrapper -->
</div><!-- end coodiv main container -->
<section id="footer" class="footer-collapsed"><!-- footer start -->
<h6 class="d-none">this is footer</h6>
<div class="footer-copyright">Copyright &copy; {$date_year} {$companyname}.</div>
<div class="footer-menu">
<a href="{$WEB_ROOT}/cart.php" target="_blank">{$LANG.navStore}</a>
{if !$loggedin}
<a href="{$WEB_ROOT}/register.php" target="">{$LANG.register}</a>
{else}
<a href="clientarea.php" target="_blank">{$LANG.clientareanavhome}</a>
{/if}
	<a href="{$WEB_ROOT}/serverstatus.php" target="">{$LANG.networkstatustitle}</a>
	<a href="{$WEB_ROOT}/contact.php" target="">{$LANG.contactus}</a>
	<a href="{$WEB_ROOT}/knowledgebase.php" target="">{$LANG.knowledgebasetitle}</a>
	
</div>
	
</section><!-- footer end -->
{/if}
{if $loggedin}<span id="gravataremail" class="hidden">{$clientsdetails.email}</span><!-- gravatar email -->{/if}

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
                <h4 class="modal-title">title</h4>
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
{$footeroutput}
<script src="{$WEB_ROOT}/templates/{$template}/js/jquery.slimscroll.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/main.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/md5.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/flickity.pkgd.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/wow.js"></script>


<script>
$(document).ready(function(){
    if ($('#gravataremail').length) {
	var email = document.getElementById('gravataremail').innerText;
	if(email != ''){
		var imgUrl = 'https://gravatar.com/avatar/'+MD5(email)+'';
		$.ajax({
		    url:imgUrl,
		    type:"HEAD",
		    crossDomain:true,
		    success:function(){
		        $(".gravatar").attr("src",imgUrl);
		    }
		});
	}
	}
});
</script>
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
<script>
$('.header-main-slider').flickity({
  prevNextButtons: false,
  pageDots: true,
  autoPlay: 5000,
  rightToLeft: true
});
$('.header-main-nav').flickity({
  asNavFor: '.header-main-slider',
  prevNextButtons: false,
  pageDots: false,
  contain: true,
  rightToLeft: true
  
});
$('.banner-slider').flickity({
  prevNextButtons: false,
  pageDots: true,
  rightToLeft: true
});
</Script>
{else}
<script>
$('.header-main-slider').flickity({
  prevNextButtons: false,
  pageDots: true,
  autoPlay: 5000
  
});
$('.header-main-nav').flickity({
  asNavFor: '.header-main-slider',
  prevNextButtons: false,
  pageDots: false,
  contain: true
  
});
$('.banner-slider').flickity({
  prevNextButtons: false,
  pageDots: true,
});
</Script>
{/if}
<script>
new WOW().init();
</script>
</body>
</html>
