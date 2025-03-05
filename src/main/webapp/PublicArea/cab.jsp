
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>
<%
UserDAO userDAO = new UserDAO();
List<User> driverList = userDAO.getAllDrivers();
request.setAttribute("driverList", driverList);

VehicleDAO vehicleDAO = new VehicleDAO();
List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
request.setAttribute("vehicleList", vehicleList);
%>


<!DOCTYPE html>
<html lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="images/MegacabLogo.png">
   <title>Mega City Cab - Cabs</title>
   
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
                  <h2 class="fw-bold text-white text-uppercase">Car Listing</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Car Listing</li>
                     </ol>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Promo End -->

   <!-- Services Section Start -->
  <main class="py-5">
      <div class="container">
         <div class="row">
            <div class="col-xl-12">
               <div class="car-listings">
                  <c:forEach var="vehicle" items="${vehicleList}" varStatus="loop">
                     <article class="card mb-4 shadow-sm">
                        <div class="row g-2">
                           <div class="col-md-4">
                              <img src="${pageContext.request.contextPath}/${vehicle.imagePath}" 
                                   class="img-fluid rounded-start h-100 object-fit-cover" alt="${vehicle.brand} ${vehicle.vehicleType}">
                           </div>
                           <div class="col-md-8">
                              <div class="card-body">
                                 <h3 class="card-title fw-bold">
                                    <a href="#" class="text-decoration-none text-dark">${vehicle.brand} - ${vehicle.vehicleType}</a>
                                 </h3>
                                 
                                 <div class="row mt-3">
                                    <div class="col-md-6">
                                       <ul class="list-group list-group-flush">
                                          <li class="list-group-item d-flex justify-content-between">
                                             <span class="fw-semibold">Brand:</span> ${vehicle.brand}
                                          </li>
                                          <li class="list-group-item d-flex justify-content-between">
                                             <span class="fw-semibold">Doors:</span> ${vehicle.doors} doors
                                          </li>
                                          <li class="list-group-item d-flex justify-content-between">
                                             <span class="fw-semibold">Capacity:</span> ${vehicle.capacity} persons
                                          </li>
                                       </ul>
                                    </div>
                                    <div class="col-md-6">
                                       <ul class="list-group list-group-flush">
                                          <li class="list-group-item d-flex justify-content-between">
                                             <span class="fw-semibold">Eng No:</span> ${vehicle.engineNumber}
                                          </li>
                                          <li class="list-group-item d-flex justify-content-between">
                                             <span class="fw-semibold">Fuel:</span> ${vehicle.vehicleFuelType}
                                          </li>
                                          <li class="list-group-item d-flex justify-content-between">
                                             <span class="fw-semibold">Color:</span> ${vehicle.color}
                                          </li>
                                       </ul>
                                    </div>
                                 </div>
                                 
                                 <!-- Driver Info -->
                                 <div class="border-top border-bottom py-3 my-3">
                                    <div class="row align-items-center">
                                       <div class="col-md-7">
                                          <div class="d-flex align-items-center">
                                             <div class="position-relative">
                                                <img src="${pageContext.request.contextPath}/${vehicle.driverProfilePhoto}" 
                                                     alt="Driver" width="60" height="60" class="rounded-circle border">
                                                <span class="position-absolute bottom-0 end-0 badge bg-success rounded-circle">
                                                   <i class="fa-solid fa-check"></i>
                                                </span>
                                             </div>
                                             <div class="ms-3">
                                                <h5 class="fw-bold mb-0">${vehicle.driverName}</h5>
                                                <span class="text-muted fs-6">${vehicle.driverExperience} years with RideMates</span>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-md-5">
                                          <h5 class="fw-bold mb-2">Ratings:</h5>
                                          <div class="d-flex align-items-center">
                                             <div class="text-warning me-2">
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                             </div>
                                             <span class="text-muted">(4.9)</span>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <!-- Call To Action Buttons -->
                                 <div class="d-flex justify-content-end gap-2 mt-3">
                                    <a href="#" class="btn btn-outline-primary">
                                       <i class="fa-solid fa-info-circle me-1"></i> Vehicle Details
                                    </a>
                                    <a href="./bookRide.jsp" class="btn btn-primary">
                                       <i class="fa-solid fa-check-circle me-1"></i> Confirm Ride
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </article>
                  </c:forEach>
                  
                 <div class="pager mt-5">
                     <a href="#" class="prev-page"><i class="fa fa-angle-left"></i></a>
                     <span aria-current="page" class="page-numbers current">1</span>
                     <a href="#" class="page-numbers">2</a>
                     <a href="#" class="page-numbers">3</a>
                     <a href="#" class="page-numbers">4</a>
                     <a href="#" class="page-numbers">5</a>
                     <a href="#" class="next-page"><i class="fa fa-angle-right"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </main>
     <!-- Footer Start -->
   <jsp:include page="./footer.jsp" />
   <!-- Footer End -->
 