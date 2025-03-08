<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>
<%@ page import="com.res.model.Customer" %>
<%@ page import="com.res.dao.CustomerDAO" %>

<%
    // Get current date for report
    Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    String reportDate = dateFormat.format(currentDate);
    String reportTime = timeFormat.format(currentDate);
    
    // Fetch all bookings
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookingList = bookingDAO.getAllBookings();
    
    // Fetch all vehicles
    VehicleDAO vehicleDAO = new VehicleDAO();
    List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
    
    // Fetch all drivers
    UserDAO userDAO = new UserDAO();
    List<User> userList = userDAO.getAllDrivers();
    
    // Fetch all customers
    CustomerDAO customerDAO = new CustomerDAO();
    List<Customer> customerList = customerDAO.getAllCustomers();
    
    // Initialize counters
    int totalOrders = bookingList.size();
    int completedOrders = 0;
    int confirmedOrders = 0;
    int pendingOrders = 0;
    int cancelledOrders = 0;
    float totalRevenue = 0;
    float pendingRevenue = 0;
    float completedRevenue = 0;
    int totalDrivers = userList.size();
    int totalCustomers = customerList.size();
    
    // Vehicle category counters
    Map<String, Integer> vehicleCategories = new HashMap<>();
    vehicleCategories.put("Car", 0);
    vehicleCategories.put("Van", 0);
    vehicleCategories.put("Jeep", 0);
    vehicleCategories.put("Tuk Tuk", 0);
    
    // Count vehicles by category
    for (Vehicle vehicle : vehicleList) {
        String type = vehicle.getVehicleType();
        if (vehicleCategories.containsKey(type)) {
            vehicleCategories.put(type, vehicleCategories.get(type) + 1);
        }
    }
    
    // Calculate order statistics
    for (Booking booking : bookingList) {
        if (booking.getTripStatus() == 3) {
            // Completed orders
            completedOrders++;
            completedRevenue += booking.getTotalBill();
            totalRevenue += booking.getTotalBill();
        } else if (booking.getBookingStatus() == 1) {
            // Confirmed orders
            confirmedOrders++;
            pendingRevenue += booking.getTotalBill();
        } else if (booking.getBookingStatus() == 0) {
            // Pending orders
            pendingOrders++;
            pendingRevenue += booking.getTotalBill();
        } else if (booking.getBookingStatus() == 3) {
            // Cancelled orders
            cancelledOrders++;
        }
    }
    
    // Calculate percentages
    int completedPercentage = (totalOrders > 0) ? (completedOrders * 100 / totalOrders) : 0;
    int confirmedPercentage = (totalOrders > 0) ? (confirmedOrders * 100 / totalOrders) : 0;
    int pendingPercentage = (totalOrders > 0) ? (pendingOrders * 100 / totalOrders) : 0;
    int cancelledPercentage = (totalOrders > 0) ? (cancelledOrders * 100 / totalOrders) : 0;
    
    // Calculate average fare
    float averageFare = (completedOrders > 0) ? (completedRevenue / completedOrders) : 0;
    
    // Set attributes for use in JSP
    request.setAttribute("reportDate", reportDate);
    request.setAttribute("reportTime", reportTime);
    request.setAttribute("totalOrders", totalOrders);
    request.setAttribute("completedOrders", completedOrders);
    request.setAttribute("confirmedOrders", confirmedOrders);
    request.setAttribute("pendingOrders", pendingOrders);
    request.setAttribute("cancelledOrders", cancelledOrders);
    request.setAttribute("totalRevenue", totalRevenue);
    request.setAttribute("pendingRevenue", pendingRevenue);
    request.setAttribute("completedRevenue", completedRevenue);
    request.setAttribute("totalDrivers", totalDrivers);
    request.setAttribute("totalVehicles", vehicleList.size());
    request.setAttribute("totalCustomers", totalCustomers);
    request.setAttribute("carCount", vehicleCategories.get("Car"));
    request.setAttribute("vanCount", vehicleCategories.get("Van"));
    request.setAttribute("jeepCount", vehicleCategories.get("Jeep"));
    request.setAttribute("tukTukCount", vehicleCategories.get("Tuk Tuk"));
    request.setAttribute("completedPercentage", completedPercentage);
    request.setAttribute("confirmedPercentage", confirmedPercentage);
    request.setAttribute("pendingPercentage", pendingPercentage);
    request.setAttribute("cancelledPercentage", cancelledPercentage);
    request.setAttribute("averageFare", averageFare);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrative Report</title>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <style>
        /* Custom CSS for report */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        
        .report-container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        
        .report-header {
            background-color: #4361ee;
            color: white;
            padding: 20px;
            text-align: center;
            border-bottom: 2px solid #3a0ca3;
        }
        
        .report-header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }
        
        .report-header p {
            margin: 5px 0 0;
            font-size: 14px;
        }
        
        .report-section {
            padding: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .section-title {
            color: #3a0ca3;
            font-size: 20px;
            margin-bottom: 15px;
            font-weight: bold;
            border-left: 4px solid #4361ee;
            padding-left: 10px;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .stat-card {
            background-color: #f8f9fa;
            border-radius: 6px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            border-left: 3px solid #4361ee;
        }
        
        .stat-card h3 {
            margin: 0;
            font-size: 14px;
            color: #555;
        }
        
        .stat-card p {
            margin: 10px 0 0;
            font-size: 22px;
            font-weight: bold;
            color: #333;
        }
        
        .chart-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }
        
        @media (max-width: 768px) {
            .chart-container {
                grid-template-columns: 1fr;
            }
        }
        
        .chart-box {
            background-color: #fff;
            border-radius: 6px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            height: 300px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        
        table th, table td {
            border: 1px solid #e0e0e0;
            padding: 10px;
            text-align: left;
        }
        
        table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        
        table tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        .button-container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        
        .back-button button {
            background-color: #6c757d;
            color: white;
        }
        
        .print-button button {
            background-color: #4361ee;
            color: white;
        }
        
        .back-button button:hover {
            background-color: #5a6268;
        }
        
        .print-button button:hover {
            background-color: #3a0ca3;
        }
        
        .badge {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: normal;
            color: white;
        }
        
        .badge-primary {
            background-color: #4361ee;
        }
        
        .badge-success {
            background-color: #2ec4b6;
        }
        
        .badge-warning {
            background-color: #ff9f1c;
        }
        
        .badge-danger {
            background-color: #e71d36;
        }
        
        /* Adjustments for printing */
        @media print {
            .button-container {
                display: none;
            }
            
            body {
                background-color: white;
            }
            
            .report-container {
                box-shadow: none;
                width: 100%;
                max-width: 100%;
                margin: 0;
            }
            
            .chart-container {
                page-break-inside: avoid;
            }
            
            .report-section {
                page-break-inside: avoid;
            }
        }
    </style>
</head>
<body>
<c:if test="${empty sessionScope.user || sessionScope.user.role != 'ADMIN'}">
    <c:redirect url="/AdminArea/login.jsp" />
</c:if>
    <div class="report-container">
        <div class="report-header">
            <h1>Mega city cab - Administrative Report</h1>
            <p>Generated on: ${reportDate} at ${reportTime}</p>
        </div>
        
        <!-- Executive Summary Section -->
        <div class="report-section">
            <div class="section-title">Executive Summary</div>
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Total Bookings</h3>
                    <p>${totalOrders}</p>
                </div>
                <div class="stat-card">
                    <h3>Completed Bookings</h3>
                    <p>${completedOrders} <small>(${completedPercentage}%)</small></p>
                </div>
                <div class="stat-card">
                    <h3>Confirmed Bookings</h3>
                    <p>${confirmedOrders} <small>(${confirmedPercentage}%)</small></p>
                </div>
                <div class="stat-card">
                    <h3>Pending Bookings</h3>
                    <p>${pendingOrders} <small>(${pendingPercentage}%)</small></p>
                </div>
                <div class="stat-card">
                    <h3>Total Revenue</h3>
                    <p>Rs. ${totalRevenue}0</p>
                </div>
                <div class="stat-card">
                    <h3>Completed Revenue</h3>
                    <p>Rs. ${completedRevenue}0</p>
                </div>
                <div class="stat-card">
                    <h3>Pending Revenue</h3>
                    <p>Rs. ${pendingRevenue}0</p>
                </div>
                <div class="stat-card">
                    <h3>Average Fare</h3>
                    <p>Rs. ${averageFare}0</p>
                </div>
            </div>
        </div>
        
        <!-- Resource Summary Section -->
        <div class="report-section">
            <div class="section-title">Resource Summary</div>
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Total Vehicles</h3>
                    <p>${totalVehicles}</p>
                </div>
                <div class="stat-card">
                    <h3>Cars</h3>
                    <p>${carCount}</p>
                </div>
                <div class="stat-card">
                    <h3>Vans</h3>
                    <p>${vanCount}</p>
                </div>
                <div class="stat-card">
                    <h3>Jeeps</h3>
                    <p>${jeepCount}</p>
                </div>
                <div class="stat-card">
                    <h3>Tuk Tuks</h3>
                    <p>${tukTukCount}</p>
                </div>
                <div class="stat-card">
                    <h3>Total Drivers</h3>
                    <p>${totalDrivers}</p>
                </div>
                <div class="stat-card">
                    <h3>Total Customers</h3>
                    <p>${totalCustomers}</p>
                </div>
                <div class="stat-card">
                    <h3>Driver to Vehicle Ratio</h3>
                    <p>${totalVehicles > 0 ? totalDrivers / totalVehicles : 0}</p>
                </div>
            </div>
        </div>
        
        <!-- Analytics Section -->
        <div class="report-section">
            <div class="section-title">Performance Analytics</div>
            <div class="chart-container">
                <div class="chart-box">
                    <h3 style="margin-top: 0;">Booking Status Distribution</h3>
                    <div id="booking-status-chart"></div>
                </div>
                <div class="chart-box">
                    <h3 style="margin-top: 0;">Vehicle Fleet Distribution</h3>
                    <div id="vehicle-distribution-chart"></div>
                </div>
            </div>
        </div>
        
        <!-- Recent Bookings Section -->
        <div class="report-section">
            <div class="section-title">Recent Bookings</div>
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Vehicle Type</th>
                        <th>Total Bill</th>
                        <th>Status</th>
                        <th>Payment</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookingList}" begin="0" end="9">
                        <tr>
                            <td>${booking.id}</td>
                            <td>${booking.name}</td>
                            <td>${booking.vehicleType}</td>
                            <td>Rs. ${booking.totalBill}0</td>
                            <td>
                                <c:choose>
                                    <c:when test="${booking.tripStatus == 3}">
                                        <span class="badge badge-primary">Complete</span>
                                    </c:when>
                                    <c:when test="${booking.bookingStatus == 0}">
                                        <span class="badge badge-warning">Pending</span>
                                    </c:when>
                                    <c:when test="${booking.bookingStatus == 1}">
                                        <span class="badge badge-success">Confirmed</span>
                                    </c:when>
                                    <c:when test="${booking.bookingStatus == 3}">
                                        <span class="badge badge-danger">Cancelled</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${booking.paymentStatus == 0}">
                                        <span class="badge badge-warning">Pending</span>
                                    </c:when>
                                    <c:when test="${booking.paymentStatus == 1}">
                                        <span class="badge badge-success">Paid</span>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <!-- Button Container -->
        <div class="button-container">
            <div class="back-button">
                <button onclick="window.history.back()"><i class='bx bx-arrow-back'></i> Back</button>
            </div>
            <div class="print-button">
                <button onclick="window.print()"><i class='bx bx-printer'></i> Print Report</button>
            </div>
        </div>
    </div>
    
    <script>
        // Initialize charts when document is loaded
        document.addEventListener("DOMContentLoaded", function() {
            // Booking Status Distribution Chart
            var bookingOptions = {
                series: [${completedPercentage}, ${confirmedPercentage}, ${pendingPercentage}, ${cancelledPercentage}],
                chart: {
                    type: 'pie',
                    height: 250
                },
                labels: ['Completed', 'Confirmed', 'Pending', 'Cancelled'],
                colors: ['#4361ee', '#2ec4b6', '#ff9f1c', '#e71d36'],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };
            
            var bookingChart = new ApexCharts(document.querySelector("#booking-status-chart"), bookingOptions);
            bookingChart.render();
            
            // Vehicle Distribution Chart
            var vehicleOptions = {
                series: [${carCount}, ${vanCount}, ${jeepCount}, ${tukTukCount}],
                chart: {
                    type: 'donut',
                    height: 250
                },
                labels: ['Cars', 'Vans', 'Jeeps', 'Tuk Tuks'],
                colors: ['#4361ee', '#3a0ca3', '#7209b7', '#f72585'],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };
            
            var vehicleChart = new ApexCharts(document.querySelector("#vehicle-distribution-chart"), vehicleOptions);
            vehicleChart.render();
        });
    </script>
</body>
</html>