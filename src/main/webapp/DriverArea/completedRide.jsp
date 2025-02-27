<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>

<%
    // Fetch the latest bookings and vehicles
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookingList = bookingDAO.getAllBookings();
    request.setAttribute("bookingList", bookingList);

    VehicleDAO vehicleDAO = new VehicleDAO();
    List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
    request.setAttribute("vehicleList", vehicleList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Management</title>
</head>
<body>
   <c:if test="${empty sessionScope.user}">
        <c:redirect url="/AdminArea/login.jsp" />
    </c:if>

    <jsp:include page="./toastr-config.jsp" />
    <jsp:include page="./sideBar.jsp" />

    <section id="content">
        <jsp:include page="./navBar.jsp" />

        <main class="p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Completed Bookings</h1>
            </div>

            <!-- Success/Error Messages -->
            <c:if test="${not empty sessionScope.alertMessage}">
                <div class="alert alert-${sessionScope.alertType}">
                    ${sessionScope.alertMessage}
                </div>
                <c:remove var="alertMessage" scope="session" />
                <c:remove var="alertType" scope="session" />
            </c:if>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead class="table-dark">
                                <tr>
                                    <th>Customer ID</th>
                                    <th>Customer Name</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Ride Date</th>
                                    <th>Ride Time</th>
                                    <th>Phone Number</th>
                                    <th>Total Bill</th>
                                    <th>Trip Status</th>
                            
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="booking" items="${bookingList}">
                                    <c:if test="${booking.driverId == sessionScope.user.id && booking.bookingStatus == 1 && booking.tripStatus == 3}">
                                        <tr>
                                            <td>${booking.customerId}</td>
                                            <td>${booking.name}</td>
                                            <td>${booking.pickUpPoint}</td>
                                            <td>${booking.dropOffPoint}</td>
                                            <td>${booking.rideDate}</td>
                                            <td>${booking.rideTime}</td>
                                            <td>${booking.phoneNumber}</td>
                                            <td>Rs. ${booking.totalBill}</td>
                                            <td>
                                                <c:choose>
                            
                                                    <c:when test="${booking.tripStatus == 3}">
                                                        <span class="badge bg-success">Completed</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                           
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </section>

</body>
</html>
