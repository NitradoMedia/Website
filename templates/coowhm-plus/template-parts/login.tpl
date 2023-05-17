<li>
<div class="dropdown drp-user {if !$loggedin}not-login{/if}">
        <a href="javascript:" class="dropdown-toggle f-15" data-toggle="dropdown">
		{if $loggedin}
        <img src="{$WEB_ROOT}/templates/{$template}/img/gravatar.jpg" class="img-radius-30 img-30 gravatar" alt="User-Profile-Image">
		<span class="user-name-header-drop">{$clientsdetails.firstname}</span>
		{else}	 
		<i class="feather icon-user"></i>
		{/if}
        </a>
		
        <div class="dropdown-menu dropdown-menu-right profile-notification{if $loggedin} logined-user-drop-down{/if}">
		{if $loggedin}
		<div class="ligon-head">
                <h6 class="d-inline-block m-b-0">{$LANG.welcomeback}, {$clientsdetails.firstname}</h6>
        </div>
		<div class="header-user-info-container">
		<div class="header-user-info-header">
		<span class="header-user-info-header-avatar">
		<img src="{$WEB_ROOT}/templates/{$template}/img/gravatar.jpg" class="img-radius-30 gravatar" alt="User-Profile-Image">
		<a target="_blank" href="https://gravatar.com/">{$LANG.orderForm.edit}</a>
		</span>
		<span class="user-name">{$clientsdetails.firstname} {$clientsdetails.lastname}</span>
		<span class="user-info">{$clientsstats.creditbalance}</span>
		<a href="{$WEB_ROOT}/clientarea.php?action=services" class="user-services"><i class="feather icon-zap"></i> {$clientsstats.productsnumactive} {$LANG.navservices} </a>
		<a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="user-invoices"><i class="feather icon-credit-card"></i> {$clientsstats.numunpaidinvoices} {$LANG.navinvoices} </a>
		</div>
		<ul class="header-user-info-links">
		<li><a href="{$WEB_ROOT}/clientarea.php"><i class="feather icon-user"></i> {$LANG.clientareanavhome} <span>{$LANG.clientareatitle}</span><i class="fas fa-angle-right"></i></a></li>
		<li><a href="{$WEB_ROOT}/clientarea.php?action=details"><i class="feather icon-sliders"></i> {$LANG.clientareanavdetails} <span>{$LANG.clientareaupdateyourdetails}</span><i class="fas fa-angle-right"></i></a></li>
		<li><a href="{$WEB_ROOT}/clientarea.php?action=contacts"><i class="feather icon-share-2"></i> {$LANG.clientareanavcontacts} <span>{$LANG.subaccountpermscontacts}</span><i class="fas fa-angle-right"></i></a></li>
		<li><a href="{$WEB_ROOT}/clientarea.php?action=emails"><i class="feather icon-mail"></i> {$LANG.clientareaemails} <span>{$LANG.clientareaemaildesc}</span><i class="fas fa-angle-right"></i></a></li>
		<li><a href="{$WEB_ROOT}/clientarea.php?action=changepw"><i class="feather icon-unlock"></i> {$LANG.clientareanavchangepw} <span>{$LANG.clientareanavchangepw}</span><i class="fas fa-angle-right"></i></a></li>
		</ul>
		
		<div class="row liginned-user-menu">
		<a data-toggle="tooltip" data-placement="top" title="{$LANG.navtickets}" href="{$WEB_ROOT}/supporttickets.php"  href="#" class="col-md-4 acount-top-header-acc">
		<i class="feather icon-inbox"></i>
		</a>
		<a data-toggle="tooltip" data-placement="top" title="{$LANG.navinvoices}" href="{$WEB_ROOT}/clientarea.php?action=invoices" href="#" class="col-md-4 acount-top-header-acc np-bord-right">
		<i class="feather icon-clipboard"></i>
		</a>
		<a data-toggle="tooltip" data-placement="top" title="{$LANG.logouttitle}" href="{$WEB_ROOT}/logout.php" class="col-md-4 acount-top-header-acc">
		<i class="feather icon-power"></i>
		</a>
		</div>
		
		</div>
		{else}
		<div class="ligon-head">
                <h6 class="d-inline-block m-b-0">{$LANG.websitepanellogin}</h6>
        </div>
		<div class="header-login-container">
        <form method="post" action="{$systemurl}dologin.php" class="login-form">
            <div class="form-group">
			    <i class="feather icon-user"></i>
                <input type="email" name="username" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
            </div>
            <div class="form-group">
			   <i class="feather icon-lock"></i>
                <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" >
            </div>
			<div class="row mr-bt-20">
			<div class="col-md-6">
			<div class="custom-control custom-checkbox p-t-5">
            <input type="checkbox" class="custom-control-input" name="rememberme" id="rememberme">
            <label class="custom-control-label" for="rememberme">{$LANG.loginrememberme}</label>
            </div>
			</div>
            <div class="col-md-6">
			<input id="login" type="submit" class="header-login-button" value="{$LANG.loginbutton}" />
			</div>
			</div>
            <div class="header-login-fgtpss">
            <a href="{$systemurl}pwreset.php" class="">{$LANG.forgotpw}</a> {$LANG.or} <a href="{$systemurl}register.php" class="">{$LANG.register}</a>
            </div>
        </form>
		<div class="header-social-login {if !$linkableProviders}hidden{/if}">
		{include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
		</div>
        </div>  		
		{/if}	
        </div>
</div>
</li>