<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="zxx">
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
     <title>Mega City Cab - Booking</title>
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
                  <h2 class="fw-bold text-white text-uppercase">Book your Ride</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Book Ride</li>
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
      <div class="container">
         <div class="row pb-5 mb-5">
            <div class="col-lg-12">
               <div class="card bg-light booking-sec">
                  <div class="text-center col-xl-7 col-md-10 mx-auto">
                     <h2 class="sec-title">Book your Ride Today!</h2>
                     <p>Booking your ride is a super easy process. Voluptatem fugiat nesciunt ab quis impedit esse dicta. Reiciendis officia, optio aut adipisci accusantium ullam perferendis deleniti. Obcaecati, placeat quas?</p>
                  </div>
                  <form action="${pageContext.request.contextPath}/booking" method="post" class="booking-form mt-5 row">
                     <!-- Hidden fields for session data -->
                     <input type="hidden" name="customerId" value="${sessionScope.customer.id}">
                     <input type="hidden" name="registrationNumber" value="${sessionScope.customer.registrationNumber}">
                     <input type="hidden" name="email" value="${sessionScope.customer.email}">

                     <div class="form-group col-lg-6">
                        <input class="form-control" type="text" name="name" placeholder="Your Name" required>
                        <span><i class="fa fa-user"></i></span>
                     </div>
                     <div class="form-group col-lg-6">
                        <input class="form-control" type="text" name="phoneNumber" placeholder="Phone Number" required>
                        <span><i class="fa fa-phone"></i></span>
                     </div>
                     <div class="form-group col-lg-6">
                        <input class="form-control" type="text" name="pickUpPoint" placeholder="Pick Up point" required>
                        <span><i class="fa fa-location-dot"></i></span>
                     </div>
                     <div class="form-group col-lg-6">
                        <input class="form-control" type="text" name="dropOffPoint" placeholder="Drop Off point" required>
                        <span><i class="fa fa-location-dot"></i></span>
                     </div>
                     <div class="form-group col-lg-6">
                        <select class="wide" name="passengers" id="passenger" required>
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                           <option value="5">5</option>
                           <option value="5+">5+</option>
                        </select>
                     </div>
                     <div class="form-group col-lg-6">
                        <select class="wide" name="vehicleType" id="select-car" required>
                           <option value="">Select Vehicle Type</option>
                           <option value="car" data-rate="200">Car</option>
                           <option value="van" data-rate="250">Van</option>
                           <option value="jeep" data-rate="220">Jeep</option>
                           <option value="tuk-tuk" data-rate="100">Tuk Tuk</option>
                           <option value="bus" data-rate="275">Bus</option>
                        </select>
                     </div>
                     <div class="form-group col-lg-6">
                        <input type="number" id="kmInput" name="distanceKm" class="form-control" placeholder="Enter Distance in KM" required>
                        <span><i class="fa fa-road"></i></span>
                     </div>
                     <div class="form-group col-lg-6">
                        <input type="text" id="totalBill" name="totalBill" class="form-control" placeholder="Total Bill (LKR)" readonly>
                        <span><i class="fa fa-money"></i></span>
                     </div>
					<%
					    java.time.LocalDate today = java.time.LocalDate.now();
					    java.time.LocalDate maxDate = today.plusYears(2);
					%>
					
					<div class="form-group col-lg-6">
					    <input type="date" id="rideDate" name="rideDate" class="form-control" placeholder="Select Date" required
					           min="<%= today %>" max="<%= maxDate %>">
					</div>
					                   
					      <div class="form-group col-lg-6">
					    <input type="time" id="rideTime" name="rideTime" class="form-control" placeholder="Select Time" required>
					</div>
                     <div class="form-group col-lg-12">
                        <textarea placeholder="Your Message..." name="message" id="message" cols="30" rows="6"></textarea>
                     </div>
                     <div class="form-group text-center mt-5">
                        <button type="submit" class="btn btn-primary">Book Now <i class="fa fa-arrow-right"></i></button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </main>
   <!-- Main End -->

   <!-- Footer Start -->
   <jsp:include page="./footer.jsp" />
   <!-- Footer End -->

   <script>
      // Bootstrap validation
      (function () {
         'use strict';
         var forms = document.querySelectorAll('.needs-validation');
         Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
               if (!form.checkValidity()) {
                  event.preventDefault();
                  event.stopPropagation();
               }
               form.classList.add('was-validated');
            }, false);
         });
      })();
   </script>
   <script>
      document.addEventListener("DOMContentLoaded", function () {
         let vehicleSelect = document.getElementById("select-car");
         let kmInput = document.getElementById("kmInput");
         let totalBill = document.getElementById("totalBill");

         function calculateBill() {
            let selectedOption = vehicleSelect.options[vehicleSelect.selectedIndex];
            let rate = selectedOption.getAttribute("data-rate");
            let km = parseFloat(kmInput.value);
            
            if (rate && km && km > 0) {
               totalBill.value = " LKR " + (rate * km);
            } else {
               totalBill.value = "";
            }
         }

         vehicleSelect.addEventListener("change", calculateBill);
         kmInput.addEventListener("input", calculateBill);
      });
   </script>
</body>
</html>