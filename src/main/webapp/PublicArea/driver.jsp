<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>

<%
UserDAO userDAO = new UserDAO();
List<User> driverList = userDAO.getAllDrivers();
request.setAttribute("driverList", driverList);
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>Mega City Cab - Riders</title>
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
                  <h2 class="fw-bold text-white text-uppercase">all riders</h2>
                  <nav aria-label="breadcrumb w-75 mx-auto">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">All Riders</li>
                     </ol>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Promo End -->

   <main class="main rider-default sec-padding">
      <div class="container">
         <div class="row g-4">
            <c:forEach var="driver" items="${driverList}">
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
   </main>
   
   <!-- Footer Start -->
   <jsp:include page="./footer.jsp" />
   <!-- Footer End -->

</body>
</html>
