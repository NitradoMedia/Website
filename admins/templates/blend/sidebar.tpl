<!-- Admin Sidebar Navigation -->
<aside class="admin-sidebar" id="adminSidebar">
    <div class="sidebar-inner">
        <!-- Sidebar Header / Logo -->
        <div class="sidebar-header">
            <a href="{$WEB_ROOT}/admin/index.php" class="sidebar-logo">
                <div class="sidebar-logo-icon">
                    <i class="fas fa-shield-halved"></i>
                </div>
                <span class="sidebar-logo-text">{$companyname}</span>
            </a>
            <button class="sidebar-close-btn" id="sidebarClose">
                <i class="fas fa-xmark"></i>
            </button>
        </div>

        <!-- Navigation -->
        <nav class="sidebar-nav">
            <!-- Dashboard -->
            <div class="nav-section">
                <a href="{$WEB_ROOT}/admin/index.php" class="nav-item {if $filename == 'index'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-gauge-high"></i></span>
                    <span class="nav-label">Dashboard</span>
                </a>
            </div>

            <!-- Clients & Users -->
            <div class="nav-section">
                <div class="nav-section-title">Clients</div>
                <a href="{$WEB_ROOT}/admin/clients.php" class="nav-item {if $filename == 'clients'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-users"></i></span>
                    <span class="nav-label">Client List</span>
                </a>
                <a href="{$WEB_ROOT}/admin/clientsadd.php" class="nav-item {if $filename == 'clientsadd'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-user-plus"></i></span>
                    <span class="nav-label">Add New Client</span>
                </a>
                <a href="{$WEB_ROOT}/admin/clientssummary.php" class="nav-item {if $filename == 'clientssummary'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-address-card"></i></span>
                    <span class="nav-label">Client Contacts</span>
                </a>
            </div>

            <!-- Orders -->
            <div class="nav-section">
                <div class="nav-section-title">Orders</div>
                <a href="{$WEB_ROOT}/admin/orders.php" class="nav-item {if $filename == 'orders'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-shopping-cart"></i></span>
                    <span class="nav-label">Orders</span>
                    {if $pendingorderscount > 0}
                        <span class="nav-badge">{$pendingorderscount}</span>
                    {/if}
                </a>
                <a href="{$WEB_ROOT}/admin/orders.php?status=Pending" class="nav-item">
                    <span class="nav-icon"><i class="fas fa-clock"></i></span>
                    <span class="nav-label">Pending Orders</span>
                </a>
                <a href="{$WEB_ROOT}/admin/orders.php?status=Fraud" class="nav-item">
                    <span class="nav-icon"><i class="fas fa-triangle-exclamation"></i></span>
                    <span class="nav-label">Fraud Orders</span>
                </a>
                <a href="{$WEB_ROOT}/admin/cancelrequests.php" class="nav-item {if $filename == 'cancelrequests'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-ban"></i></span>
                    <span class="nav-label">Cancellations</span>
                    {if $cancellationrequestscount > 0}
                        <span class="nav-badge warning">{$cancellationrequestscount}</span>
                    {/if}
                </a>
            </div>

            <!-- Services & Products -->
            <div class="nav-section">
                <div class="nav-section-title">Services</div>
                <a href="{$WEB_ROOT}/admin/clientsservices.php" class="nav-item {if $filename == 'clientsservices'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-cubes"></i></span>
                    <span class="nav-label">Products / Services</span>
                </a>
                <a href="{$WEB_ROOT}/admin/clientsdomains.php" class="nav-item {if $filename == 'clientsdomains'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-globe"></i></span>
                    <span class="nav-label">Domains</span>
                </a>
                <a href="{$WEB_ROOT}/admin/addons.php" class="nav-item {if $filename == 'addons'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-puzzle-piece"></i></span>
                    <span class="nav-label">Addons</span>
                </a>
            </div>

            <!-- Billing & Finance -->
            <div class="nav-section">
                <div class="nav-section-title">Billing</div>
                <a href="{$WEB_ROOT}/admin/invoices.php" class="nav-item {if $filename == 'invoices'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-file-invoice-dollar"></i></span>
                    <span class="nav-label">Invoices</span>
                    {if $overdueinvoicescount > 0}
                        <span class="nav-badge danger">{$overdueinvoicescount}</span>
                    {/if}
                </a>
                <a href="{$WEB_ROOT}/admin/transactions.php" class="nav-item {if $filename == 'transactions'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-money-bill-transfer"></i></span>
                    <span class="nav-label">Transactions</span>
                </a>
                <a href="{$WEB_ROOT}/admin/billableitems.php" class="nav-item {if $filename == 'billableitems'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-receipt"></i></span>
                    <span class="nav-label">Billable Items</span>
                </a>
                <a href="{$WEB_ROOT}/admin/quotes.php" class="nav-item {if $filename == 'quotes'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-file-contract"></i></span>
                    <span class="nav-label">Quotes</span>
                </a>
                <a href="{$WEB_ROOT}/admin/creditnotes.php" class="nav-item {if $filename == 'creditnotes'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-file-circle-minus"></i></span>
                    <span class="nav-label">Credit Notes</span>
                </a>
                <a href="{$WEB_ROOT}/admin/taxrules.php" class="nav-item {if $filename == 'taxrules'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-percent"></i></span>
                    <span class="nav-label">Tax Rules</span>
                </a>
            </div>

            <!-- Support -->
            <div class="nav-section">
                <div class="nav-section-title">Support</div>
                <a href="{$WEB_ROOT}/admin/supporttickets.php" class="nav-item {if $filename == 'supporttickets'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-headset"></i></span>
                    <span class="nav-label">Support Tickets</span>
                    {if $ticketsawaitingreplycount > 0}
                        <span class="nav-badge">{$ticketsawaitingreplycount}</span>
                    {/if}
                </a>
                <a href="{$WEB_ROOT}/admin/announcements.php" class="nav-item {if $filename == 'announcements'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-bullhorn"></i></span>
                    <span class="nav-label">Announcements</span>
                </a>
                <a href="{$WEB_ROOT}/admin/knowledgebase.php" class="nav-item {if $filename == 'knowledgebase'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-book-open"></i></span>
                    <span class="nav-label">Knowledge Base</span>
                </a>
                <a href="{$WEB_ROOT}/admin/downloads.php" class="nav-item {if $filename == 'downloads'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-download"></i></span>
                    <span class="nav-label">Downloads</span>
                </a>
                <a href="{$WEB_ROOT}/admin/networkissues.php" class="nav-item {if $filename == 'networkissues'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-tower-broadcast"></i></span>
                    <span class="nav-label">Network Issues</span>
                </a>
            </div>

            <!-- Reports -->
            <div class="nav-section">
                <div class="nav-section-title">Reports</div>
                <a href="{$WEB_ROOT}/admin/reports.php" class="nav-item {if $filename == 'reports'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-chart-pie"></i></span>
                    <span class="nav-label">Reports</span>
                </a>
                <a href="{$WEB_ROOT}/admin/reports.php?report=income" class="nav-item">
                    <span class="nav-icon"><i class="fas fa-chart-line"></i></span>
                    <span class="nav-label">Income Report</span>
                </a>
                <a href="{$WEB_ROOT}/admin/reports.php?report=tickets_by_department" class="nav-item">
                    <span class="nav-icon"><i class="fas fa-chart-bar"></i></span>
                    <span class="nav-label">Ticket Reports</span>
                </a>
            </div>

            <!-- Setup / Configuration -->
            <div class="nav-section">
                <div class="nav-section-title">Setup</div>
                <a href="{$WEB_ROOT}/admin/configgeneral.php" class="nav-item {if $filename == 'configgeneral'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-gear"></i></span>
                    <span class="nav-label">General Settings</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configproducts.php" class="nav-item {if $filename == 'configproducts'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-box"></i></span>
                    <span class="nav-label">Products / Services</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configservers.php" class="nav-item {if $filename == 'configservers'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-server"></i></span>
                    <span class="nav-label">Servers</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configgateways.php" class="nav-item {if $filename == 'configgateways'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-credit-card"></i></span>
                    <span class="nav-label">Payment Gateways</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configdomainregistrars.php" class="nav-item {if $filename == 'configdomainregistrars'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-earth-americas"></i></span>
                    <span class="nav-label">Domain Registrars</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configdomainpricing.php" class="nav-item {if $filename == 'configdomainpricing'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-tags"></i></span>
                    <span class="nav-label">Domain Pricing</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configemails.php" class="nav-item {if $filename == 'configemails'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-envelope"></i></span>
                    <span class="nav-label">Email Templates</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configticketdepartments.php" class="nav-item {if $filename == 'configticketdepartments'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-sitemap"></i></span>
                    <span class="nav-label">Support Departments</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configautomation.php" class="nav-item {if $filename == 'configautomation'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-robot"></i></span>
                    <span class="nav-label">Automation</span>
                </a>
                <a href="{$WEB_ROOT}/admin/addonmodules.php" class="nav-item {if $filename == 'addonmodules'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-plug"></i></span>
                    <span class="nav-label">Addon Modules</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configadmins.php" class="nav-item {if $filename == 'configadmins'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-user-shield"></i></span>
                    <span class="nav-label">Admin Accounts</span>
                </a>
                <a href="{$WEB_ROOT}/admin/configadminroles.php" class="nav-item {if $filename == 'configadminroles'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-lock"></i></span>
                    <span class="nav-label">Admin Roles</span>
                </a>
            </div>

            <!-- Utilities -->
            <div class="nav-section">
                <div class="nav-section-title">Utilities</div>
                <a href="{$WEB_ROOT}/admin/systemhealthandupdates.php" class="nav-item {if $filename == 'systemhealthandupdates'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-heart-pulse"></i></span>
                    <span class="nav-label">System Health</span>
                </a>
                <a href="{$WEB_ROOT}/admin/systemactivitylog.php" class="nav-item {if $filename == 'systemactivitylog'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-list-ul"></i></span>
                    <span class="nav-label">Activity Log</span>
                </a>
                <a href="{$WEB_ROOT}/admin/systememaillog.php" class="nav-item {if $filename == 'systememaillog'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-envelope-open-text"></i></span>
                    <span class="nav-label">Email Log</span>
                </a>
                <a href="{$WEB_ROOT}/admin/systemmodulelog.php" class="nav-item {if $filename == 'systemmodulelog'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-file-lines"></i></span>
                    <span class="nav-label">Module Log</span>
                </a>
                <a href="{$WEB_ROOT}/admin/utilities.php" class="nav-item {if $filename == 'utilities'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-screwdriver-wrench"></i></span>
                    <span class="nav-label">Utilities</span>
                </a>
                <a href="{$WEB_ROOT}/admin/systemmaintenance.php" class="nav-item {if $filename == 'systemmaintenance'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-database"></i></span>
                    <span class="nav-label">Database Status</span>
                </a>
                <a href="{$WEB_ROOT}/admin/whois.php" class="nav-item {if $filename == 'whois'}active{/if}">
                    <span class="nav-icon"><i class="fas fa-magnifying-glass"></i></span>
                    <span class="nav-label">WHOIS Lookup</span>
                </a>
            </div>

            <!-- Addons (dynamic) -->
            {if $addonmodules}
            <div class="nav-section">
                <div class="nav-section-title">Addons</div>
                {foreach from=$addonmodules item=addon}
                    <a href="{$WEB_ROOT}/admin/addonmodules.php?module={$addon.module}" class="nav-item">
                        <span class="nav-icon"><i class="fas fa-{$addon.icon|default:'puzzle-piece'}"></i></span>
                        <span class="nav-label">{$addon.name}</span>
                    </a>
                {/foreach}
            </div>
            {/if}
        </nav>

        <!-- Sidebar Footer -->
        <div class="sidebar-footer">
            <div class="sidebar-footer-info">
                <span class="whmcs-version">WHMCS {$whmcsversion}</span>
            </div>
        </div>
    </div>
</aside>

<!-- Sidebar Overlay for Mobile -->
<div class="sidebar-overlay" id="sidebarOverlay"></div>
