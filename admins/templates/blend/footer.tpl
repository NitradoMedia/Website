        </div><!-- /.page-content -->
    </main><!-- /.main-content -->

    <!-- Footer -->
    <footer class="admin-footer" id="adminFooter">
        <div class="footer-inner">
            <div class="footer-left">
                <span>&copy; {$smarty.now|date_format:"%Y"} {$companyname}. All rights reserved.</span>
            </div>
            <div class="footer-right">
                <span>Powered by <a href="https://www.whmcs.com" target="_blank" rel="noopener">WHMCS</a></span>
            </div>
        </div>
    </footer>

    <!-- Back to Top Button -->
    <button class="back-to-top" id="backToTop" title="Back to top">
        <i class="fas fa-chevron-up"></i>
    </button>

    <!-- Modal Container -->
    <div class="modal fade" id="adminModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="adminModalTitle"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="adminModalBody"></div>
                <div class="modal-footer" id="adminModalFooter">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="adminModalConfirm">Confirm</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Confirmation Dialog -->
    <div class="modal fade" id="confirmDialog" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body text-center py-4">
                    <div class="confirm-icon">
                        <i class="fas fa-question-circle"></i>
                    </div>
                    <h5 class="mt-3" id="confirmDialogTitle">Are you sure?</h5>
                    <p class="text-muted" id="confirmDialogMessage">This action cannot be undone.</p>
                </div>
                <div class="modal-footer justify-content-center border-0 pt-0">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDialogConfirm">Confirm</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Toast Notification Container -->
    <div class="toast-container position-fixed bottom-0 end-0 p-3" id="toastContainer"></div>

    <!-- Core Scripts -->
    <script src="{$WEB_ROOT}/admin/templates/{$template}/js/blend.js"></script>

    {$footeroutput}

    {if $jquerycode}
    <script>
        $(document).ready(function() {
            {$jquerycode}
        });
    </script>
    {/if}
</body>
</html>
