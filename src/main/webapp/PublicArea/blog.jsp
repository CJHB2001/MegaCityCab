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
   <title>Mega City Cab - Blog Post</title>
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
						<h2 class="fw-bold text-white text-uppercase">blog post</h2>
						<nav aria-label="breadcrumb w-75 mx-auto">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">blog</li>
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
        <div class="row">
            <div class="col-lg-8">
                <div class="post-lists">
                    <div class="row g-4">
                        <c:forEach var="blog" items="${blogList}">
                            <div class="col-lg-6 col-sm-6">
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
                        
                        <div class="pager mt-5 pt-3">
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
            <div class="col-lg-4">
                <aside class="sidebar">
                  
                    <div class="widget">
                        <h3 class="widget-title">Recent Post</h3>
                        <div class="recent-posts">
                            <c:forEach var="recentBlog" items="${blogList}" begin="0" end="4">
                                <div class="rc-entry d-flex align-items-center">
                                    <a href="single-post-sidebar.html?id=${recentBlog.id}" class="flex-shrink-0">
                                        <img class="rounded" src="${pageContext.request.contextPath}/${recentBlog.imagePath}" alt="${recentBlog.title}" style="width: 80px; height: 80px; object-fit: cover;">
                                    </a>
                                    <div class="rc-content ps-3">
                                        <div class="entry-meta">
                                            <span><i class="fa-solid fa-calendar-days me-2"></i>${recentBlog.date}</span>
                                        </div>
                                        <h3 class="entry-title mt-2"><a href="single-post-sidebar.html?id=${recentBlog.id}">${recentBlog.title}</a></h3>
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
   <!-- Footer Start -->
   <jsp:include page="./footer.jsp" />
   <!-- Footer End -->

</body>
</html>
