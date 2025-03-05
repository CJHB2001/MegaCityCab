<%-- File: toastr-config.jsp --%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Toastr CSS and JS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<!-- Toastr Configuration -->
<script>
    $(document).ready(function() {
        // Configure Toastr options
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
    });
</script>

<!-- Toastr Styles -->
<style>
    .toast-success { background-color: #51A351 !important; }
    .toast-error { background-color: #BD362F !important; }
    .toast-info { background-color: #2F96B4 !important; }
    .toast-warning { background-color: #F89406 !important; }
    #toast-container > div { opacity: 1; }
    .toast-message { color: #ffffff !important; font-weight: 500; }
</style>

<!-- Alert Message Handler -->
<c:if test="${not empty sessionScope.alertMessage}">
    <script>
        $(document).ready(function() {
            toastr["${sessionScope.alertType}"]("${sessionScope.alertMessage}");
            <% 
                // Clear the session attributes after displaying
                session.removeAttribute("alertMessage");
                session.removeAttribute("alertType");
            %>
        });
    </script>
</c:if>