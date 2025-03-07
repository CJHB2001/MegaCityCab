package com.res.controller;

import static org.mockito.Mockito.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import service.BookingService;

public class BookingServletTest {
    private BookingServlet bookingServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private BookingService bookingService;

    @BeforeEach
    public void setUp() {
        bookingServlet = new BookingServlet();
        bookingService = new BookingService();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    public void testDeleteBooking() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("delete");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getSession()).thenReturn(session);

        bookingServlet.doGet(request, response);
        
        verify(response).sendRedirect(anyString());
        verify(session).setAttribute(eq("alertMessage"), anyString());
    }

    @Test
    public void testUpdateStatus() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("updateStatus");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("bookingStatus")).thenReturn("2");
        when(request.getSession()).thenReturn(session);

        bookingServlet.doPost(request, response);
        
        verify(response).sendRedirect(anyString());
        verify(session).setAttribute(eq("alertMessage"), anyString());
    }

    @Test
    public void testAssignCar() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("assignCar");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("carId")).thenReturn("5");
        when(request.getSession()).thenReturn(session);

        bookingServlet.doPost(request, response);
        
        verify(response).sendRedirect(anyString());
        verify(session).setAttribute(eq("alertMessage"), anyString());
    }

    @Test
    public void testAddBooking() throws ServletException, IOException {
        when(request.getParameter("customerId")).thenReturn("1003");
        when(request.getParameter("registrationNumber")).thenReturn("NEW-001");
        when(request.getParameter("email")).thenReturn("new@test.com");
        when(request.getParameter("name")).thenReturn("New User");
        when(request.getParameter("phoneNumber")).thenReturn("0772222222");
        when(request.getParameter("pickUpPoint")).thenReturn("Negombo");
        when(request.getParameter("dropOffPoint")).thenReturn("Colombo");
        when(request.getParameter("passengers")).thenReturn("2");
        when(request.getParameter("vehicleType")).thenReturn("Car");
        when(request.getParameter("distanceKm")).thenReturn("25.0");
        when(request.getParameter("totalBill")).thenReturn("3000.0");
        when(request.getParameter("rideDate")).thenReturn("2024-03-27");
        when(request.getParameter("rideTime")).thenReturn("09:00");
        when(request.getParameter("message")).thenReturn("Test booking");
        when(request.getSession()).thenReturn(session);

        bookingServlet.doPost(request, response);
        
        verify(response).sendRedirect(anyString());
        verify(session).setAttribute(eq("alertMessage"), anyString());
    }
}