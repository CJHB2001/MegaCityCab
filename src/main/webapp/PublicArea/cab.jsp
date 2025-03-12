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
                  <h2 class="fw-bold text-white text-uppercase">Cab Listing</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Cab Listing</li>
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
				   <article class="car-entry d-md-flex border p-3">
				     <div class="col-md-4">
				        <img src="${pageContext.request.contextPath}/${vehicle.imagePath}" 
				             class="img-fluid rounded-start h-100 object-fit-cover" alt="${vehicle.brand} ${vehicle.vehicleType}">
				       </div>
				      <div class="car-content">
				         <h3 class="car-title text-no-wrap fw-bold">
				            <a href="#">${vehicle.brand} - ${vehicle.vehicleType}</a>
				         </h3>
				         <ul class="car-specfication">
				            <li><span>Brand</span>${vehicle.brand}</li>
				            <li><span>Doors</span>${vehicle.doors} doors</li>
				            <li><span>Capacity</span>${vehicle.capacity} persons</li>
				            <li><span>Eng No</span>${vehicle.engineNumber}</li>
				            <li><span>Fuel</span>${vehicle.vehicleFuelType}</li>
				            <li><span>Color</span>${vehicle.color}</li>
				         </ul>
				         <div class="rider-info d-sm-flex my-4">
				            <div class="d-flex">
				               <div class="avatar position-relative">
				                  <img src="${pageContext.request.contextPath}/${vehicle.driverProfilePhoto}" 
				                       class="rounded-circle" alt="Driver">
				                  <div class="verified position-absolute">
				                     <i class="fa-solid fa-circle-check"></i>
				                  </div>
				               </div>
				               <div class="avatar-info ms-3">
				                  <h4 class="fw-bold mb-0 h5">${vehicle.driverName}</h4>
				                  <span class="text-muted">${vehicle.driverExperience} years with MegaCityCab</span>
				               </div>
				            </div>
				            <div class="ratings ms-sm-5">
				               <h4 class="fw-bold mb-0 h5">Ratings:</h4>
				               <div class="d-flex">
				                  <div class="rate">
				                     <i class="fa-solid fa-star"></i>
				                     <i class="fa-solid fa-star"></i>
				                     <i class="fa-solid fa-star"></i>
				                     <i class="fa-solid fa-star"></i>
				                     <i class="fa-solid fa-star"></i>
				                  </div>
				                  <div class="rate-points text-muted">
				                     (4.9)
				                  </div>
				               </div>
				            </div> <!-- Ratings End -->
				         </div>
				         <div class="car-cta mt-3">
				            <a href="#" class="btn">
				               Taxi Details
				            </a>
				            <a href="./bookRide.jsp" class="btn btn-primary">Confirm Ride</a>
				         </div>
				      </div>
				   </article> <!-- Single Car End -->
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
 