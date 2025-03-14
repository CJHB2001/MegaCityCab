<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="java.sql.SQLException" %>

<%
int bookingId = Integer.parseInt(request.getParameter("bookingId"));
BookingDAO bookingDAO = new BookingDAO();
Booking booking = null;
try {
    booking = bookingDAO.getBookingById(bookingId);
} catch (SQLException e) {
    e.printStackTrace();
}
request.setAttribute("booking", booking);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" type="image/x-icon" href="images/MegacabLogo.png">
    <title>Order Bill - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/customerBill.css">
   
</head>
<body>
    <div class="bill-container">
        <div class="bill-header">
            <div class="logo">
                <i class="fas fa-taxi"></i> MEGA CITY CAB
            </div>
            <h1 class="bill-title">INVOICE</h1>
            <p class="bill-subtitle">Thank you for choosing Mega City Cab</p>
            
            <div class="invoice-details">
                <p class="invoice-id">INVOICE #MCB-${booking.id}</p>
                <p>Date: ${booking.rideDate}</p>
            </div>
        </div>
        
        <div class="bill-details">
            <h2 class="section-title">Customer Information</h2>
            <table>
                <tr>
                    <td>Order ID</td>
                    <td>${booking.id}</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>${booking.name}</td>
                </tr>
                   <tr>
                    <td>Registation Number</td>
                    <td>${sessionScope.customer.registrationNumber}</td>
        
                    
                </tr>
            </table>
        </div>
        
        <div class="bill-details">
            <h2 class="section-title">Ride Details</h2>
            <table>
                <tr>
                    <td>Pick-up Point</td>
                    <td>${booking.pickUpPoint}</td>
                </tr>
                <tr>
                    <td>Drop-off Point</td>
                    <td>${booking.dropOffPoint}</td>
                </tr>
                <tr>
                    <td>Ride Date</td>
                    <td>${booking.rideDate}</td>
                </tr>
                <tr>
                    <td>Ride Time</td>
                    <td>${booking.rideTime}</td>
                </tr>
                <tr>
                    <td>Vehicle Type</td>
                    <td>${booking.vehicleType}</td>
                </tr>
                <tr>
                    <td>Vehicle Number</td>
                    <td>${booking.vehicleNumber}</td>
                </tr>
                <tr>
                    <td>Driver Name</td>
                    <td>${booking.driverName}</td>
                </tr>
                <tr>
                    <td>Distance</td>
                    <td>${booking.distanceKm} KM</td>
                </tr>
            </table>
        </div>
        
        <div class="bill-details payment-summary">
            <h2 class="section-title">Payment Summary</h2>
            <table>
                <tr>
                    <td>Discount</td>
                    <td>${booking.discount}0%</td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td>
                        <c:choose>
                            <c:when test="${booking.discount > 0}">
                                <c:choose>
                                    <c:when test="${booking.discount == 100}">
                                        <!-- Handle 100% discount case -->
                                        <s class="text-muted">Rs. <fmt:formatNumber value="${booking.totalBill * 100}" pattern="#,##0.00"/></s>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Calculate original amount -->
                                        <c:set var="originalAmount" value="${booking.totalBill / (1 - booking.discount/100)}" />
                                        <s class="text-muted">Rs. <fmt:formatNumber value="${originalAmount}" pattern="#,##0.00"/></s>
                                    </c:otherwise>
                                </c:choose>
                                <span class="text-success ms-2">
                                    Rs. <fmt:formatNumber value="${booking.totalBill}" pattern="#,##0.00"/>
                                </span>
                            </c:when>
                            <c:otherwise>
                                Rs. <fmt:formatNumber value="${booking.totalBill}" pattern="#,##0.00"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr class="total-row">
                    <td>Total Bill</td>
                    <td>Rs. ${booking.totalBill}0</td>
                </tr>
                <tr>
                    <td>Payment Status</td>
                    <td>
                        <c:choose>
                            <c:when test="${booking.paymentStatus == 0}">
                                <span class="badge bg-warning text-white">Pending</span>
                            </c:when>
                            <c:when test="${booking.paymentStatus == 1}">
                                <span class="badge bg-success text-white">Paid</span>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </div>
        
        <div class="bill-footer">
            <p>This is a computer-generated invoice. No signature required.</p>
            <div class="contact-info">
                <p>For any queries, please contact: <strong>megacitycab@gmail.com</strong> | <strong>+94 702740542</strong></p>
                <p>No.100/3 , Mega City Cab , colombo 03</p>
            </div>
        </div>
        		
        <button class="print-button" onclick="window.print()">
            <i class="fas fa-print"></i> Print Invoice
        </button>
    </div>
</body>
</html>