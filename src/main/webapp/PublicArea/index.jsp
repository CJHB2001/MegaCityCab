
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Service " %>
<%@ page import="com.res.dao.ServiceDAO" %>
<%@ page import="com.res.model.Gallery" %>
<%@ page import="com.res.dao.GalleryDAO" %>
<%@ page import="com.res.model.Review " %>
<%@ page import="com.res.dao.ReviewDAO" %>
<%
    // Fetch the employee list from the database
    ServiceDAO serviceDAO = new ServiceDAO();
    List<Service> servicList = serviceDAO.getAllServices();
    request.setAttribute("serviceList", servicList);
    
    GalleryDAO galleryDAO = new GalleryDAO();
    List<Gallery> galleryList = galleryDAO.getAllGalleries();
    request.setAttribute("galleryList", galleryList);
    
    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviewList = reviewDAO.getAllReviews();
    request.setAttribute("reviewList", reviewList);
%>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">

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
                        <img class="img-fluid" src="images/slide1.png" alt="Ride with Us">
                     </div>
                     <div class="slide-txt pe-lg-5 order-md-1">
                        <div class="slide-meta">
                           <span>Your Ride</span>
                           <span>Your Way</span>
                           <span>Your World</span>
                        </div>
                        <h1>Experience Seamless Rides with Mega City Cab</h1>
                        <p>Reliable, comfortable, and always available—our cab service ensures that every journey is smooth and stress-free. Ride with professionals who prioritize your safety and convenience.</p>
                     </div>
                  </div> <!-- Slide Item End -->

                  <div class="swiper-slide d-md-flex align-items-center">
                     <div class="slide-media order-md-2">
                        <img class="img-fluid" src="images/slide2.png" alt="24/7 Service">
                     </div>
                     <div class="slide-txt pe-lg-5 order-md-1">
                        <div class="slide-meta">
                           <span>Your World</span>
                           <span>Your Ride</span>
                           <span>Your Way</span>
                        </div>
                        <h1>Available 24/7 in Your City</h1>
                        <p>Day or night, rain or shine—Mega City Cab Service is here to provide you with safe and timely transportation. No matter where you need to go, we are just a call away.</p>
                     </div>
                  </div> <!-- Slide Item End -->

                  <div class="swiper-slide d-md-flex align-items-center">
                     <div class="slide-media order-md-2">
                        <img class="img-fluid" src="images/slide3.png" alt="Safety First">
                     </div>
                     <div class="slide-txt pe-lg-5 order-md-1">
                        <div class="slide-meta">
                           <span>Your Ride</span>
                           <span>Your Way</span>
                           <span>Your World</span>
                        </div>
                        <h1>Safety is Our Top Priority</h1>
                        <p>Your well-being matters to us. Our trained drivers, well-maintained vehicles, and advanced tracking systems ensure that you reach your destination securely and comfortably.</p>
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
            <img src="images/icons/taxi-r2.png" alt="Moving Taxi" class="img-fluid anim-move move-3">
            <img src="images/icons/taxi-r1.png" alt="Moving Taxi" class="img-fluid anim-move">
            <img src="images/icons/taxi-r1.png" alt="Moving Taxi" class="img-fluid anim-move">
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
            <h2 class="sec-title">How to Get Started</h2>
