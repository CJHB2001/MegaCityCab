<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Customer" %>
<%@ page import="com.res.dao.CustomerDAO" %>
<%
    // Fetch the customer list from the database
    CustomerDAO customerDAO = new CustomerDAO();
    List<Customer> customerList = customerDAO.getAllCustomers();
    request.setAttribute("customerList", customerList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Mega City Cab - Customer Management</title>
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">
            <!-- Display Alert Messages -->
            <c:if test="${not empty alertMessage}">
                <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                    ${alertMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Customer Management</h1>

  <a href="customerReport.jsp" class="btn btn-primary">
              <i class='bx bx-file'></i> View Customer Report
    </a>
    
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                      <th>Registration Number</th>
                                    <th>Full Name</th>
                                
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>NIC Number</th>
                                    <th>Address Line 1</th>
                                    <th>Address Line 2</th>
                             
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="customer" items="${customerList}">
                                    <tr>
                                      <td>${customer.registrationNumber}</td>
                                        <td>${customer.firstName} ${customer.lastName}</td>
                             
                                        <td>${customer.phone}</td>
                                        <td>${customer.email}</td>
                                        <td>${customer.nicNumber}</td>
                                        <td>${customer.addressLine1}</td> <!-- Added addressLine1 -->
                                        <td>${customer.addressLine2}</td> <!-- Added addressLine2 -->
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
