package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.BookingDAO;
import com.res.model.Booking;
import com.res.model.Gallery;

public class BookingService {
    private BookingDAO bookingDAO = new BookingDAO();

    public void addBooking(Booking booking) throws SQLException {
        bookingDAO.addBooking(booking);
    }
    
    
    public List<Booking> getAllBookings() throws SQLException {
        return bookingDAO.getAllBookings();
    }
    
    public void updateBookingStatus(int bookingId, int status) throws SQLException {
        bookingDAO.updateBookingStatus(bookingId, status);
    }
    
    public void deleteBooking(int bookingId) throws SQLException {
    	bookingDAO.deleteBooking(bookingId);
    }
    
    public void assignCarToBooking(int bookingId, int carId) throws SQLException {
        bookingDAO.assignCarToBooking(bookingId, carId);
    }
    
    public void updateTripStatus(int bookingId, int tripStatus) throws SQLException {
        bookingDAO.updateTripStatus(bookingId, tripStatus);
    }
    
    public void updatePaymentStatus(int bookingId, int paymentStatus) throws SQLException {
        bookingDAO.updateTripStatus(bookingId, paymentStatus);
    }
    
    public Booking getBookingById(int bookingId) throws SQLException {
        return bookingDAO.getBookingById(bookingId);
    }
 
    public void assignCarToBooking(int bookingId, int carId, float newTotalBill, double discount) throws SQLException {
        bookingDAO.assignCarToBooking(bookingId, carId, newTotalBill, discount);
    }
    
}