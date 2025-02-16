<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
           <!-- Put this right after opening the <body> tag -->
<c:if test="${not empty sessionScope.alertMessage}">
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

            // Add custom CSS for Toastr
            $("<style>")
                .text(`
                    .toast-success { background-color: #51A351 !important; }
                    .toast-error { background-color: #BD362F !important; }
                    .toast-info { background-color: #2F96B4 !important; }
                    .toast-warning { background-color: #F89406 !important; }
                    #toast-container > div { opacity: 1; }
                    .toast-message { color: #ffffff !important; font-weight: 500; }
                `)
                .appendTo("head");

            // Show the notification
            toastr["${sessionScope.alertType}"]("${sessionScope.alertMessage}");
            
            <% 
                // Clear the session attributes after displaying
                session.removeAttribute("alertMessage");
                session.removeAttribute("alertType");
            %>
        });
    </script>
</c:if>