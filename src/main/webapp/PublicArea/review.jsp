
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Review " %>
<%@ page import="com.res.dao.ReviewDAO" %>

<%
    // Fetch the employee list from the database
    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviewList = reviewDAO.getAllReviews();
    request.setAttribute("reviewList", reviewList);
    
%>


<!DOCTYPE html>
<html lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="images/MegacabLogo.png">
    <title>Mega City Cab - Review</title>
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
                  <h2 class="fw-bold text-white text-uppercase">Review</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Review</li>
                     </ol>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Promo End -->

   <!-- Main End -->
   <main class="main sec-padding">
      <div class="container">
         <div class="row blog-lists-sidebar">
            <div class="col-lg-8">
               <article class="single-post">
                  <img src="images/single-post.jpg" alt="Car">
                  
         
                  <div class="entry-comments mt-5">
                    
                     <div class="write-comments mt-5">
                        <h3>Leave a Review</h3>
                        <form action="${pageContext.request.contextPath}/review" method="post" class="needs-validation" novalidate>
                            <c:if test="${not empty alertMessage}">
            <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                ${alertMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
             <% 
                // Clear the session attributes after displaying
                session.removeAttribute("alertMessage");
                session.removeAttribute("alertType");
            %>

        <div class="row">
            <div class="col-md-6 mb-3">
      
                <input type="text" id="firstName" name="firstName" class="form-control" placeholder="First Name" required>
                <div class="invalid-feedback">Please enter your first name.</div>
            </div>
            <div class="col-md-6 mb-3">
        
                <input type="text" id="lastName" name="lastName" class="form-control" placeholder="Last Name" required>
                <div class="invalid-feedback">Please enter your last name.</div>
            </div>
        </div>

        <div class="mb-3">

            <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required>
            <div class="invalid-feedback">Please enter a valid email address.</div>
        </div>

        <div class="mb-3">

            <textarea id="message" name="message" class="form-control" rows="6" placeholder="Write here" required></textarea>
            <div class="invalid-feedback">Please enter your review.</div>
        </div>
                <div class="form-group mt-5">
                    <button type="submit" class="btn btn-primary rounded-pill">Submit Review</button>
                </div>
            </form>
                     </div>

                  </div>
               </article><!-- Blog Entry End -->

            </div><!-- COL End -->

            <div class="col-lg-4">
               <aside class="sidebar">
                  <div class="widget">
                     <h3 class="widget-title">Recent Reviews</h3>
                  <div class="recent-posts">
    <c:forEach var="review" items="${reviewList}">
        <div class="rc-entry d-flex">
            <a href="single-post.html" class="flex-shrink-0">
        <img class="rounded" src="./images/user.png" alt="User Image" style="width: 75px; height: 75px;">
        
            </a>
            <div class="rc-content ps-3">
                <div class="entry-meta">
                
                </div>
                <h3 class="entry-title mt-2">
                    <a href="single-post.html">${review.firstName} ${review.lastName}</a>
                </h3>
                <p class="card-text">${review.message}</p>
            </div>
        </div> <!-- Recent Post End -->
    </c:forEach>
</div>
                  
                  </div> <!-- Widget End -->
                  <div class="widget">
                     <h3 class="widget-title">Social Share</h3>
                     <div class="social-share2">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                        <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                        <a href="#"><i class="fa-brands fa-whatsapp"></i></a>
                     </div>
                  </div><!-- Widget End -->
                
               </aside><!-- Sidebar End -->
            </div>
         </div>
      </div>
   </main>
   
   <!-- Main Start -->
            <jsp:include page="./footer.jsp" />
            
            
            <script>

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
   <!-- Footer Start -->
 