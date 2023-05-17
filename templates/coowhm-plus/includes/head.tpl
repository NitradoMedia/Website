<!-- Styling -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600%7CRaleway:400,700" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/css/all.min.css?v={$versionHash}" rel="stylesheet">
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
<link href="{$WEB_ROOT}/templates/{$template}/css/bootstrap-rtl.css" rel="stylesheet">
{/if}
<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/animate.min.css">
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/main.css">
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/flickity.min.css">
<link href="{$WEB_ROOT}/templates/{$template}/css/custom.css" rel="stylesheet">
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
<link href="{$WEB_ROOT}/templates/{$template}/css/RTL.css" rel="stylesheet">
{/if}
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang|addslashes key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
<script src="{$WEB_ROOT}/templates/{$template}/js/scripts.min.js?v={$versionHash}"></script>
{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
