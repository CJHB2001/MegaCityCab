<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>

<%

	VehicleDAO vehicleDAO = new VehicleDAO();
	List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
	request.setAttribute("vehicleList", vehicleList);
    // Fetch all bookings
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookingList = bookingDAO.getAllBookings();
    request.setAttribute("bookingList", bookingList);
    // Get current user ID from session
    int currentUserId = 0;
    if (session.getAttribute("user") != null) {
        // Assuming user object has getId() method
        currentUserId = ((com.res.model.User)session.getAttribute("user")).getId();
    }
    
    // Initialize counters
    int completedRides = 0;
    int dueRides = 0;
    float totalEarnings = 0;
    
    // Calculate statistics for current driver
    for (Booking booking : bookingList) {
        if (booking.getDriverId() == currentUserId && booking.getBookingStatus() == 1) {
            if (booking.getTripStatus() == 3) {
                // Completed rides
                completedRides++;
                totalEarnings += booking.getTotalBill();
            } else {
                // Due/Pending rides (Not Started or Started but not Completed)
                dueRides++;
            }
        }
    }
    
    // Calculate percentages
    int totalRides = completedRides + dueRides;
    int completedPercentage = (totalRides > 0) ? (completedRides * 100 / totalRides) : 0;
    int duePercentage = (totalRides > 0) ? (dueRides * 100 / totalRides) : 0;
    
    // Set attributes for use in JSP
    request.setAttribute("completedRides", completedRides);
    request.setAttribute("dueRides", dueRides);
    request.setAttribute("totalEarnings", totalEarnings);
    request.setAttribute("completedPercentage", completedPercentage);
    request.setAttribute("duePercentage", duePercentage);
    request.setAttribute("totalRides", totalRides);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/x-icon" href="./assets/images/MegacabLogoDriver.png">
    <link rel="stylesheet" href="style.css">
    <title>Mega City Cab - Driver Dashboard</title>
</head>
<body>
  <c:if test="${empty sessionScope.user || sessionScope.user.role != 'DRIVER'}">
    <c:redirect url="/AdminArea/login.jsp" />
</c:if>
    
    <!-- SIDEBAR -->
    <jsp:include page="./sideBar.jsp" />
    <!-- SIDEBAR -->

    <!-- NAVBAR -->
    <section id="content">
        <!-- NAVBAR -->
        <jsp:include page="./navBar.jsp" />
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main>
            <h1 class="title">Driver Dashboard</h1>
    
            <div class="info-data">
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${completedRides}</h2>
                            <p>Completed Rides</p>
                        </div>
                        <i class='bx bx-check-circle icon'></i>
                    </div>
                    <span class="progress" data-value="${completedPercentage}%"></span>
                    <span class="label">${completedPercentage}%</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${dueRides}</h2>
                            <p>Pending Rides</p>
                        </div>
                        <i class='bx bx-time icon'></i>
                    </div>
                    <span class="progress" data-value="${duePercentage}%"></span>
                    <span class="label">${duePercentage}%</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${totalRides}</h2>
                            <p>Total Assigned Rides</p>
                        </div>
                        <i class='bx bx-car icon'></i>
                    </div>
                    <span class="progress" data-value="100%"></span>
                    <span class="label">Total</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>Rs. ${totalEarnings}0</h2>
                            <p>Total Earnings</p>
                        </div>
                        <i class='bx bx-money icon'></i>
                    </div>
                    <span class="progress" data-value="100%"></span>
                    <span class="label">Revenue</span>
                </div>
            </div>
            <div class="data">
                <div class="content-data">
                    <div class="head">
                        <h3>Pending Rides</h3>
                        <div class="menu">
                            <i class='bx bx-dots-horizontal-rounded icon'></i>
                            <ul class="menu-link">
                                <li><a href="#">View All</a></li>
                                <li><a href="#">Refresh</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead class="table-dark">
                                <tr>
                                    <th> Name</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th> Date</th>
                                    <th> Time</th>
                                    <th>Phone </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="booking" items="${bookingList}">
                                    <c:if test="${booking.driverId == sessionScope.user.id && booking.bookingStatus == 1 && booking.tripStatus != 3}">
                                        <tr>
                                            <td>${booking.name}</td>
                                            <td>${booking.pickUpPoint}</td>
                                            <td>${booking.dropOffPoint}</td>
                                            <td>${booking.rideDate}</td>
                                            <td>${booking.rideTime}</td>
                                            <td>${booking.phoneNumber}</td>                                      
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="content-data">
                    <div class="head">
                        <h3>Performance Summary</h3>
                        <div class="menu">
                            <i class='bx bx-dots-horizontal-rounded icon'></i>
                            <ul class="menu-link">
                                <li><a href="#">View Details</a></li>
                                <li><a href="#">Print Report</a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="performance-chart"></div>
                    <div class="stats-summary">
                        <p><strong>Completion Rate:</strong> ${completedPercentage}%</p>
                        <p><strong>Average Fare:</strong> Rs. ${totalRides > 0 ? totalEarnings / totalRides : 0}</p>
                        <p><strong>Pending Tasks:</strong> ${dueRides} rides</p>
                    </div>
                </div>
            </div>
        </main>
        <!-- MAIN -->
    </section>
    <!-- NAVBAR -->
    
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        // Initialize chart
        document.addEventListener("DOMContentLoaded", function() {
            var options = {
                series: [{
                    name: 'Completed Rides',
                    data: [${completedRides}]
                }, {
                    name: 'Pending Rides',
                    data: [${dueRides}]
                }],
                chart: {
                    type: 'bar',
                    height: 250,
                    stacked: true,
                    toolbar: {
                        show: false
                    }
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                    }
                },
                xaxis: {
                    categories: ['Ride Status']
                },
                fill: {
                    opacity: 1
                },
                colors: ['#4CAF50', '#FFC107']
            };

            var chart = new ApexCharts(document.querySelector("#performance-chart"), options);
            chart.render();
            
            // Set progress bars
            const allProgress = document.querySelectorAll('.progress');
            allProgress.forEach(item => {
                item.style.setProperty('--value', item.dataset.value)
            });
        });
    </script>
    <script src="script.js"></script>
</body>
</html>