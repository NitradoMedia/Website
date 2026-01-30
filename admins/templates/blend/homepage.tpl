<!-- Dashboard Home Page -->
<div class="dashboard">
    <!-- Stats Overview Cards -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-card-body">
                <div class="stat-info">
                    <span class="stat-label">Total Income</span>
                    <h3 class="stat-value">{$revenue.today}</h3>
                    <span class="stat-change positive">
                        <i class="fas fa-arrow-up"></i> Today
                    </span>
                </div>
                <div class="stat-icon income">
                    <i class="fas fa-dollar-sign"></i>
                </div>
            </div>
            <div class="stat-card-footer">
                <a href="{$WEB_ROOT}/admin/invoices.php">View Invoices <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-body">
                <div class="stat-info">
                    <span class="stat-label">Active Clients</span>
                    <h3 class="stat-value">{$stats.totalclients}</h3>
                    <span class="stat-sub">{$stats.newclients} new this month</span>
                </div>
                <div class="stat-icon clients">
                    <i class="fas fa-users"></i>
                </div>
            </div>
            <div class="stat-card-footer">
                <a href="{$WEB_ROOT}/admin/clients.php">View Clients <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-body">
                <div class="stat-info">
                    <span class="stat-label">Active Services</span>
                    <h3 class="stat-value">{$stats.activeservices}</h3>
                    <span class="stat-sub">{$stats.totalservices} total</span>
                </div>
                <div class="stat-icon services">
                    <i class="fas fa-cubes"></i>
                </div>
            </div>
            <div class="stat-card-footer">
                <a href="{$WEB_ROOT}/admin/clientsservices.php">View Services <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-card-body">
                <div class="stat-info">
                    <span class="stat-label">Open Tickets</span>
                    <h3 class="stat-value">{$stats.opentickets}</h3>
                    <span class="stat-change {if $stats.opentickets > 0}warning{else}positive{/if}">
                        {if $stats.opentickets > 0}
                            <i class="fas fa-exclamation-circle"></i> Needs attention
                        {else}
                            <i class="fas fa-check-circle"></i> All clear
                        {/if}
                    </span>
                </div>
                <div class="stat-icon tickets">
                    <i class="fas fa-headset"></i>
                </div>
            </div>
            <div class="stat-card-footer">
                <a href="{$WEB_ROOT}/admin/supporttickets.php">View Tickets <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
    </div>

    <!-- Secondary Stats Row -->
    <div class="stats-grid secondary">
        <div class="stat-card mini">
            <div class="stat-mini-body">
                <div class="stat-icon-mini pending">
                    <i class="fas fa-clock"></i>
                </div>
                <div>
                    <span class="stat-mini-value">{$stats.pendingorders}</span>
                    <span class="stat-mini-label">Pending Orders</span>
                </div>
            </div>
        </div>
        <div class="stat-card mini">
            <div class="stat-mini-body">
                <div class="stat-icon-mini overdue">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <div>
                    <span class="stat-mini-value">{$stats.overdueinvoices}</span>
                    <span class="stat-mini-label">Overdue Invoices</span>
                </div>
            </div>
        </div>
        <div class="stat-card mini">
            <div class="stat-mini-body">
                <div class="stat-icon-mini cancellations">
                    <i class="fas fa-ban"></i>
                </div>
                <div>
                    <span class="stat-mini-value">{$stats.cancellations}</span>
                    <span class="stat-mini-label">Cancellation Requests</span>
                </div>
            </div>
        </div>
        <div class="stat-card mini">
            <div class="stat-mini-body">
                <div class="stat-icon-mini domains">
                    <i class="fas fa-globe"></i>
                </div>
                <div>
                    <span class="stat-mini-value">{$stats.activedomains}</span>
                    <span class="stat-mini-label">Active Domains</span>
                </div>
            </div>
        </div>
        <div class="stat-card mini">
            <div class="stat-mini-body">
                <div class="stat-icon-mini transfers">
                    <i class="fas fa-exchange-alt"></i>
                </div>
                <div>
                    <span class="stat-mini-value">{$stats.pendingtransfers}</span>
                    <span class="stat-mini-label">Pending Transfers</span>
                </div>
            </div>
        </div>
        <div class="stat-card mini">
            <div class="stat-mini-body">
                <div class="stat-icon-mini todo">
                    <i class="fas fa-list-check"></i>
                </div>
                <div>
                    <span class="stat-mini-value">{$stats.todoitems}</span>
                    <span class="stat-mini-label">To-Do Items</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content Grid -->
    <div class="dashboard-grid">
        <!-- Income Chart -->
        <div class="dashboard-card chart-card">
            <div class="card-header">
                <div class="card-header-left">
                    <h3 class="card-title">Income Overview</h3>
                    <p class="card-subtitle">Monthly revenue for the current year</p>
                </div>
                <div class="card-header-actions">
                    <div class="chart-period-selector">
                        <button class="period-btn active" data-period="monthly">Monthly</button>
                        <button class="period-btn" data-period="daily">Daily</button>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <canvas id="incomeChart" height="300"></canvas>
            </div>
        </div>

        <!-- Recent Orders -->
        <div class="dashboard-card">
            <div class="card-header">
                <div class="card-header-left">
                    <h3 class="card-title">Recent Orders</h3>
                    <p class="card-subtitle">Latest orders placed</p>
                </div>
                <a href="{$WEB_ROOT}/admin/orders.php" class="card-header-link">View All</a>
            </div>
            <div class="card-body no-padding">
                <div class="data-table-wrapper">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Order #</th>
                                <th>Client</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            {if $recentorders}
                                {foreach from=$recentorders item=order}
                                <tr>
                                    <td><a href="{$WEB_ROOT}/admin/orders.php?action=view&id={$order.id}" class="table-link">#{$order.id}</a></td>
                                    <td>
                                        <a href="{$WEB_ROOT}/admin/clientssummary.php?userid={$order.userid}" class="table-link">{$order.client}</a>
                                    </td>
                                    <td class="fw-600">{$order.amount}</td>
                                    <td>
                                        <span class="status-badge {$order.status|lower}">{$order.status}</span>
                                    </td>
                                    <td class="text-muted">{$order.date}</td>
                                </tr>
                                {/foreach}
                            {else}
                                <tr>
                                    <td colspan="5" class="empty-state">
                                        <i class="fas fa-inbox"></i>
                                        <p>No recent orders</p>
                                    </td>
                                </tr>
                            {/if}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Support Tickets -->
        <div class="dashboard-card">
            <div class="card-header">
                <div class="card-header-left">
                    <h3 class="card-title">Tickets Awaiting Reply</h3>
                    <p class="card-subtitle">Tickets needing your attention</p>
                </div>
                <a href="{$WEB_ROOT}/admin/supporttickets.php" class="card-header-link">View All</a>
            </div>
            <div class="card-body no-padding">
                <div class="ticket-list">
                    {if $ticketsawaitingreply}
                        {foreach from=$ticketsawaitingreply item=ticket}
                        <a href="{$WEB_ROOT}/admin/supporttickets.php?action=view&id={$ticket.id}" class="ticket-item">
                            <div class="ticket-priority {$ticket.priority|lower}"></div>
                            <div class="ticket-info">
                                <div class="ticket-title">
                                    <span class="ticket-id">#{$ticket.tid}</span>
                                    {$ticket.title}
                                </div>
                                <div class="ticket-meta">
                                    <span><i class="fas fa-user"></i> {$ticket.client}</span>
                                    <span><i class="fas fa-folder"></i> {$ticket.department}</span>
                                    <span><i class="fas fa-clock"></i> {$ticket.lastreply}</span>
                                </div>
                            </div>
                            <div class="ticket-status">
                                <span class="status-badge {$ticket.status|lower}">{$ticket.status}</span>
                            </div>
                        </a>
                        {/foreach}
                    {else}
                        <div class="empty-state-card">
                            <i class="fas fa-check-circle"></i>
                            <h4>All caught up!</h4>
                            <p>No tickets awaiting reply</p>
                        </div>
                    {/if}
                </div>
            </div>
        </div>

        <!-- To-Do List -->
        <div class="dashboard-card">
            <div class="card-header">
                <div class="card-header-left">
                    <h3 class="card-title">To-Do List</h3>
                    <p class="card-subtitle">Your pending tasks</p>
                </div>
                <a href="{$WEB_ROOT}/admin/todolist.php" class="card-header-link">Manage</a>
            </div>
            <div class="card-body no-padding">
                <div class="todo-list">
                    {if $todoitems}
                        {foreach from=$todoitems item=todo}
                        <div class="todo-item {if $todo.status == 'Completed'}completed{/if}">
                            <label class="todo-checkbox">
                                <input type="checkbox" {if $todo.status == 'Completed'}checked{/if} data-todoid="{$todo.id}">
                                <span class="checkmark"></span>
                            </label>
                            <div class="todo-info">
                                <span class="todo-title">{$todo.title}</span>
                                <span class="todo-date"><i class="fas fa-calendar"></i> {$todo.duedate}</span>
                            </div>
                            <span class="todo-status status-badge {$todo.status|lower}">{$todo.status}</span>
                        </div>
                        {/foreach}
                    {else}
                        <div class="empty-state-card">
                            <i class="fas fa-clipboard-check"></i>
                            <h4>No tasks</h4>
                            <p>Your to-do list is empty</p>
                        </div>
                    {/if}
                </div>
            </div>
        </div>

        <!-- Recent Activity / Activity Log -->
        <div class="dashboard-card wide">
            <div class="card-header">
                <div class="card-header-left">
                    <h3 class="card-title">Recent Activity</h3>
                    <p class="card-subtitle">Latest admin actions</p>
                </div>
                <a href="{$WEB_ROOT}/admin/systemactivitylog.php" class="card-header-link">View Full Log</a>
            </div>
            <div class="card-body no-padding">
                <div class="activity-list">
                    {if $recentactivity}
                        {foreach from=$recentactivity item=activity}
                        <div class="activity-item">
                            <div class="activity-icon">
                                <i class="fas fa-circle-dot"></i>
                            </div>
                            <div class="activity-content">
                                <p class="activity-text">{$activity.description}</p>
                                <span class="activity-time">
                                    <i class="fas fa-clock"></i> {$activity.date}
                                    {if $activity.admin} &middot; <i class="fas fa-user"></i> {$activity.admin}{/if}
                                </span>
                            </div>
                        </div>
                        {/foreach}
                    {else}
                        <div class="empty-state-card">
                            <i class="fas fa-clock-rotate-left"></i>
                            <h4>No recent activity</h4>
                            <p>Activity will appear here</p>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Dashboard Chart Script -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const ctx = document.getElementById('incomeChart');
    if (ctx) {
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    label: 'Income',
                    data: {$incomechart|default:'[0,0,0,0,0,0,0,0,0,0,0,0]'},
                    backgroundColor: 'rgba(79, 70, 229, 0.15)',
                    borderColor: 'rgba(79, 70, 229, 1)',
                    borderWidth: 2,
                    borderRadius: 8,
                    borderSkipped: false,
                    hoverBackgroundColor: 'rgba(79, 70, 229, 0.3)',
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        backgroundColor: '#1e293b',
                        titleFont: { family: 'Inter', size: 13 },
                        bodyFont: { family: 'Inter', size: 12 },
                        padding: 12,
                        cornerRadius: 8,
                        displayColors: false,
                        callbacks: {
                            label: function(context) {
                                return '{$currencysymbol}' + context.parsed.y.toLocaleString();
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        grid: { display: false },
                        ticks: {
                            font: { family: 'Inter', size: 12 },
                            color: '#94a3b8'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(148, 163, 184, 0.1)',
                            drawBorder: false
                        },
                        ticks: {
                            font: { family: 'Inter', size: 12 },
                            color: '#94a3b8',
                            callback: function(value) {
                                return '{$currencysymbol}' + value.toLocaleString();
                            }
                        }
                    }
                }
            }
        });
    }
});
</script>
