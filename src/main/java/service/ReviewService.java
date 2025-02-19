package service;

import java.sql.SQLException;
import java.util.List;
import com.res.dao.ReviewDAO;
import com.res.model.Review;

public class ReviewService {
    private ReviewDAO reviewDAO = new ReviewDAO();

    public void addReview(Review review) throws SQLException {
        reviewDAO.addReview(review);
    }

    public List<Review> getAllReviews() throws SQLException {
        return reviewDAO.getAllReviews();
    }

    public void deleteReview(int reviewId) throws SQLException {
        reviewDAO.deleteReview(reviewId);
    }
}