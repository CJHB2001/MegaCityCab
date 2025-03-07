package com.res.controller;

import static org.mockito.Mockito.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CustomerRegistrationServletTest {
    private CustomerRegistrationServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;

    @BeforeEach
    public void setUp() {
        servlet = new CustomerRegistrationServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    public void testSuccessfulRegistration() throws ServletException, IOException {
        when(request.getParameter("firstName")).thenReturn("Alice");
        when(request.getParameter("lastName")).thenReturn("Smith");
        when(request.getParameter("phone")).thenReturn("0772222888");
        when(request.getParameter("email")).thenReturn("test12e@test.com");
        when(request.getParameter("password")).thenReturn("SecurePass123");
        when(request.getParameter("addressLine1")).thenReturn("456 Oak St");
        when(request.getParameter("nicNumber")).thenReturn("198765439V");
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute(eq("alertMessage"), contains("successful"));
        verify(response).sendRedirect(anyString());
    }

    @Test
    public void testInvalidEmail() throws ServletException, IOException {
        when(request.getParameter("email")).thenReturn("invalid-email");
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute(eq("error"), anyString());
        verify(response).sendRedirect(anyString());
    }
}