package com.res.controller;

import static org.mockito.Mockito.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import service.GalleryService;

public class GalleryServletTest {
    private GalleryServlet galleryServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private GalleryService galleryService;

    @BeforeEach
    public void setUp() {
        galleryServlet = new GalleryServlet();
        galleryService = new GalleryService();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    public void testDeleteAction() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("delete");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getSession()).thenReturn(session);

        galleryServlet.doGet(request, response);
        
        verify(response).sendRedirect(anyString());
        verify(session).setAttribute(eq("alertMessage"), anyString());
    }

    @Test
    public void testAddGallery() throws ServletException, IOException {
        when(request.getParameter("title")).thenReturn("New Gallery");
        when(request.getParameter("description")).thenReturn("New Description");
        when(request.getSession()).thenReturn(session);

        galleryServlet.doPost(request, response);
        
        verify(response).sendRedirect(anyString());
        verify(session).setAttribute(eq("alertMessage"), anyString());
    }

    @Test
    public void testUpdateAction() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("update");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("title")).thenReturn("Updated Title");
        when(request.getParameter("description")).thenReturn("Updated Desc");
        when(request.getSession()).thenReturn(session);

        galleryServlet.doPost(request, response);
        
        verify(response).sendRedirect(anyString());
        verify(session).setAttribute(eq("alertMessage"), anyString());
    }
}