<p>Sign up, book a taxi, meet your driver, and enjoy a safe and comfortable ride with Mega City Cab.</p>
            
               </div>
            </div>
         </div>
         <div class="row mt-5 work-progress">
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/user.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">create your account</h3>
                  <p>Sign up easily and access our cab booking services anytime.</p>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/taxi.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">Book a Cab</h3>
                  <p>Choose a taxi that suits your needs and budget.</p>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/driver.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">meet your driver</h3>
                  <p>Get driver details, track your ride, and connect easily.</p>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="card">
                  <span class="icon ms-3"><img src="images/icons/trip.png" alt="user"></span>
                  <h3 class="h5 text-capitalize">enjoy your trip</h3>
                  <p>Sit back, relax, and reach your destination safely.</p>
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
                  <p>  At Mega City Cab, your safety and comfort are our top priorities. Enjoy punctual pickups, professional drivers, and a seamless booking experience that makes every ride stress-free.</p>
                  <div class="d-sm-flex mt-5">
                     <div class="choose-info">
                        <h4 class="text-uppercase">OUR MISSION:</h4>
                        <p>To provide safe, reliable, and affordable transportation with excellent customer service, ensuring a comfortable and hassle-free travel experience.</p>
                     </div>
                     <div class="choose-info">
                        <h4 class="text-uppercase">OUR vision:</h4>
                        <p>To be the most trusted cab service in Sri Lanka, offering innovative and efficient transport solutions for all.</p>
                     </div>
                  </div>
                  <a href="./aboutUs.jsp" class="btn btn-primary mt-5">Learn more <i class="fa fa-arrow-right"></i></a>
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
               <p>Reliable and comfortable cab service for city and long-distance travel</p>
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
            <a href="./service.jsp" class="btn btn-dark mt-3">View Details <i class="fa fa-arrow-right ms-2"></i></a>
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
            <h2 class="sec-title">Our Team</h2>
            <p>Meet the dedicated professionals behind Mega City Cab Service, committed to providing safe and reliable rides.</p>
         </div>
      </div>
      <div class="row mt-5 pt-5">
         <div class="col-lg-3 col-sm-6">
            <div class="rider-man">
               <div class="rider-head rounded-3">
                  <div class="rider-media position-relative">
                     <img src="images/review-cover.png" alt="Chamod Mullegama" style="width: 100%; height: 250px; object-fit: cover; border-radius: 10px;">
                     <div class="rider-meta position-absolute rounded-3 text-white">
                        <h4>Founder & CEO</h4>
                        <ul class="list-unstyled">
                           <li>- Name: Chamod Mullegama</li>
                           <li>- Experience: 10+ Years</li>
                           <li>- Specialty: Business Strategy</li>
                           <li>- Vision: Revolutionizing urban transport</li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="rider-info text-center mt-4">
                  <h3 class="h4"><a href="#">Chamod Mullegama</a></h3>
                  <p>Founder & CEO</p>
               </div>
            </div>
         </div> <!-- Team Member End -->

         <div class="col-lg-3 col-sm-6">
            <div class="rider-man">
               <div class="rider-head rounded-3">
                  <div class="rider-media position-relative">
                     <img src="images/rider2.png" alt="Visitha Rajapaksha" style="width: 100%; height: 250px; object-fit: cover; border-radius: 10px;">
                     <div class="rider-meta position-absolute rounded-3 text-white">
                        <h4>Operations Manager</h4>
                        <ul class="list-unstyled">
                           <li>- Name: Visitha Rajapaksha</li>
                           <li>- Experience: 7+ Years</li>
                           <li>- Specialty: Fleet Management</li>
                           <li>- Focus: Ensuring smooth operations</li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="rider-info text-center mt-4">
                  <h3 class="h4"><a href="#">Visitha Rajapaksha</a></h3>
                  <p>Operations Manager</p>
               </div>
            </div>
         </div> <!-- Team Member End -->

         <div class="col-lg-3 col-sm-6">
            <div class="rider-man">
               <div class="rider-head rounded-3">
                  <div class="rider-media position-relative">
                     <img src="images/rider4.png" alt="Lakshan Dissanayake" style="width: 100%; height: 250px; object-fit: cover; border-radius: 10px;">
                     <div class="rider-meta position-absolute rounded-3 text-white">
                        <h4>Lead Driver</h4>
                        <ul class="list-unstyled">
                           <li>- Name: Lakshan Dissanayake</li>
                           <li>- Experience: 5+ Years</li>
                           <li>- Specialty: Long-Distance & VIP Rides</li>
                           <li>- Focus: Passenger safety & comfort</li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="rider-info text-center mt-4">
                  <h3 class="h4"><a href="#">Lakshan Dissanayake</a></h3>
                  <p>Lead Driver</p>
               </div>
            </div>
         </div> <!-- Team Member End -->

         <div class="col-lg-3 col-sm-6">
            <div class="rider-man">
               <div class="rider-head rounded-3">
                  <div class="rider-media position-relative">
                     <img src="images/ride3.png" alt="Yomal Thushara" style="width: 100%; height: 250px; object-fit: cover; border-radius: 10px;">
                     <div class="rider-meta position-absolute rounded-3 text-white">
                        <h4>Customer Support Manager</h4>
                        <ul class="list-unstyled">
                           <li>- Name: Yomal Thushara</li>
                           <li>- Experience: 6+ Years</li>
                           <li>- Specialty: Customer Relations</li>
                           <li>- Focus: Providing top-tier support</li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="rider-info text-center mt-4">
                  <h3 class="h4"><a href="#">Yomal Thushara</a></h3>
                  <p>Customer Support Manager</p>
               </div>
            </div>
         </div> <!-- Team Member End -->
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
               <h2 class="sec-title mb-4">Enhance Your Travel Experience with Mega City Cab Service.</h2>
               <p>Mega City Cab Service offers a seamless and reliable transportation experience. Whether you're commuting to work, heading to the airport, or exploring the city, our professional drivers ensure a comfortable and stress-free ride every time.</p>
               <div class="row mt-5">
                  <div class="col-lg-6 col-sm-6">
                     <div class="card bg-light rounded-3 mb-3 mb-sm-0">
                        <h4><i class="fa-solid fa-circle-check fa-lg text-primary me-3"></i>Reliable Rides</h4>
                        <p class="mb-0">Experience punctual and efficient service with our dedicated team of drivers.</p>
                     </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                     <div class="card bg-light rounded-3">
                        <h4><i class="fa-solid fa-circle-check fa-lg text-primary me-3"></i>Affordable Fares</h4>
                        <p class="mb-0">Enjoy cost-effective travel solutions with transparent pricing  charges.</p>
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
                 <h2 class="sec-title">Trusted by Thousands of Happy Customers.</h2>
