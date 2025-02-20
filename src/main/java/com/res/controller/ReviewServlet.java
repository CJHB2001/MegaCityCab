package com.res.controller;


import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.res.model.Review;
import service.ReviewService;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("delete".equals(action)) {
            int reviewId = Integer.parseInt(request.getParameter("id"));
            try {
                reviewService.deleteReview(reviewId);
                session.setAttribute("alertMessage", "Review deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/review.jsp");
        } else {
            try {
                request.setAttribute("reviewList", reviewService.getAllReviews());
                request.getRequestDispatcher("/PublicArea/review.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/PublicArea/review.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Review review = new Review(firstName, lastName, email,message);
        HttpSession session = request.getSession();

        try {
            reviewService.addReview(review);
            session.setAttribute("alertMessage", "Review submitted successfully!");
            session.setAttribute("alertType", "success");
        } catch (SQLException e) {
            session.setAttribute("alertMessage", "Error: " + e.getMessage());
            session.setAttribute("alertType", "danger");
        }
        response.sendRedirect(request.getContextPath() + "/PublicArea/review.jsp");
    }
}