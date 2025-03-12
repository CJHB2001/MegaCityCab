<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.res.dao.CustomerDAO" %>
<%@ page import="com.res.model.Customer" %>
<%@ page import="java.util.List" %>

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
         <link rel="icon" type="image/x-icon" href="./assets/images/LogoAdmin.png">
    <title>Customer Report</title>
      <link rel="stylesheet" href="./css/report.css">

</head>
<body>
<c:if test="${empty sessionScope.user || sessionScope.user.role != 'ADMIN'}">
    <c:redirect url="/AdminArea/login.jsp" />
</c:if>
    <div class="report-container">
        <div class="report-header">
            <h1>Customer Report</h1>
            <p>Generated on: <%= new java.util.Date() %></p>
        </div>

        <div class="report-details">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Phone</th>
                        <th>Email</th>                
                        <th>Address Line 1</th>
                        <th>Address Line 2</th>
                        <th>NIC Number</th>
                        <th>Registration Number</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customerList}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.firstName}</td>
                            <td>${customer.lastName}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.email}</td>
                            <td>${customer.addressLine1}</td>
                            <td>${customer.addressLine2}</td>
                            <td>${customer.nicNumber}</td>
                            <td>${customer.registrationNumber}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="button-container">
    <div class="back-button">
        <button onclick="window.history.back()">Back</button>
    </div>
    <div class="print-button">
        <button onclick="window.print()">Print Report</button>
    </div>
</div>
    </div>
</body>
</html>