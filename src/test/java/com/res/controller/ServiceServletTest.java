package com.res.controller;

import static org.mockito.Mockito.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Service;

public class ServiceServletTest {
    private ServiceServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;

    @BeforeEach
    public void setUp() {
        servlet = new ServiceServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    public void testAddService() throws Exception {
        when(request.getParameter("serviceName")).thenReturn("New Service");
        when(request.getParameter("description")).thenReturn("New Description");
        when(request.getPart("image")).thenReturn(mock(Part.class));
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute(eq("alertMessage"), contains("added successfully"));
        verify(response).sendRedirect(anyString());
    }

    @Test
    public void testUpdateService() throws Exception {
        when(request.getParameter("action")).thenReturn("update");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("serviceName")).thenReturn("Updated Service");
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(session).setAttribute(eq("alertMessage"), contains("updated successfully"));
        verify(response).sendRedirect(anyString());
    }

    @Test
    public void testDeleteService() throws Exception {
        when(request.getParameter("action")).thenReturn("delete");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getSession()).thenReturn(session);

        servlet.doGet(request, response);

        verify(session).setAttribute(eq("alertMessage"), contains("deleted successfully"));
        verify(response).sendRedirect(anyString());
    }
}