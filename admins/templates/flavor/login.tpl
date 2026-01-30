<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{$companyname} | Admin Login</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --primary: #4f46e5;
            --primary-light: #6366f1;
            --primary-dark: #4338ca;
            --bg-dark: #0f172a;
            --bg-card: #ffffff;
            --text-primary: #1e293b;
            --text-secondary: #64748b;
            --text-muted: #94a3b8;
            --border: #e2e8f0;
            --error: #ef4444;
            --error-bg: #fef2f2;
            --success: #10b981;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: var(--bg-dark);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .login-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 50%, #0f172a 100%);
            z-index: 0;
        }

        .login-bg::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle at 30% 40%, rgba(79, 70, 229, 0.15) 0%, transparent 50%),
                        radial-gradient(circle at 70% 60%, rgba(99, 102, 241, 0.1) 0%, transparent 50%);
            animation: bgFloat 20s ease-in-out infinite;
        }

        @keyframes bgFloat {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(-2%, -2%); }
        }

        .login-container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 420px;
            padding: 20px;
        }

        .login-card {
            background: var(--bg-card);
            border-radius: 20px;
            padding: 48px 40px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3),
                        0 0 0 1px rgba(255, 255, 255, 0.05);
            animation: cardAppear 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes cardAppear {
            from {
                opacity: 0;
                transform: translateY(20px) scale(0.98);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .login-logo {
            text-align: center;
            margin-bottom: 36px;
        }

        .login-logo .logo-icon {
            width: 56px;
            height: 56px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 16px;
            box-shadow: 0 8px 24px rgba(79, 70, 229, 0.3);
        }

        .login-logo .logo-icon i {
            font-size: 24px;
            color: #fff;
        }

        .login-logo h1 {
            font-size: 22px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 4px;
        }

        .login-logo p {
            font-size: 14px;
            color: var(--text-secondary);
            font-weight: 400;
        }

        .login-error {
            background: var(--error-bg);
            border: 1px solid #fecaca;
            border-radius: 12px;
            padding: 12px 16px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: shakeIn 0.5s cubic-bezier(0.36, 0.07, 0.19, 0.97);
        }

        @keyframes shakeIn {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-4px); }
            20%, 40%, 60%, 80% { transform: translateX(4px); }
        }

        .login-error i {
            color: var(--error);
            font-size: 16px;
            flex-shrink: 0;
        }

        .login-error span {
            font-size: 13px;
            color: var(--error);
            font-weight: 500;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 8px;
            letter-spacing: -0.01em;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 15px;
            transition: color 0.2s;
            z-index: 1;
        }

        .input-wrapper input {
            width: 100%;
            padding: 12px 16px 12px 46px;
            border: 2px solid var(--border);
            border-radius: 12px;
            font-size: 14px;
            font-family: inherit;
            color: var(--text-primary);
            background: #f8fafc;
            transition: all 0.2s;
            outline: none;
        }

        .input-wrapper input:hover {
            border-color: #cbd5e1;
        }

        .input-wrapper input:focus {
            border-color: var(--primary);
            background: #fff;
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
        }

        .input-wrapper input:focus + i,
        .input-wrapper input:focus ~ i {
            color: var(--primary);
        }

        .input-wrapper input::placeholder {
            color: var(--text-muted);
        }

        .form-options {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 28px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
        }

        .remember-me input[type="checkbox"] {
            width: 16px;
            height: 16px;
            border: 2px solid var(--border);
            border-radius: 4px;
            appearance: none;
            -webkit-appearance: none;
            cursor: pointer;
            transition: all 0.2s;
            position: relative;
        }

        .remember-me input[type="checkbox"]:checked {
            background: var(--primary);
            border-color: var(--primary);
        }

        .remember-me input[type="checkbox"]:checked::after {
            content: '\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 9px;
            color: #fff;
        }

        .remember-me span {
            font-size: 13px;
            color: var(--text-secondary);
            font-weight: 500;
        }

        .forgot-link {
            font-size: 13px;
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        .forgot-link:hover {
            color: var(--primary-dark);
        }

        .login-btn {
            width: 100%;
            padding: 13px 24px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: #fff;
            border: none;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 600;
            font-family: inherit;
            cursor: pointer;
            transition: all 0.2s;
            position: relative;
            overflow: hidden;
            letter-spacing: -0.01em;
        }

        .login-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 24px rgba(79, 70, 229, 0.4);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        .login-btn::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, transparent, rgba(255, 255, 255, 0.1));
        }

        .login-footer {
            text-align: center;
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid var(--border);
        }

        .login-footer p {
            font-size: 12px;
            color: var(--text-muted);
        }

        .login-footer a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }

        .twofactor-section {
            margin-top: 20px;
        }

        .twofactor-section .form-group label {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .twofactor-section .form-group label i {
            color: var(--primary);
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 36px 24px;
                border-radius: 16px;
            }

            .login-logo h1 {
                font-size: 20px;
            }

            .form-options {
                flex-direction: column;
                gap: 12px;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <div class="login-bg"></div>

    <div class="login-container">
        <div class="login-card">
            <div class="login-logo">
                <div class="logo-icon">
                    <i class="fas fa-shield-halved"></i>
                </div>
                <h1>{$companyname}</h1>
                <p>Administration Panel</p>
            </div>

            {if $incorrect}
                <div class="login-error">
                    <i class="fas fa-circle-exclamation"></i>
                    <span>{$loginmsg}</span>
                </div>
            {/if}

            <form method="post" action="{$action}">
                <input type="hidden" name="token" value="{$token}">

                <div class="form-group">
                    <label for="username">Email Address</label>
                    <div class="input-wrapper">
                        <input type="email" id="username" name="username" placeholder="admin@example.com" value="{$username}" autofocus>
                        <i class="fas fa-envelope"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" placeholder="Enter your password">
                        <i class="fas fa-lock"></i>
                    </div>
                </div>

                {if $twofactorenabled}
                <div class="twofactor-section">
                    <div class="form-group">
                        <label for="twofactorcode">
                            <i class="fas fa-shield-check"></i>
                            Two-Factor Authentication Code
                        </label>
                        <div class="input-wrapper">
                            <input type="text" id="twofactorcode" name="twofactorcode" placeholder="Enter 2FA code" autocomplete="off">
                            <i class="fas fa-key"></i>
                        </div>
                    </div>
                </div>
                {/if}

                {if $backupcodeenabled}
                <div class="form-group">
                    <label for="backupcode">Backup Code</label>
                    <div class="input-wrapper">
                        <input type="text" id="backupcode" name="backupcode" placeholder="Enter backup code" autocomplete="off">
                        <i class="fas fa-life-ring"></i>
                    </div>
                </div>
                {/if}

                <div class="form-options">
                    <label class="remember-me">
                        <input type="checkbox" name="rememberme" value="1">
                        <span>Remember me</span>
                    </label>
                    <a href="{$smarty.const.WHMCS_URL}/password/reset" class="forgot-link">Forgot password?</a>
                </div>

                <button type="submit" class="login-btn">
                    <i class="fas fa-right-to-bracket"></i>&nbsp;&nbsp;Sign In
                </button>
            </form>

            <div class="login-footer">
                <p>Powered by <a href="https://www.whmcs.com" target="_blank">WHMCS</a></p>
            </div>
        </div>
    </div>
</body>
</html>
