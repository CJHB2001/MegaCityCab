
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
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>HTML5 Template</title>

</head>

<body>

   <!-- Header Start -->
           <jsp:include page="./navBar.jsp" />
   <!-- Header End -->

   <!-- Slider Section End -->
   <section class="slider" style="background-image: url('images/road-bg.png');">
      <div class="container">
         <div class="row">
            <div class="col-12">
               <div class="slider-carousel swiper">
                  <div class="swiper-wrapper">
                     <div class="swiper-slide d-md-flex align-items-center">
                        <div class="slide-media order-md-2">
                           <img class="img-fluid" src="images/slide1.png" alt="">
                        </div>
                        <div class="slide-txt pe-lg-5 order-md-1">
                           <div class="slide-meta">
                              <span>your ride</span>
                              <span>your Way</span>
                              <span>your World</span>
                           </div>
                           <h1>Ride with Us, Unite the Commute.</h1>
                           <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed
                              vulputate mi sit.
                           </p>
                        </div>
                     </div> <!-- Slide Item End -->

                     <div class="swiper-slide d-md-flex align-items-center">
                        <div class="slide-media order-md-2">
                           <img class="img-fluid" src="images/slide2.png" alt="">
                        </div>
                        <div class="slide-txt pe-lg-5 order-md-1">
                           <div class="slide-meta">
                              <span>your World</span>
                              <span>your ride</span>
                              <span>your Way</span>
                           </div>
                           <h1>We are available in your City 24 Hours.</h1>
                           <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed
                              vulputate mi sit.
                           </p>
                        </div>
                     </div> <!-- Slide Item End -->
                     <div class="swiper-slide d-md-flex align-items-center">
                        <div class="slide-media order-md-2">
                           <img class="img-fluid" src="images/slide3.png" alt="">
                        </div>
                        <div class="slide-txt pe-lg-5 order-md-1">
                           <div class="slide-meta">
                              <span>your ride</span>
                              <span>your Way</span>
                              <span>your World</span>
                           </div>
                           <h1>Safety is our first priority, Riding.</h1>
                           <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed
                              vulputate mi sit.
                           </p>
                        </div>
                     </div> <!-- Slide Item End -->
                  </div>
                  <div class="swiper-pagination"></div>
                  <div class="autoplay-progress">
                     <svg viewBox="0 0 48 48">
                        <circle cx="24" cy="24" r="20"></circle>
                     </svg>
                     <span></span>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="road-bg position-relative" style="background-image: url('images/road-run.png')">
         <div class="container">
            <div class="d-flex justify-content-between position-relative">
               <img src="images/icons/taxi-r2.png" alt="" class="img-fluid anim-move move-3">
               <img src="images/icons/taxi-r1.png" alt="" class="img-fluid anim-move">
               <img src="images/icons/taxi-r1.png" alt="" class="img-fluid anim-move">
            </div>
         </div>
      </div>
   </section>
  
   <!-- How Start Section Start -->
   <section class="how-start sec-padding">
      <div class="container">
         <div class="row">
            <div class="col-xl-5 col-sm-9 mx-auto mb-5">
               <div class="text-center">
                  <h2 class="sec-title">how to get started</h2>
                  <p>Suspendisse ultrice gravida dictum fusce placerat ultricies fusce integer quis auctor elit sed
                     vulputate mi sit.</p>
               </div>
            </div>
         </div>
         <div class="row mt-5 work-progress">
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/user.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">create your account</h3>
                  <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis.</p>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/taxi.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">Find a Taxi</h3>
                  <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis.</p>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/driver.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">meet your driver</h3>
                  <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis.</p>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/trip.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">enjoy your trip</h3>
                  <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis.</p>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- How Start Section End -->

   <!-- Choose Section Start -->
   <section class="choose-sec sec-padding" style="background-image: url('images/choose-bg.png');">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-5 col-sm-7">
               <div class="choose-media pe-xl-5">
                  <img class="img-fluid" src="images/choose-car.png" alt="Car">
               </div>
            </div>
            <div class="col-lg-7">
               <div class="choose-txt ps-md-5 ms-md-4 mt-5 mt-lg-0">
                  <h2 class="sec-title mb-4">Why choose us?</h2>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                     et dolore magna
                     aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                     commodo consequat aute
                     irure dolor in reprehenderit.</p>
                  <div class="d-sm-flex mt-5">
                     <div class="choose-info">
                        <h4 class="text-uppercase">OUR MISSION:</h4>
                        <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed
                           vulputate mi sit.</p>
                     </div>
                     <div class="choose-info">
                        <h4 class="text-uppercase">OUR vision:</h4>
                        <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed
                           vulputate mi sit.</p>
                     </div>
                  </div>
                  <a href="#" class="btn btn-primary mt-5">Learn more <i class="fa fa-arrow-right"></i></a>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Choose Section End -->

   <!-- Services Section Start -->
   <section class="services sec-padding bg-primary">
      <div class="container">
         <div class="row">
            <div class="col-xl-5 col-sm-9 mx-auto text-center">
               <h2 class="sec-title">our popular services</h2>
               <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed vulputate mi
                  sit.</p>
            </div>
         </div>
         <div class="row pt-2 mt-5">
            <div class="swiper services-slider">
               <div class="swiper-button-next"></div>
               <div class="swiper-button-prev"></div>
               <div class="swiper-wrapper service-list">
                  <c:forEach var="service" items="${serviceList}" varStatus="status" begin="0" end="6">
    <div class="swiper-slide">
        <div class="service-card rounded-3 text-center">
            <div class="icon icon-sm">
                <img src="${pageContext.request.contextPath}/${service.imagePath}" alt="Service Image">
            </div>
            <h3>${service.serviceName}</h3>
            <p>${service.description}</p>
            <a href="#" class="btn btn-dark mt-3">View Details <i class="fa fa-arrow-right ms-2"></i></a>
        </div>
    </div>
