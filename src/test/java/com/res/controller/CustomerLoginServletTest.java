package com.res.controller;

import static org.mockito.Mockito.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.res.model.Customer;

public class CustomerLoginServletTest {
    private CustomerLoginServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;

    @BeforeEach
    public void setUp() {
        servlet = new CustomerLoginServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    public void testSuccessfulLogin() throws ServletException, IOException {
        when(request.getParameter("email")).thenReturn("service123@test.com");
        when(request.getParameter("password")).thenReturn("servicepass");
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute(eq("customer"), any(Customer.class));
        verify(response).sendRedirect(anyString());
    }

    @Test
    public void testInvalidCredentials() throws ServletException, IOException {
        when(request.getParameter("email")).thenReturn("wrong@test.com");
        when(request.getParameter("password")).thenReturn("wrongPass");
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute(eq("error"), anyString());
        verify(response).sendRedirect(anyString());
    }
}