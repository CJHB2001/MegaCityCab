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
}