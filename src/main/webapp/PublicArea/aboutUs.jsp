<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>
<%@ page import="com.res.model.Blog " %>
<%@ page import="com.res.dao.BlogDAO" %>

<%
UserDAO userDAO = new UserDAO();
List<User> driverList = userDAO.getAllDrivers();
request.setAttribute("driverList", driverList);

BlogDAO blogeDAO = new BlogDAO();
List<Blog> blogList = blogeDAO.getAllBlogs();
request.setAttribute("blogList", blogList);
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="images/MegacabLogo.png">
   <title>Mega City Cab - About Us</title>
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
                  <h2 class="fw-bold text-white text-uppercase">About Us</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">About Us</li>
                     </ol>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Promo End -->

 

   <!-- About Start -->
   <section class="about-sec">
      <div class="container">
         <div class="row">
            <div class="col-xl-6 pe-xl-5 col-lg-5">
               <div class="choose-media position-relative pe-sm-5">
                  <img class="img-fluid" src="images/about.jpg" alt="Car">
                  <div class="popup-box">
                 <a class="venobox" data-vbtype="video" href="https://youtu.be/-rdGgjhOE8U" target="_blank">
    <i class="fa-solid fa-play"></i>
</a>
                 
                  </div>
               </div>
            </div>
            <div class="col-xl-6 col-lg-7">
               <div class="about-txt mt-5 mt-lg-0">
                  <span class="dot-title">ABOUT US</span>
                  <h2 class="text-uppercase sec-title mb-4">we provide the service from <span
                        class="text-primary">2008.</span></h2>
                  <p>
            Mega City Cab Service has been providing safe, reliable, and affordable transportation in Colombo since 2008. Our experienced drivers and well-maintained vehicles ensure a comfortable and hassle-free ride for every customer. Whether you need a quick city ride or a long-distance trip, we are here to serve you 24/7.
                     </p>
                  <div class="row mt-5">
                     <div class="col-sm-6">
                        <div class="card">
                           <h5>OUR MISSION:
                           </h5>
                           <p>
