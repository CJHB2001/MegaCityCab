
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Service " %>
<%@ page import="com.res.dao.ServiceDAO" %>
<%
    // Fetch the employee list from the database
    ServiceDAO serviceDAO = new ServiceDAO();
    List<Service> servicList = serviceDAO.getAllServices();
    request.setAttribute("serviceList", servicList);
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="images/MegacabLogo.png">
    <title>Mega City Cab - Services</title>
   
</head>

<body>

   <!-- Header Start -->
             <jsp:include page="./navBar.jsp" />
   <!-- Header End -->

   <!-- Promo Start -->
  
   <!-- Promo End -->

   <!-- Services Section Start -->

   <!-- Promo Start -->
   <section class="promo-sec" style="background: url('images/promo-bg.jpg')no-repeat center center / cover;">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="promo-wrap text-center">
                  <h2 class="fw-bold text-white text-uppercase">our services</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">services</li>
                     </ol>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Promo End -->

   <!-- Services Section Start -->
 <section class="services-sec3 sec-padding">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-5 col-sm-8 mx-auto text-center">
                <h2 class="sec-title">Our Popular Services</h2>
                <p>Reliable and comfortable cab service for city and long-distance travel</p>
            </div>
        </div>
        <div class="row pt-2 mt-5 g-4">
            <c:forEach var="service" items="${serviceList}">
                <div class="col-xl-3 col-md-4 col-sm-6">
                    <div class="service-card rounded-3 text-center">
                          <img src="${pageContext.request.contextPath}/${service.imagePath}" 
                                 alt="${service.serviceName}" 
                                 class="img-fluid" style="max-width: 100px; height: auto;">
                        <h3 class="service-title">
                           ${service.serviceName}
                        </h3>
                        <p>${service.description}</p>
                       
                    </div>
                </div> 
            </c:forEach>
        </div>
    </div>
</section>
 
   <!-- Services Section End -->

   <!-- Ride CTA Section Start -->
   
   <!-- Ride CTA Section End -->
   <!-- Client Section Start -->
   <section class="client-3 sec-padding mb-10">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-xl-4 col-md-4">
               <div class="review-cover">
                  <img class="rounded-4 img-fluid" src="images/review-cover.png" alt="">
               </div>
            </div>
            <div class="col-xl-8 col-md-8">
               <div class="review-3-wrap">
                  <div class="swiper review-3">
                     <div class="swiper-wrapper">

<div class="swiper-slide">
   <div class="s-quote">
      <div class="quote-head">
         <h3>Chamod Mullegama</h3>
         <p>Owner, Mega City Cab Service</p>
      </div>
      <p>“At Mega City Cab Service, we take pride in offering a wide range of transportation solutions tailored to meet our customers' needs. Our services include **Cab Booking** for instant and reliable taxi rides, **Car Rental** with flexible options and affordable rates, and **City Transfers** to ensure smooth and budget-friendly travel between cities. Additionally, we provide an eco-friendly **Carpool Service** for cost-effective shared rides and a premium **Luxury Car Hire** service for special occasions and VIP experiences. Our goal is to make every journey safe, comfortable, and hassle-free for our customers.”</p>
   </div>
</div>

                 
                     </div>
                     <div class="swiper-pagination"></div>
                  </div>
               </div>
             
               </div>
            </div> <!-- col end -->
         </div>
      </div>
   </section>
     <!-- Footer Start -->
   <jsp:include page="./footer.jsp" />
   <!-- Footer End -->
 