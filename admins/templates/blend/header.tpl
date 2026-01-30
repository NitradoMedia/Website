<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$pagetitle} - {$companyname} Admin</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <link href="{$WEB_ROOT}/admin/templates/{$template}/css/datatables.min.css" rel="stylesheet">
    <link href="{$WEB_ROOT}/admin/templates/{$template}/css/blend.css" rel="stylesheet">

    {$headoutput}

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js"></script>

    {$jquerycode}
    {$jscode}
</head>
<body class="admin-body {if $sidebar}has-sidebar{/if}" data-page="{$filename}">

    <!-- Top Navigation Bar -->
    <nav class="top-navbar">
        <div class="navbar-left">
            <button class="sidebar-toggle" id="sidebarToggle" title="Toggle Sidebar">
                <i class="fas fa-bars"></i>
            </button>
            <a href="{$WEB_ROOT}/admin/index.php" class="navbar-brand">
                <div class="brand-icon">
                    <i class="fas fa-shield-halved"></i>
                </div>
                <span class="brand-text">{$companyname}</span>
            </a>
        </div>

        <div class="navbar-center">
            <div class="global-search" id="globalSearch">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Search clients, orders, tickets..." id="globalSearchInput" autocomplete="off">
                <span class="search-shortcut">
                    <kbd>Ctrl</kbd>+<kbd>K</kbd>
                </span>
                <div class="search-results" id="searchResults"></div>
            </div>
        </div>

        <div class="navbar-right">
            <!-- Quick Actions -->
            <div class="navbar-item dropdown">
                <button class="navbar-btn" data-bs-toggle="dropdown" title="Quick Actions">
                    <i class="fas fa-bolt"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-end quick-actions-menu">
                    <h6 class="dropdown-header">Quick Actions</h6>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/clientsadd.php">
                        <i class="fas fa-user-plus"></i> New Client
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/orders.php">
                        <i class="fas fa-cart-plus"></i> New Order
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/supporttickets.php?action=open">
                        <i class="fas fa-ticket"></i> New Ticket
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/invoices.php?action=createinvoice">
                        <i class="fas fa-file-invoice"></i> New Invoice
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/configproducts.php">
                        <i class="fas fa-box"></i> Manage Products
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/configservers.php">
                        <i class="fas fa-server"></i> Manage Servers
                    </a>
                </div>
            </div>

            <!-- Notifications -->
            <div class="navbar-item dropdown">
                <button class="navbar-btn notification-btn" data-bs-toggle="dropdown" title="Notifications">
                    <i class="fas fa-bell"></i>
                    {if $adminnotifications|@count > 0}
                        <span class="notification-badge">{$adminnotifications|@count}</span>
                    {/if}
                </button>
                <div class="dropdown-menu dropdown-menu-end notifications-menu">
                    <div class="notifications-header">
                        <h6>Notifications</h6>
                        <a href="#" class="mark-all-read">Mark all read</a>
                    </div>
                    <div class="notifications-body">
                        {if $adminnotifications|@count > 0}
                            {foreach from=$adminnotifications item=notification}
                                <a class="notification-item" href="{$notification.url}">
                                    <div class="notification-icon {$notification.type}">
                                        <i class="fas fa-{$notification.icon|default:'info-circle'}"></i>
                                    </div>
                                    <div class="notification-content">
                                        <p class="notification-text">{$notification.title}</p>
                                        <span class="notification-time">{$notification.date}</span>
                                    </div>
                                </a>
                            {/foreach}
                        {else}
                            <div class="notifications-empty">
                                <i class="fas fa-check-circle"></i>
                                <p>No new notifications</p>
                            </div>
                        {/if}
                    </div>
                    <div class="notifications-footer">
                        <a href="{$WEB_ROOT}/admin/notifications.php">View All Notifications</a>
                    </div>
                </div>
            </div>

            <!-- To-Do -->
            <div class="navbar-item">
                <a href="{$WEB_ROOT}/admin/todolist.php" class="navbar-btn" title="To-Do List">
                    <i class="fas fa-list-check"></i>
                    {if $todocounts > 0}
                        <span class="notification-badge todo-badge">{$todocounts}</span>
                    {/if}
                </a>
            </div>

            <!-- Visit Frontend -->
            <div class="navbar-item">
                <a href="{$WEB_ROOT}/" class="navbar-btn" target="_blank" title="Visit Website">
                    <i class="fas fa-external-link-alt"></i>
                </a>
            </div>

            <!-- Admin Profile -->
            <div class="navbar-item dropdown">
                <button class="navbar-profile-btn" data-bs-toggle="dropdown">
                    <div class="profile-avatar">
                        <span>{$admin_username|substr:0:1|upper}</span>
                    </div>
                    <span class="profile-name">{$admin_username}</span>
                    <i class="fas fa-chevron-down profile-chevron"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-end profile-menu">
                    <div class="profile-menu-header">
                        <div class="profile-avatar large">
                            <span>{$admin_username|substr:0:1|upper}</span>
                        </div>
                        <div>
                            <strong>{$admin_username}</strong>
                            <small>Administrator</small>
                        </div>
                    </div>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/myaccount.php">
                        <i class="fas fa-user-gear"></i> My Account
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/configgeneral.php">
                        <i class="fas fa-cog"></i> Settings
                    </a>
                    <a class="dropdown-item" href="{$WEB_ROOT}/admin/systemactivitylog.php">
                        <i class="fas fa-clock-rotate-left"></i> Activity Log
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item logout-item" href="{$WEB_ROOT}/admin/logout.php">
                        <i class="fas fa-right-from-bracket"></i> Sign Out
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    {include file="sidebar.tpl"}

    <!-- Main Content Wrapper -->
    <main class="main-content" id="mainContent">
        <!-- Breadcrumb -->
        {if $breadcrumb}
        <div class="page-breadcrumb">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$WEB_ROOT}/admin/index.php"><i class="fas fa-home"></i></a></li>
                    {foreach from=$breadcrumb item=crumb}
                        {if $crumb.link}
                            <li class="breadcrumb-item"><a href="{$crumb.link}">{$crumb.label}</a></li>
                        {else}
                            <li class="breadcrumb-item active">{$crumb.label}</li>
                        {/if}
                    {/foreach}
                </ol>
            </nav>
        </div>
        {/if}

        <!-- Page Header -->
        {if $pagetitle}
        <div class="page-header">
            <div class="page-header-left">
                <h1 class="page-title">{$pagetitle}</h1>
                {if $pagesubtitle}<p class="page-subtitle">{$pagesubtitle}</p>{/if}
            </div>
            <div class="page-header-actions" id="pageHeaderActions">
                {$headeractions}
            </div>
        </div>
        {/if}

        <!-- Alert Messages -->
        {if $infobox}
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <i class="fas fa-info-circle"></i>
            <span>{$infobox}</span>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        {/if}

        {if $successbox}
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle"></i>
            <span>{$successbox}</span>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        {/if}

        {if $errorbox}
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle"></i>
            <span>{$errorbox}</span>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        {/if}

        <!-- Page Content -->
        <div class="page-content">