To provide safe, reliable, and affordable transportation with excellent customer service, ensuring a comfortable and hassle-free travel experience.
                              </p>
                           
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="card">
                           <h5>OUR VISION:
                           </h5>
                           <p>
       To be the most trusted cab service in Sri Lanka, offering innovative and efficient transport solutions for all.
                              </p>
                   
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div><!--  row end -->
         <div class="row mt-5 pt-4">
            <div class="about-details">
               <h2 class="sec-title text-uppercase mb-4">How We <span class="text-primary">Move</span> Together</h2>
               <p>At Mega City Cab Service, we are committed to making your travel experience seamless, safe, and convenient. Whether you're commuting within Colombo or heading out for a long journey, our professional drivers and well-maintained fleet ensure a smooth ride.</p>
               <p>We prioritize punctuality, comfort, and affordability, providing 24/7 service to meet your transportation needs. From airport transfers to corporate travel and daily rides, we move together with trust and reliability, ensuring a stress-free journey every time.</p>
            </div>
         </div>
      </div>
   </section>
   <!-- About End -->

   <!-- Fact Section Start -->
   <div class="fact-sec about-fact">
      <div class="container">
         <div class="row fact-bg bg-primary">
            <div class="col-lg-3 col-sm-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon"><img src="images/icons/like.png" alt="Rating"></div>
                  <div class="fact-txt ms-4">
                     <div class="count-box">
                        <span data-purecounter-start="0" data-purecounter-end="530" class="purecounter">10</span> +
                     </div>
                     <p>5 star reviews</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon"><img src="images/icons/rider-b.png" alt="Rating"></div>
                  <div class="fact-txt ms-4">
                     <div class="count-box">
                        <span data-purecounter-start="0" data-purecounter-end="10" class="purecounter">10</span> +
                     </div>
                     <p>happy rider</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon"><img src="images/icons/car-b.png" alt="Rating"></div>
                  <div class="fact-txt ms-4">
                     <div class="count-box">
                        <span data-purecounter-start="0" data-purecounter-end="5230" class="purecounter">10</span> +
                     </div>
                     <p>Total Cars</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 col-sm-6">
               <div class="d-flex align-items-center fact-card">
                  <div class="fact-icon"><img src="images/icons/award-b.png" alt="Rating"></div>
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
   </div>
   <!-- Fact Section End -->
   <!-- Rider Section Start -->
   <section class="rider-default sec-padding">
      <div class="container">
         <div class="row">
            <div class="sec-intro col-xl-6 col-sm-9 mx-auto text-center">
               <span class="dot-title text-uppercase">talented rider</span>
               <h2 class="sec-title text-uppercase">our top talented rider</h2>

            </div>
         </div>
         <br>
        <div class="row g-4">
            <c:forEach var="driver" items="${driverList}" varStatus="status" begin="0" end="3">
               <div class="col-lg-3 col-sm-6">
                  <div class="rider-man rider2 position-relative">
                     <div class="rider-media">
                           <img src="${pageContext.request.contextPath}/${driver.profilePhoto}"  alt="rider">
                        <div class="rider-meta position-absolute text-white">
                           <h4>${driver.name}</h4>
                           <ul class="list-unstyled">
                              <li>Email: ${driver.email}</li>
                              <li>Age: ${driver.age}</li>
                              <li>Experience: ${driver.experience} years</li>
                              <li>License ID: ${driver.licenseId}</li>
                              <li>Gender: ${driver.gender}</li>
                           </ul>
                        </div>
                     </div>
                     <div class="rider-info text-center">
                        <h3 class="h4"><a href="#">${driver.name}</a></h3>
                        <p>Talent Rider</p>
                     </div>
                  </div>
               </div> <!-- Rider Member End -->
            </c:forEach>
         </div>
         </div>
      </div>
   </section>
   <!-- Rider Section End -->

   <!-- Client Section Start -->
   <section class="client-3 sec-padding">
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
                              <p>
                Chamod Mullegama is the founder of Mega City Cab Service, dedicated to providing safe, reliable, and affordable transportation across Colombo. With a focus on customer satisfaction, he ensures top-quality service through well-maintained vehicles and professional drivers.

Under his leadership, Mega City Cab Service offers 24/7 taxi service, airport transfers, corporate travel, and package delivery. His vision is to make transportation convenient and hassle-free with easy online booking and transparent pricing.
                              </p>
                           </div>
                        </div>
                 
            </div> <!-- col end -->
         </div>
      </div>
   </section>
   <!-- Client Section End -->
   <!-- Blog Section Start -->
   <section class="blog-sec sec-padding">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-lg-6 mx-auto text-center">
                <h2 class="sec-title">Unlocking of Ride-Sharing article</h2>
            </div>
        </div>
        <div class="row mt-5 pt-5">
            <c:forEach var="blog" items="${blogList}" begin="0" end="2">
                <div class="col-xl-4 col-lg-4 col-sm-6">
                    <article class="single-entry rounded-3">
                        <div class="entry-thumb">
                            <a href="single-post-sidebar.html?id=${blog.id}">
                                <img class="img-fluid rounded-3" src="${pageContext.request.contextPath}/${blog.imagePath}" alt="${blog.title}" style="width: 100%; height: 220px; object-fit: cover;">
                            </a>
                        </div>
                        <div class="entry-content mt-4">
                            <div class="entry-meta text-xs">
                                <span><i class="fa-solid fa-calendar-days me-2"></i>${blog.date}</span>
                                <span><i class="fa-solid fa-comments me-2"></i>Comment (05)</span>
                            </div>
                            <h3 class="entry-title"><a href="single-post-sidebar.html?id=${blog.id}">${blog.title}</a></h3>
                            <p>${blog.summary}</p>
                        </div>
                    </article>
                </div><!-- Single Entry End -->
            </c:forEach>
        </div>
    </div>
</section>
   
   <!-- Footer Start -->
   <jsp:include page="./footer.jsp" />
   <!-- Footer End -->

</body>
</html>
