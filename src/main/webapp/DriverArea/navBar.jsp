<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="./assets/images/MegacabLogo.png">
    <link rel="stylesheet" href="./css/style.css">
           <jsp:include page="./toastr-config.jsp" />
    <title>Mega City Cab</title>
</head>
<body>
    <nav>
        <i class='bx bx-menu toggle-sidebar'></i>
        <form action="#">
            <div class="form-group">
                <input type="text" placeholder="Search...">
                <i class='bx bx-search icon'></i>
            </div>
        </form>
        <a href="#" class="nav-link">
       
        </a>
        <a href="#" class="nav-link">
        
        </a>
        <span class="divider"></span>
        <div class="profile">

            <c:if test="${not empty sessionScope.user}">
                <span>Driver -  ${sessionScope.user.email}</span>
            </c:if>
   
             <img src="${pageContext.request.contextPath}/${user.profilePhoto}"  alt="rider">
            <ul class="profile-link">
      
               <li>
   <li>
    <a href="#" onclick="confirmLogout()">
        <i class='bx bxs-log-out-circle'></i> Logout
    </a>
</li>
    
</li>
            </ul>
        </div>
        <!-- Display Admin Email on the Right Side -->
        
    </nav>
    <!-- NAVBAR -->

    <!-- MAIN -->
    <main>
        <!-- Your main content goes here -->
    </main>
    <!-- MAIN -->
<script type="text/javascript">
  function confirmLogout() {
    if (confirm("Are you sure you want to log out?")) {
      window.location.href = "${pageContext.request.contextPath}/logout";
    }
  }
</script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="./js/script.js"></script>
</body>
</html>