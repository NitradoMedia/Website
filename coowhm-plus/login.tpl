<div class="custom-login-page-v2">
<div class="container">

<div class="login-page-header row">
<div class="col-md-6">
<a class="navbar-brand nobg" href="{$WEB_ROOT}/index.php">
<img class="w-logo" src="{$WEB_ROOT}/templates/{$template}/img/logo.png" alt="{$companyname}" />
<span class="w-text">{$companyname}</span>
</a>
</div>
<div class="col-md-6 text-right header-link">
<span>{$LANG.registerintro}</span> <a href="register.php">{$LANG.remoteAuthn.titleSignUpVerb}</a>
</div>
</div>

<div class="login-custom-layout">
<div class="login-wrapper">
<div class="login-form-container">
    {include file="$template/includes/flashmessage.tpl"}
    <h5 class="login-title">{$LANG.clientareahomeloginbtn}<span>{$LANG.restrictedpage}</span></h5>
	
	
	<div class="{if !$linkableProviders}hidden{/if}">
    {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
	<div class="divider">
			<span></span>
			<span>{$LANG.remoteAuthn.titleOr}</span>
			<span></span>
	</div>
    </div>
		
		
    <div class="providerLinkingFeedback"></div>
            <form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
                <div class="form-group">
                    <input type="email" name="username" class="form-control" id="inputEmail" placeholder="{$LANG.pwresetemailrequired}" autofocus>
                </div>

                <div class="form-group">
                    <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.twofaconfirmpw}" autocomplete="off" >
                </div>
				<div class="row">
				<div class="col-md-6">
				<div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="rememberme" id="rememberme">
                <label class="custom-control-label" for="rememberme">{$LANG.loginrememberme}</label>
                </div>
				</div>
				<div class="col-md-6 text-right">
				<a href="{routePath('password-reset-begin')}" class="forgotpw-txt">{$LANG.forgotpw}</a>
				</div>
				</div>
                {if $captcha->isEnabled()}
                    <div class="text-center margin-bottom">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}
                <div align="center">
                    <input id="login" type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}" value="{$LANG.loginbutton}" />
                </div>
            </form>

        
</div>
</div>
</div>
</div>
</div>