package service;

import java.sql.SQLException;
import com.res.dao.BookingDAO;
import com.res.model.Booking;

public class BookingService {
    private BookingDAO bookingDAO = new BookingDAO();

    public void addBooking(Booking booking) throws SQLException {
        bookingDAO.addBooking(booking);
    }
}