</c:forEach>
                  
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Services Section End -->

   <!-- Fact Section Start -->
   <section class="fact-sec sec-padding">
      <div class="container">
         <div class="row fact-bg rounded-4" style="background-image: url('images/world.png');">
            <div class="col-lg-3 col-md-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon rounded-circle"><img src="images/icons/rating.png" alt="Rating"></div>
                  <div class="fact-txt ms-4">
                     <div class="count-box">
                        <span data-purecounter-start="0" data-purecounter-end="530" class="purecounter">10</span> +
                     </div>
                     <p>Happy Raider</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 col-md-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon rounded-circle"><img src="images/icons/car-award.png" alt="Rating"></div>
                  <div class="fact-txt ms-4">
                     <div class="count-box">
                        <span data-purecounter-start="0" data-purecounter-end="10" class="purecounter">10</span> +
                     </div>
                     <p>riding award</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 col-md-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon rounded-circle"><img src="images/icons/taxi-r2.png" alt="Rating"></div>
                  <div class="fact-txt ms-4">
                     <div class="count-box">
                        <span data-purecounter-start="0" data-purecounter-end="5230" class="purecounter">10</span> +
                     </div>
                     <p>Total Cars</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 col-md-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon rounded-circle"><img src="images/icons/rating.png" alt="Rating"></div>
                  <div class="fact-txt ms-4">
                     <div class="count-box">
                        <span data-purecounter-start="0" data-purecounter-end="2220" class="purecounter">10</span> +
                     </div>
                     <p>5 star reviews</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Fact Section End -->

   <!-- Rider Section Start -->
   <section class="rider-sec sec-padding">
      <div class="container">
         <div class="row">
            <div class="col-xl-5 col-sm-9 mx-auto text-center">
               <h2 class="sec-title">Our Ridenexa Team</h2>
               <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed vulputate mi
                  sit.</p>
            </div>
         </div>
         <div class="row mt-5 pt-5">
            <div class="col-lg-3 col-sm-6">
               <div class="rider-man">
                  <div class="rider-head rounded-3">
                     <div class="rider-media position-relative">
                        <img class="img-fluid rounded-3" src="images/rider1.jpg" alt="rider">
                        <div class="rider-meta position-absolute  rounded-3 text-white">
                           <h4>toyouta 458 mx</h4>
                           <ul class="list-unstyled">
                              <li>- Rating: 4.9</li>
                              <li>- star rating</li>
                              <li>- Category: Ford</li>
                              <li>- Gear : Auto</li>
                              <li>- Passenger: 03</li>
                              <li>- Poel: Petrol</li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="rider-info text-center mt-4">
                     <h3 class="h4"><a href="#">Esther Howard</a></h3>
                     <p>Talent Rider</p>
                  </div>
               </div>
            </div> <!-- Rider Member End -->
            <div class="col-lg-3 col-sm-6">
               <div class="rider-man">
                  <div class="rider-head rounded-3">
                     <div class="rider-media position-relative">
                        <img class="img-fluid rounded-3" src="images/rider2.png" alt="rider">
                        <div class="rider-meta position-absolute  rounded-3 text-white">
                           <h4>toyouta 458 mx</h4>
                           <ul class="list-unstyled">
                              <li>- Rating: 4.9</li>
                              <li>- star rating</li>
                              <li>- Category: Ford</li>
                              <li>- Gear : Auto</li>
                              <li>- Passenger: 03</li>
                              <li>- Poel: Petrol</li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="rider-info text-center mt-4">
                     <h3 class="h4"><a href="#">Esther Howard</a></h3>
                     <p>Talent Rider</p>
                  </div>
               </div>
            </div> <!-- Rider Member End -->
            <div class="col-lg-3 col-sm-6">
               <div class="rider-man">
                  <div class="rider-head rounded-3">
                     <div class="rider-media position-relative">
                        <img class="img-fluid rounded-3" src="images/rider4.png" alt="rider">
                        <div class="rider-meta position-absolute  rounded-3 text-white">
                           <h4>toyouta 458 mx</h4>
                           <ul class="list-unstyled">
                              <li>- Rating: 4.9</li>
                              <li>- star rating</li>
                              <li>- Category: Ford</li>
                              <li>- Gear : Auto</li>
                              <li>- Passenger: 03</li>
                              <li>- Poel: Petrol</li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="rider-info text-center mt-4">
                     <h3 class="h4"><a href="#">Esther Howard</a></h3>
                     <p>Talent Rider</p>
                  </div>
               </div>
            </div> <!-- Rider Member End -->
            <div class="col-lg-3 col-sm-6">
               <div class="rider-man">
                  <div class="rider-head rounded-3">
                     <div class="rider-media position-relative">
                        <img class="img-fluid rounded-3" src="images/ride3.png" alt="rider">
                        <div class="rider-meta position-absolute  rounded-3 text-white">
                           <h4>toyouta 458 mx</h4>
                           <ul class="list-unstyled">
                              <li>- Rating: 4.9</li>
                              <li>- star rating</li>
                              <li>- Category: Ford</li>
                              <li>- Gear : Auto</li>
                              <li>- Passenger: 03</li>
                              <li>- Poel: Petrol</li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="rider-info text-center mt-4">
                     <h3 class="h4"><a href="#">Esther Howard</a></h3>
                     <p>Talent Rider</p>
                  </div>
               </div>
            </div> <!-- Rider Member End -->
         </div>
      </div>
   </section>
   <!-- Rider Section End -->

   <!-- Feature Section Start -->
   <section class="feature-sec sec-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-6">
               <div class="feat-img">
                  <img class="img-fluid" src="images/feat1.png" alt="Feature">
               </div>
            </div>
            <div class="col-lg-6">
               <div class="feat-txt ps-lg-5 ms-lg-3 mt-5 mt-lg-0 ">
                  <h2 class="sec-title mb-4">elevate your taxi experience with ride-sharing.</h2>
                  <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed vulputate
                     mi sit. Auctor eu
                     augue ut lectus arcu bibendum at varius vel.</p>
                  <div class="row mt-5">
                     <div class="col-lg-6 col-sm-6">
                        <div class="card bg-light rounded-3 mb-3 mb-sm-0">
                           <h4><i class="fa-solid fa-circle-check fa-lg text-primary me-3"></i>safety first</h4>
                           <p class="mb-0">Gravida dictum fusce placerat ultricies integer quis auctor elit.</p>
                        </div>
                     </div>
                     <div class="col-lg-6 col-sm-6">
                        <div class="card bg-light rounded-3">
                           <h4><i class="fa-solid fa-circle-check fa-lg text-primary me-3"></i>affordable prices</h4>
                           <p class="mb-0">Gravida dictum fusce placerat ultricies integer quis auctor elit.</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Feature Section End -->

   <!-- Client Section Start -->
   <section class="client-sec graphic-bg">
      <div class="container">
         <div class="row">
            <div class="col-lg-5 mb-5 mb-sm-0">
               <div class="client-intro">
                  <h2 class="sec-title">Loved by thousands of rider and others people.</h2>
                  <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed vulputate
                     mi sit. Auctor eu
                     augue ut lectus arcu bibendum at varius vel.</p>
                  <a href="#" class="btn btn-dark mt-4">leave a review <i class="fa fa-arrow-right"></i></a>
               </div>
            </div>
            <div class="col-lg-7">
               <div class="review-wrapper position-relative pt-4">
                  <div class="swiper review-slider">
                     <div class="swiper-wrapper">
                        <div class="swiper-slide">
                           <div class="single-quote rounded-3 graphic-bg-light">
                              <div class="quote-head d-flex align-items-center mb-4">
                                 <div class="quote-img">
                                    <img src="images/customer1.png" class="rounded-circle"
                                       alt="Client">
                                 </div>
                                 <div class="quote-name ms-3">
                                    <h3>Courtney Henry</h3>
                                    <p class="mb-0">happy customer</p>
                                 </div>
                              </div>
                              <p>“Massa tincidunt dui ut ornare lectus sit amet est placerat mauris augue neque gravida
                                 in fermentum turpis egestas sed
                                 tempus. Adipiscing elit habitant morbi. Massa sapien faucibus et molestie ac”.</p>
                           </div>
                        </div><!-- Single Slide End -->
                        <div class="swiper-slide">
                           <div class="single-quote rounded-3 graphic-bg-light">
                              <div class="quote-head d-flex align-items-center mb-4">
                                 <div class="quote-img">
                                    <img src="images/entry4.jpg" class="rounded-circle"
                                       alt="Client">
                                 </div>
                                 <div class="quote-name ms-3">
                                    <h3>Courtney Henry</h3>
                                    <p class="mb-0">happy customer</p>
                                 </div>
                              </div>
                              <p>“Massa tincidunt dui ut ornare lectus sit amet est placerat mauris augue neque gravida
                                 in fermentum turpis egestas sed
                                 tempus. Adipiscing elit habitant morbi. Massa sapien faucibus et molestie ac”.</p>
                           </div>
                        </div><!-- Single Slide End -->
                        <div class="swiper-slide">
                           <div class="single-quote rounded-3  graphic-bg-light">
                              <div class="quote-head d-flex align-items-center mb-4">
                                 <div class="quote-img">
                                    <img src="images/customer1.png" class="rounded-circle" alt="Client">
                                 </div>
                                 <div class="quote-name ms-3">
                                    <h3>Courtney Henry</h3>
                                    <p class="mb-0">happy customer</p>
                                 </div>
                              </div>
                              <p>“Massa tincidunt dui ut ornare lectus sit amet est placerat mauris augue neque gravida
                                 in fermentum turpis egestas sed
                                 tempus. Adipiscing elit habitant morbi. Massa sapien faucibus et molestie ac”.</p>
                           </div>
                        </div><!-- Single Slide End -->
                        <div class="swiper-slide">
                           <div class="single-quote rounded-3  graphic-bg-light">
                              <div class="quote-head d-flex align-items-center mb-4">
                                 <div class="quote-img">
                                    <img src="images/customer1.png" class="rounded-circle" alt="Client">
                                 </div>
                                 <div class="quote-name ms-3">
                                    <h3>Courtney Henry</h3>
                                    <p class="mb-0">happy customer</p>
                                 </div>
                              </div>
                              <p>“Massa tincidunt dui ut ornare lectus sit amet est placerat mauris augue neque gravida
                                 in fermentum turpis egestas sed
                                 tempus. Adipiscing elit habitant morbi. Massa sapien faucibus et molestie ac”.</p>
                           </div>
                        </div><!-- Single Slide End -->
                     </div>
                     <div class="swiper-button-next"></div>
                     <div class="swiper-button-prev"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Client Section End -->

   <!-- Blog Section Start -->
   <section class="blog-sec sec-padding">
      <div class="container">
         <div class="row">
            <div class="col-xl-5 col-sm-9 mx-auto text-center">
               <h2 class="sec-title">Unlocking Latest Posts</h2>
               <p>Suspendisse ultrice gravida dictum fusce placerat ultricies integer quis auctor elit sed vulputate mi
                  sit.</p>
            </div>
         </div>
         <div class="blog-lists row row-cols-lg-2 row-cols-1 gy-4 mt-5">
            <div class="col">
               <article class="single-entry list-entry d-sm-flex align-items-center justify-conetent-between rounded-3">
                  <div class="entry-thumb">
                     <a href="single-post-sidebar.html">
                        <img src="images/entry1.jpg" alt="">
                     </a>
                  </div>
                  <div class="entry-content">
                     <div class="entry-meta text-xs">
                        <span><i class="fa-solid fa-calendar-days me-2"></i>14 June 2023</span>
                        <span><i class="fa-solid fa-comments me-2"></i>Comment (05)</span>
                     </div>
                     <h3 class="entry-title"><a href="single-post-sidebar.html">Interdum velit laoreet id donec ultrices
                           tincidunt arcu
                           tincidunt tortor.</a></h3>
                     <a href="#" class="btn btn-info">Read more</a>
                  </div>
               </article>
            </div>
            <div class="col">
               <article class="single-entry list-entry d-sm-flex align-items-center justify-conetent-between rounded-3">
                  <div class="entry-thumb">
                     <a href="#">
                        <img src="images/entry3.jpg" alt="">
                     </a>
                  </div>
                  <div class="entry-content">
                     <div class="entry-meta text-xs">
                        <span><i class="fa-solid fa-calendar-days me-2"></i>14 June 2023</span>
                        <span><i class="fa-solid fa-comments me-2"></i>Comment (05)</span>
                     </div>
                     <h3 class="entry-title"><a href="single-post-sidebar.html">Interdum velit laoreet id donec ultrices
                           tincidunt arcu
                           tincidunt tortor.</a></h3>
                     <a href="#" class="btn btn-info">Read more</a>
                  </div>
               </article>
            </div>
            <div class="col">
               <article
                  class="single-entry list-entry  d-sm-flex align-items-center justify-conetent-between rounded-3">
                  <div class="entry-thumb">
                     <a href="single-post-sidebar.html">
                        <img src="images/entry2.jpg" alt="">
                     </a>
                  </div>
                  <div class="entry-content">
                     <div class="entry-meta text-xs">
                        <span><i class="fa-solid fa-calendar-days me-2"></i>14 June 2023</span>
                        <span><i class="fa-solid fa-comments me-2"></i>Comment (05)</span>
                     </div>
                     <h3 class="entry-title"><a href="single-post-sidebar.html">Interdum velit laoreet id donec ultrices
                           tincidunt arcu
                           tincidunt tortor.</a></h3>
                     <a href="#" class="btn btn-info">Read more</a>
                  </div>
               </article>
            </div>
            <div class="col">
               <article
                  class="single-entry list-entry  d-sm-flex align-items-center justify-conetent-between rounded-3">
                  <div class="entry-thumb">
                     <a href="single-post-sidebar.html">
                        <img src="images/entry4.jpg" alt="">
                     </a>
                  </div>
                  <div class="entry-content">
                     <div class="entry-meta text-xs">
                        <span><i class="fa-solid fa-calendar-days me-2"></i>14 June 2023</span>
                        <span><i class="fa-solid fa-comments me-2"></i>Comment (05)</span>
                     </div>
                     <h3 class="entry-title"><a href="single-post-sidebar.html">Interdum velit laoreet id donec ultrices
                           tincidunt arcu
                           tincidunt tortor.</a></h3>
                     <a href="#" class="btn btn-info">Read more</a>
                  </div>
               </article>
            </div>
         </div>
      </div>
   </section>
   <!-- Blog Section End -->
              <jsp:include page="./footer.jsp" />
<!-- Footer Start -->
