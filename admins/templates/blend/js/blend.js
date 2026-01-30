/**
 * BLEND - Modern WHMCS Admin Template
 * Core JavaScript functionality
 */

(function() {
    'use strict';

    // ============================================
    // SIDEBAR TOGGLE
    // ============================================
    const sidebar = document.getElementById('adminSidebar');
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebarClose = document.getElementById('sidebarClose');
    const sidebarOverlay = document.getElementById('sidebarOverlay');
    const body = document.body;

    function isMobile() {
        return window.innerWidth <= 992;
    }

    function toggleSidebar() {
        if (isMobile()) {
            sidebar.classList.toggle('open');
            sidebarOverlay.classList.toggle('active');
            body.style.overflow = sidebar.classList.contains('open') ? 'hidden' : '';
        } else {
            body.classList.toggle('sidebar-collapsed');
            localStorage.setItem('sidebarCollapsed', body.classList.contains('sidebar-collapsed'));
        }
    }

    function closeSidebar() {
        if (isMobile()) {
            sidebar.classList.remove('open');
            sidebarOverlay.classList.remove('active');
            body.style.overflow = '';
        }
    }

    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', toggleSidebar);
    }

    if (sidebarClose) {
        sidebarClose.addEventListener('click', closeSidebar);
    }

    if (sidebarOverlay) {
        sidebarOverlay.addEventListener('click', closeSidebar);
    }

    // Restore sidebar state from localStorage
    if (!isMobile() && localStorage.getItem('sidebarCollapsed') === 'true') {
        body.classList.add('sidebar-collapsed');
    }

    // Handle window resize
    let resizeTimer;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            if (!isMobile()) {
                sidebar.classList.remove('open');
                sidebarOverlay.classList.remove('active');
                body.style.overflow = '';
            }
        }, 150);
    });

    // ============================================
    // GLOBAL SEARCH
    // ============================================
    const searchInput = document.getElementById('globalSearchInput');
    const searchResults = document.getElementById('searchResults');
    let searchTimeout;

    if (searchInput) {
        // Ctrl+K shortcut
        document.addEventListener('keydown', function(e) {
            if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
                e.preventDefault();
                searchInput.focus();
            }
            if (e.key === 'Escape') {
                searchInput.blur();
                if (searchResults) searchResults.classList.remove('active');
            }
        });

        searchInput.addEventListener('input', function() {
            clearTimeout(searchTimeout);
            const query = this.value.trim();

            if (query.length < 2) {
                if (searchResults) searchResults.classList.remove('active');
                return;
            }

            searchTimeout = setTimeout(function() {
                performSearch(query);
            }, 300);
        });

        searchInput.addEventListener('focus', function() {
            if (this.value.trim().length >= 2 && searchResults.innerHTML) {
                searchResults.classList.add('active');
            }
        });

        document.addEventListener('click', function(e) {
            if (!e.target.closest('.global-search')) {
                if (searchResults) searchResults.classList.remove('active');
            }
        });
    }

    function performSearch(query) {
        // AJAX search - integrates with WHMCS admin search
        $.ajax({
            url: 'search.php',
            type: 'POST',
            data: {
                token: $('input[name="token"]').val() || '',
                searchterm: query
            },
            dataType: 'json',
            success: function(data) {
                renderSearchResults(data, query);
            },
            error: function() {
                searchResults.innerHTML = '<div class="search-no-results"><p>Search unavailable</p></div>';
                searchResults.classList.add('active');
            }
        });
    }

    function renderSearchResults(data, query) {
        if (!searchResults) return;

        let html = '';

        if (data && data.length > 0) {
            data.forEach(function(item) {
                html += '<a href="' + item.url + '" class="search-result-item">';
                html += '<div class="search-result-icon"><i class="fas fa-' + (item.icon || 'file') + '"></i></div>';
                html += '<div class="search-result-info">';
                html += '<span class="search-result-title">' + item.title + '</span>';
                html += '<span class="search-result-type">' + (item.type || '') + '</span>';
                html += '</div>';
                html += '</a>';
            });
        } else {
            html = '<div class="search-no-results">';
            html += '<i class="fas fa-search"></i>';
            html += '<p>No results for "<strong>' + escapeHtml(query) + '</strong>"</p>';
            html += '</div>';
        }

        searchResults.innerHTML = html;
        searchResults.classList.add('active');
    }

    function escapeHtml(text) {
        var div = document.createElement('div');
        div.appendChild(document.createTextNode(text));
        return div.innerHTML;
    }

    // ============================================
    // BACK TO TOP BUTTON
    // ============================================
    const backToTop = document.getElementById('backToTop');

    if (backToTop) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 300) {
                backToTop.classList.add('visible');
            } else {
                backToTop.classList.remove('visible');
            }
        });

        backToTop.addEventListener('click', function() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }

    // ============================================
    // ALERTS AUTO-DISMISS
    // ============================================
    document.querySelectorAll('.alert-dismissible').forEach(function(alert) {
        // Auto-dismiss success alerts after 5 seconds
        if (alert.classList.contains('alert-success')) {
            setTimeout(function() {
                alert.style.opacity = '0';
                alert.style.transform = 'translateY(-10px)';
                setTimeout(function() {
                    alert.remove();
                }, 300);
            }, 5000);
        }

        // Close button handler
        var closeBtn = alert.querySelector('.btn-close');
        if (closeBtn) {
            closeBtn.addEventListener('click', function() {
                alert.style.opacity = '0';
                alert.style.transform = 'translateY(-10px)';
                setTimeout(function() {
                    alert.remove();
                }, 300);
            });
        }
    });

    // ============================================
    // TOOLTIP INITIALIZATION
    // ============================================
    if (typeof bootstrap !== 'undefined' && bootstrap.Tooltip) {
        document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(function(el) {
            new bootstrap.Tooltip(el);
        });
    }

    // ============================================
    // DROPDOWN IMPROVEMENTS
    // ============================================
    // Close dropdowns when clicking outside
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.dropdown')) {
            document.querySelectorAll('.dropdown-menu.show').forEach(function(menu) {
                menu.classList.remove('show');
            });
        }
    });

    // ============================================
    // TOAST NOTIFICATIONS
    // ============================================
    window.BlendToast = {
        show: function(message, type, duration) {
            type = type || 'info';
            duration = duration || 4000;

            var container = document.getElementById('toastContainer');
            if (!container) return;

            var icons = {
                success: 'check-circle',
                danger: 'exclamation-triangle',
                warning: 'exclamation-circle',
                info: 'info-circle'
            };

            var toast = document.createElement('div');
            toast.className = 'toast show blend-toast';
            toast.innerHTML =
                '<div class="toast-body d-flex align-center gap-1">' +
                    '<i class="fas fa-' + (icons[type] || 'info-circle') + '" style="color:var(--' + type + ')"></i>' +
                    '<span>' + message + '</span>' +
                    '<button type="button" class="btn-close ms-auto" onclick="this.closest(\'.toast\').remove()"></button>' +
                '</div>';

            container.appendChild(toast);

            // Auto remove
            setTimeout(function() {
                toast.style.opacity = '0';
                toast.style.transform = 'translateX(100%)';
                setTimeout(function() {
                    toast.remove();
                }, 300);
            }, duration);
        }
    };

    // ============================================
    // CONFIRM DIALOGS
    // ============================================
    window.BlendConfirm = function(title, message, callback) {
        var dialog = document.getElementById('confirmDialog');
        if (!dialog) return;

        var titleEl = document.getElementById('confirmDialogTitle');
        var messageEl = document.getElementById('confirmDialogMessage');
        var confirmBtn = document.getElementById('confirmDialogConfirm');

        if (titleEl) titleEl.textContent = title;
        if (messageEl) messageEl.textContent = message;

        var modal = new bootstrap.Modal(dialog);
        modal.show();

        if (confirmBtn) {
            var newBtn = confirmBtn.cloneNode(true);
            confirmBtn.parentNode.replaceChild(newBtn, confirmBtn);
            newBtn.addEventListener('click', function() {
                modal.hide();
                if (typeof callback === 'function') callback();
            });
        }
    };

    // ============================================
    // TABLE ENHANCEMENTS
    // ============================================
    // Add responsive wrapper to tables without one
    document.querySelectorAll('.page-content table').forEach(function(table) {
        if (!table.closest('.data-table-wrapper') && !table.closest('.dataTables_wrapper')) {
            var wrapper = document.createElement('div');
            wrapper.className = 'data-table-wrapper';
            table.parentNode.insertBefore(wrapper, table);
            wrapper.appendChild(table);
        }
    });

    // ============================================
    // FORM ENHANCEMENTS
    // ============================================
    // Add modern classes to legacy WHMCS form elements
    document.querySelectorAll('input[type="text"], input[type="email"], input[type="password"], input[type="number"], input[type="url"], input[type="tel"], input[type="search"], textarea, select').forEach(function(input) {
        if (!input.classList.contains('form-control') &&
            !input.classList.contains('form-select') &&
            !input.closest('.global-search') &&
            !input.closest('.dataTables_wrapper')) {
            if (input.tagName === 'SELECT') {
                input.classList.add('form-select', 'form-control');
            } else {
                input.classList.add('form-control');
            }
        }
    });

    // ============================================
    // ACTIVE SIDEBAR LINK DETECTION
    // ============================================
    var currentPath = window.location.pathname + window.location.search;
    document.querySelectorAll('.sidebar-nav .nav-item').forEach(function(link) {
        var href = link.getAttribute('href');
        if (href && currentPath.indexOf(href.replace(/^.*\/admin\//, '/admin/')) !== -1) {
            link.classList.add('active');
            // Expand parent section
            var section = link.closest('.nav-section');
            if (section) {
                section.classList.add('has-active');
            }
        }
    });

    // ============================================
    // KEYBOARD SHORTCUTS
    // ============================================
    document.addEventListener('keydown', function(e) {
        // Alt+D = Dashboard
        if (e.altKey && e.key === 'd') {
            e.preventDefault();
            window.location.href = 'index.php';
        }
        // Alt+C = Clients
        if (e.altKey && e.key === 'c') {
            e.preventDefault();
            window.location.href = 'clients.php';
        }
        // Alt+T = Tickets
        if (e.altKey && e.key === 't') {
            e.preventDefault();
            window.location.href = 'supporttickets.php';
        }
        // Alt+O = Orders
        if (e.altKey && e.key === 'o') {
            e.preventDefault();
            window.location.href = 'orders.php';
        }
        // Alt+I = Invoices
        if (e.altKey && e.key === 'i') {
            e.preventDefault();
            window.location.href = 'invoices.php';
        }
    });

    // ============================================
    // PAGE LOAD ANIMATION
    // ============================================
    document.addEventListener('DOMContentLoaded', function() {
        body.classList.add('loaded');

        // Animate stat cards on scroll
        if ('IntersectionObserver' in window) {
            var observer = new IntersectionObserver(function(entries) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate-in');
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.1 });

            document.querySelectorAll('.stat-card, .dashboard-card').forEach(function(card) {
                observer.observe(card);
            });
        }
    });

})();
