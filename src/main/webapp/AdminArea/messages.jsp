<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Retrieve messages from the session
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    List<String> errorMessages = (List<String>) session.getAttribute("errorMessages");

    // Clear messages from the session after displaying
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
    session.removeAttribute("errorMessages");
%>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Display success message
        <% if (successMessage != null && !successMessage.isEmpty()) { %>
            toastr.success('<%= successMessage %>', '', {
                "closeButton": false,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": 300,
                "hideDuration": 1000,
                "timeOut": 5000,
                "extendedTimeOut": 1000,
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            });
        <% } %>

        // Display error message
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
            toastr.error('<%= errorMessage %>', '', {
                "closeButton": false,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": 300,
                "hideDuration": 1000,
                "timeOut": 5000,
                "extendedTimeOut": 1000,
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            });
        <% } %>

        // Display multiple error messages
        <% if (errorMessages != null && !errorMessages.isEmpty()) { %>
            <% for (String error : errorMessages) { %>
                toastr.error('<%= error %>', '', {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": 300,
                    "hideDuration": 1000,
                    "timeOut": 5000,
                    "extendedTimeOut": 1000,
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                });
            <% } %>
        <% } %>
    });
</script>