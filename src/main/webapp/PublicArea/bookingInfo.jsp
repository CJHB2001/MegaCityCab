<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>

<%
BookingDAO bookingDAO = new BookingDAO();
List<Booking> bookingList = bookingDAO.getAllBookings();
request.setAttribute("bookingList", bookingList);

VehicleDAO vehicleDAO = new VehicleDAO();
List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
request.setAttribute("vehicleList", vehicleList);
%>

<!DOCTYPE html>
<html lang="zxx">
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>Mega City Cab - My Bookings</title>
   <!-- Add your CSS and JS links here -->
</head>
<body>

   <!-- Header Start -->
   <jsp:include page="./navBar.jsp" />
   <!-- Header End -->

   <!-- Promo Start -->
   <section class="promo-sec" style="background: url('images/promo-bg.jpg')no-repeat center center / cover;">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="promo-wrap text-center">
                  <h2 class="fw-bold text-white text-uppercase">My Ride</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">My Ride</li>
                     </ol>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Promo End -->

   <!-- Main Start -->
   <main class="main sec-padding">
      <section class="">
         <div class="container">
            <div class="row">
               <div class="col-xl-6 col-sm-9">
                  <div class="sec-intro">
                     <h2 class="sec-title">Your Rides</h2>
                     <p>View details of your ride bookings below.</p>
                  </div>
               </div>
            </div>

            <!-- Success/Error Messages -->
            <c:if test="${not empty param.cancelSuccess}">
               <div class="alert alert-success">
                  Booking cancelled successfully!
               </div>
            </c:if>
            <c:if test="${not empty param.cancelError}">
               <div class="alert alert-danger">
                  Failed to cancel booking. Please try again.
               </div>
            </c:if>

            <!-- Bookings Display Section -->
            <c:forEach var="booking" items="${bookingList}">
               <c:if test="${booking.customerId == sessionScope.customer.id && booking.bookingStatus != 3}">
                  <article class="car-entry d-md-flex border p-3 mb-4">
                     <c:choose>
                        <c:when test="${not empty booking.vehicleImagePath}">
                           <img src="${pageContext.request.contextPath}/${booking.vehicleImagePath}" class="car-media bg-cover" alt="Driver Image" width="500" height="200">
                        </c:when>
                        <c:otherwise>
                           <a href="booking-details.html?id=${booking.id}" class="car-media bg-cover"
                              style="background-image: url('images/car-placeholder.jpg');"></a>
                        </c:otherwise>
                     </c:choose>
                     <div class="car-content">
                        <h3 class="car-title text-nowrap fw-bold">
                           Order ID: ${booking.id} - ${booking.vehicleType} (${booking.vehicleBrand})
                        </h3>
                        <ul class="car-specfication">
                           <li><span>Amount</span>Rs. ${booking.totalBill}</li>
                           <li><span>Vehicle Number</span>
                              <c:choose>
                                 <c:when test="${booking.carId != 0}">
                                    ${booking.vehicleNumber}
                                 </c:when>
                                 <c:otherwise>
                                    Not Assigned
                                 </c:otherwise>
                              </c:choose>
                           </li>
           
                           <li><span>Ride Date</span>${booking.rideDate}</li>
                           <li><span>Ride Time</span>${booking.rideTime}</li>
                           <li><span>Pick-up Point:</span>${booking.pickUpPoint}</li>
                           <li><span>Drop-off Point: </span>${booking.dropOffPoint}</li>
                           <li><span>Passengers</span>${booking.passengers}</li>
                           <li><span>Distance</span>${booking.distanceKm}KM</li>
                           <li><span>Vehicle Fuel Type</span>${booking.vehicleFuelType}</li>
    <li><span>Booking Status:</span>
   <span class="badge ${booking.carId != 0 ? 'bg-success text-white' : 'bg-warning text-white'}">
      ${booking.carId != 0 ? 'Confirmed' : 'Pending'}
   </span>
</li>

<li><span>Payment Status:</span>
   <c:choose>
      <c:when test="${booking.paymentStatus == 0}">
         <span class="badge bg-warning text-white">Pending</span>
      </c:when>
      <c:when test="${booking.paymentStatus == 1}">
         <span class="badge bg-success text-white">Paid</span>
      </c:when>
   </c:choose>
</li>

<li><span>Trip Status:</span>
   <c:choose>
      <c:when test="${booking.tripStatus == 0}">
         <span class="badge bg-secondary text-white">Not Started</span>
      </c:when>
      <c:when test="${booking.tripStatus == 1}">
         <span class="badge bg-primary text-white">Started</span>
      </c:when>
      <c:when test="${booking.tripStatus == 3}">
         <span class="badge bg-danger text-white">Completed</span>
      </c:when>
   </c:choose>
</li>
    
             
                        </ul>
                        <div class="rider-info d-sm-flex my-4">
                           <div class="d-flex">
                              <div class="avatar position-relative">
                                 <c:choose>
                                    <c:when test="${not empty booking.driverImagePath}">
                                       <img src="${pageContext.request.contextPath}/${booking.driverImagePath}" class="rounded-circle" alt="Driver Image">
                                    </c:when>
                                    <c:otherwise>
                                       <img src="images/rider-sm.png" class="rounded-circle" alt="Driver Placeholder">
                                    </c:otherwise>
                                 </c:choose>
                                 <div class="verified position-absolute"><i class="fa-solid fa-circle-check"></i></div>
                              </div>
                              <div class="avatar-info ms-3">
                                 <h4 class="fw-bold mb-0 h5">
                                    <c:choose>
                                       <c:when test="${not empty booking.driverName}">
                                          ${booking.driverName}
                                       </c:when>
                                       <c:otherwise>
                                          Driver Not Assigned
                                       </c:otherwise>
                                    </c:choose>
                                 </h4>
                                 <c:if test="${not empty booking.driverExperience}">
                                    <span class="text-mute">${booking.driverExperience} years experience</span>
                                 </c:if>
                              </div>
                           </div>
                        </div>
                     <div class="car-cta mt-3">
					   <c:if test="${booking.carId == 0}">
					      <a href="#" onclick="confirmCancel(${booking.id})" class="btn ">Cancel Booking</a>
					   </c:if>
					
					   <c:if test="${booking.paymentStatus == 0 && booking.bookingStatus == 1}">
			<a href="payment.jsp?bookingId=${booking.id}&totalBill=${booking.totalBill}&registrationNumber=${sessionScope.customer.registrationNumber}&customerName=${sessionScope.customer.firstName}%20${sessionScope.customer.lastName}" class="btn">Online Payment</a>
			
					 
					   </c:if>
					</div>
                     </div>
                  </article>
               </c:if>
            </c:forEach>
         </div>
      </section>
   </main>
   <!-- Main End -->

   <!-- Footer Start -->
   <jsp:include page="./footer.jsp" />
   <!-- Footer End -->

   <script>
      function confirmCancel(bookingId) {
         if (confirm("Are you sure you want to cancel this booking?")) {
            window.location.href = "${pageContext.request.contextPath}/cancelBooking?id=" + bookingId;
         }
      }
   </script>
</body>
</html>