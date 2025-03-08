<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Contact" %>
<%@ page import="com.res.dao.ContactDAO" %>

<%
    // Fetch the contacts from the database
    ContactDAO contactDAO = new ContactDAO();
    List<Contact> contactList = contactDAO.getAllContacts();
    request.setAttribute("contactList", contactList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="icon" type="image/x-icon" href="./assets/images/MegacabLogoAdmin.png">
    <title>Mega City Cab - Admin Coustomer Massage Management</title>
</head>
<body>
<c:if test="${empty sessionScope.user || sessionScope.user.role != 'ADMIN'}">
    <c:redirect url="/AdminArea/login.jsp" />
</c:if>

    <jsp:include page="./toastr-config.jsp" />
    <% 
        // Clear the session attributes after displaying
        session.removeAttribute("alertMessage");
        session.removeAttribute("alertType");
    %>
    
    <jsp:include page="./sideBar.jsp" />

    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Customer Message Management</h1>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Full Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Message</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="contact" items="${contactList}">
                                    <tr>
                                        <td>${contact.id}</td>
                                        <td>${contact.fullName}</td>
                                        <td>${contact.phone}</td>
                                        <td>${contact.email}</td>
                                        <td>${contact.message}</td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteContactModal${contact.id}">
                                                <i class='bx bx-trash'></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteContactModal${contact.id}" tabindex="-1" aria-labelledby="deleteContactModalLabel${contact.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteContactModalLabel${contact.id}">Delete Contact</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="d-flex justify-content-center mb-1">
                                                        <img src="./assets/images/bin.gif" alt="Delete" width="80">
                                                    </div>
                                                    <h6 class="text-center fw-bold">You are about to delete a contact submission</h6>
                                                    <p class="text-secondary text-center">This action will permanently delete the contact. <span class="text-dark">Are you sure?</span></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="${pageContext.request.contextPath}/contact?action=delete&id=${contact.id}" class="btn btn-danger">Delete</a>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body>
</html>