<p>Mega City Cab Service is the top choice for safe, reliable, and comfortable rides. Our customers love the convenience, professionalism, and affordable pricing we offer every day.</p>
                 
                  <a href="./review.jsp" class="btn btn-dark mt-4">leave a review <i class="fa fa-arrow-right"></i></a>
               </div>
            </div>
            <div class="col-lg-7">
               <div class="review-wrapper position-relative pt-4">
                  <div class="swiper review-slider">
                     <div class="swiper-wrapper">
                       <c:forEach var="review" items="${reviewList}">
    <div class="swiper-slide">
        <div class="single-quote rounded-3 graphic-bg-light">
            <div class="quote-head d-flex align-items-center mb-4">
                <div class="quote-img">
                    <img src="images/customer1.png" class="rounded-circle" alt="Client"> <!-- Default Image -->
                </div>
                <div class="quote-name ms-3">
                    <h3>${review.firstName} ${review.lastName}</h3>
                    <p class="mb-0">Happy Customer</p> <!-- Assuming this is a static label -->
                </div>
            </div>
            <p>“${review.message}”</p>
        </div>
    </div><!-- Single Slide End -->
</c:forEach>
                       
                        
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
<section class="rider-sec sec-padding">
      <div class="container">
         <div class="row">
            <div class="col-xl-5 col-sm-9 mx-auto text-center">
               <h2 class="sec-title">Our Gallery</h2>
               <p>Browse through our gallery to discover the highlights of our services and experiences..</p>
            </div>
         </div>
         <div class="row mt-5 pt-5">
         <c:forEach var="gallery" items="${galleryList}">
    <div class="col-lg-3 col-sm-6">
        <div class="rider-man">
            <div class="rider-head rounded-3">
                <div class="rider-media position-relative">
       <img class="img-fluid rounded-3" src="${pageContext.request.contextPath}/${gallery.imagePath}" 
     alt="Gallery Image" 
     style="width: 100%; height: 250px; object-fit: cover; border-radius: 10px;">
       
                    <div class="rider-meta position-absolute rounded-3 text-white">
                 
                        <p>${gallery.description}</p>
                    </div>
                </div>
            </div>
               <div class="rider-info text-center mt-4">
                            <h5>${gallery.title}</h5>
                 
                  </div>
        </div>
    </div>
</c:forEach>

             <!-- Rider Member End -->
         </div>
      </div>
    
   </section>
  
   <!-- Blog Section End -->
              <jsp:include page="./footer.jsp" />
<!-- Footer Start -->
