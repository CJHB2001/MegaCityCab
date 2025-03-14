<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="java.util.List" %>

<%
BookingDAO bookingDAO = new BookingDAO();
List<Booking> bookingList = bookingDAO.getAllBookings();
request.setAttribute("bookingList", bookingList);

// Calculate summary statistics
int totalOrders = bookingList.size();
int pendingOrders = 0;
int confirmedOrders = 0;
int completedOrders = 0;
int cancelledOrders = 0;
float totalRevenue = 0;

for (Booking booking : bookingList) {
    totalRevenue += booking.getTotalBill();
    switch (booking.getBookingStatus()) {
        case 0:
            pendingOrders++;
            break;
        case 1:
            confirmedOrders++;
            break;
        case 3:
            cancelledOrders++;
            break;
    }
    if (booking.getTripStatus() == 3) {
        completedOrders++;
    }
}

request.setAttribute("totalOrders", totalOrders);
request.setAttribute("pendingOrders", pendingOrders);
request.setAttribute("confirmedOrders", confirmedOrders);
request.setAttribute("completedOrders", completedOrders);
request.setAttribute("cancelledOrders", cancelledOrders);
request.setAttribute("totalRevenue", totalRevenue);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Report</title>
  <link rel="icon" type="image/x-icon" href="./assets/images/LogoAdmin.png">
       <link rel="stylesheet" href="./css/report.css">

</head>
<body>
<c:if test="${empty sessionScope.user || sessionScope.user.role != 'ADMIN'}">
    <c:redirect url="/AdminArea/login.jsp" />
</c:if>
    <div class="report-container">
        <div class="report-header">
            <h1>Booking Report</h1>
            <p>Generated on: <%= new java.util.Date() %></p>
        </div>

        <div class="report-summary">
            <h2>Summary</h2>
            <table>
                <tr>
                    <td>Total Orders</td>
                    <td>${totalOrders}</td>
                </tr>
                <tr>
                    <td>Pending Orders</td>
                    <td>${pendingOrders}</td>
                </tr>
                <tr>
                    <td>Confirmed Orders</td>
                    <td>${confirmedOrders}</td>
                </tr>
                <tr>
                    <td>Completed Orders</td>
                    <td>${completedOrders}</td>
                </tr>
                <tr>
                    <td>Cancelled Orders</td>
                    <td>${cancelledOrders}</td>
                </tr>
                <tr>
                    <td>Total Revenue</td>
                    <td>Rs. ${totalRevenue}</td>
                </tr>
            </table>
        </div>

        <!-- Pending Orders -->
        <div class="report-details">
            <h2>Pending Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Pickup Point</th>
                        <th>Drop-off Point</th>
                        <th>Ride Date</th>
                        <th>Ride Time</th>
                        <th>Passengers</th>
                        <th>Distance (KM)</th>
                        <th>Vehicle Type</th>
                        <th>Vehicle Number</th>
                        <th>Driver Name</th>
                               <th>Discount</th>
             
                        <th>Total Bill</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookingList}">
                        <c:if test="${booking.bookingStatus == 0}">
                            <tr>
                                <td>${booking.id}</td>
                                <td>${booking.name}</td>
                                <td>${booking.pickUpPoint}</td>
                                <td>${booking.dropOffPoint}</td>
                                <td>${booking.rideDate}</td>
                                <td>${booking.rideTime}</td>
                                <td>${booking.passengers}</td>
                                <td>${booking.distanceKm}</td>
                                <td>${booking.vehicleType}</td>
                                <td>${booking.vehicleNumber}</td>
                                <td>${booking.driverName}</td>
                                <td>${booking.discount}0%</td>
                                <td>Rs. ${booking.totalBill}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Confirmed Orders -->
        <div class="report-details">
            <h2>Confirmed Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Pickup Point</th>
                        <th>Drop-off Point</th>
                        <th>Ride Date</th>
                        <th>Ride Time</th>
                        <th>Passengers</th>
                        <th>Distance (KM)</th>
                        <th>Vehicle Type</th>
                        <th>Vehicle Number</th>
                        <th>Driver Name</th>
                    <th>Discount</th>
                        <th>Total Bill</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookingList}">
                        <c:if test="${booking.bookingStatus == 1}">
                            <tr>
                                <td>${booking.id}</td>
                                <td>${booking.name}</td>
                                <td>${booking.pickUpPoint}</td>
                                <td>${booking.dropOffPoint}</td>
                                <td>${booking.rideDate}</td>
                                <td>${booking.rideTime}</td>
                                <td>${booking.passengers}</td>
                                <td>${booking.distanceKm}</td>
                                <td>${booking.vehicleType}</td>
                                <td>${booking.vehicleNumber}</td>
                                <td>${booking.driverName}</td>
                                                     <td>${booking.discount}0%</td>
                                <td>Rs. ${booking.totalBill}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Completed Orders -->
        <div class="report-details">
            <h2>Completed Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Pickup Point</th>
                        <th>Drop-off Point</th>
                        <th>Ride Date</th>
                        <th>Ride Time</th>
                        <th>Passengers</th>
                        <th>Distance (KM)</th>
                        <th>Vehicle Type</th>
                        <th>Vehicle Number</th>
                        <th>Driver Name</th>
                        <th>Discount</th>
                        <th>Total Bill</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookingList}">
                        <c:if test="${booking.tripStatus == 3}">
                            <tr>
                                <td>${booking.id}</td>
                                <td>${booking.name}</td>
                                <td>${booking.pickUpPoint}</td>
                                <td>${booking.dropOffPoint}</td>
                                <td>${booking.rideDate}</td>
                                <td>${booking.rideTime}</td>
                                <td>${booking.passengers}</td>
                                <td>${booking.distanceKm}</td>
                                <td>${booking.vehicleType}</td>
                                <td>${booking.vehicleNumber}</td>
                                <td>${booking.driverName}</td>
                                       <td>${booking.discount}0%</td>
                                <td>Rs. ${booking.totalBill}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Cancelled Orders -->
        <div class="report-details">
            <h2>Cancelled Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Pickup Point</th>
                        <th>Drop-off Point</th>
                        <th>Ride Date</th>
                        <th>Ride Time</th>
                        <th>Passengers</th>
                        <th>Distance (KM)</th>
                        <th>Vehicle Type</th>
                        <th>Vehicle Number</th>
                        <th>Driver Name</th>
                       <th>Discount</th>
                        <th>Total Bill</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookingList}">
                        <c:if test="${booking.bookingStatus == 3}">
                            <tr>
                                <td>${booking.id}</td>
                                <td>${booking.name}</td>
                                <td>${booking.pickUpPoint}</td>
                                <td>${booking.dropOffPoint}</td>
                                <td>${booking.rideDate}</td>
                                <td>${booking.rideTime}</td>
                                <td>${booking.passengers}</td>
                                <td>${booking.distanceKm}</td>
                                <td>${booking.vehicleType}</td>
                                <td>${booking.vehicleNumber}</td>
                                <td>${booking.driverName}</td>
                                      <td>${booking.discount}0%</td>
                                <td>Rs. ${booking.totalBill}</td>
                            </tr>
                        </c:if>
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