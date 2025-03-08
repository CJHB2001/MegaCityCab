<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Newsletter" %>
<%@ page import="com.res.dao.NewsletterDAO" %>
<%
    // Fetch the newsletter list from the database
    NewsletterDAO newsletterDAO = new NewsletterDAO();
    List<Newsletter> newsletterList = newsletterDAO.getAllNewsletters();
    request.setAttribute("newsletterList", newsletterList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="https://cdn.tiny.cloud/1/2k4jaruxjz8btnyxbloucip4rsqxpuuxs3y5ra1qyb7hv6cb/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
           <link rel="icon" type="image/x-icon" href="./assets/images/MegacabLogoAdmin.png">
        <title>Mega City Cab - Admin Newsletter Management</title>
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">
            <!-- Display Alert Messages -->
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Newsletter Management</h1>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sendEmailModal">
                    <i class='bx bx-plus'></i> Send Email
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Subscriber Email</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="newsletter" items="${newsletterList}">
                                    <tr>
                                        <td>${newsletter.id}</td>
                                        <td>${newsletter.email}</td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteNewsletterModal${newsletter.id}">
                                                <i class='bx bx-trash'></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteNewsletterModal${newsletter.id}" tabindex="-1" aria-labelledby="deleteNewsletterModalLabel${newsletter.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteServiceModalLabel${newsletter.id}">Delete Subscriber</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="d-flex justify-content-center mb-1">
                                                        <img src="./assets/images/bin.gif" alt="" class="" width="80">
                                                    </div>
                                                    <h6 class="text-center fw-bold">You are about to delete a subscriber</h6>
                                                    <p class="text-secondary text-center">This action will permanently delete the subscriber. <span class="text-dark">Are you sure?</span></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="${pageContext.request.contextPath}/newsletter?action=delete&id=${newsletter.id}" class="btn btn-danger">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </section>

    <!-- Send Email Modal -->
    <div class="modal fade" id="sendEmailModal" tabindex="-1" aria-labelledby="sendEmailModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sendEmailModalLabel">Send Email to Subscribers</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
       <form id="sendEmailForm" action="${pageContext.request.contextPath}/sendBulkEmail" method="post">
       
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="subject" class="form-label">Email Subject</label>
                            <input type="text" class="form-control" id="subject" name="subject" required>
                        </div>
                        <div class="mb-3">
                            <label for="emailContent" class="form-label">Email Body</label>
                            <textarea class="form-control" id="emailContent" name="emailContent"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send Email</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Initialize TinyMCE for the email body textarea
        tinymce.init({
            selector: '#emailContent',
            plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
        });
    </script>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelector("#sendEmailForm").addEventListener("submit", function (event) {
            event.preventDefault(); // Prevent default form submission

            let formData = new FormData(this);

            fetch(this.action, {
                method: "POST",
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                // Replace modal content with success message
                document.querySelector("#sendEmailModal .modal-body").innerHTML = 
                    "<h5 class='text-success text-center'>Email has been sent to all customers.</h5>";

                // Hide the close button and submit button
                document.querySelector("#sendEmailModal .modal-footer").style.display = "none";
            })
            .catch(error => console.error("Error:", error));
        });
    });
</script>
    
</body>
</html>