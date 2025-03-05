package com.res.controller;

import com.res.model.Gallery;
import service.GalleryService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import static org.mockito.Mockito.*;

class GalleryServletTest {

    private GalleryServlet galleryServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private GalleryService galleryService;

    @BeforeEach
    void setUp() throws ServletException {
        galleryServlet = new GalleryServlet();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
        galleryService = mock(GalleryService.class);

        // Inject the mocked service into the servlet
        galleryServlet.init();
    }

    @Test
    void testDoGetListGalleries() throws ServletException, IOException, SQLException {
        // Mock the request parameters
        when(request.getParameter("action")).thenReturn(null);

        // Mock the service response
        List<Gallery> galleryList = Collections.singletonList(new Gallery("Test Title", "Test Description", "test_image.jpg"));
        when(galleryService.getAllGalleries()).thenReturn(galleryList);

        // Mock the request dispatcher
        RequestDispatcher requestDispatcher = mock(RequestDispatcher.class);
        when(request.getRequestDispatcher("/AdminArea/gallery.jsp")).thenReturn(requestDispatcher);

        // Call the servlet's doGet method
        galleryServlet.doGet(request, response);

        // Verify the behavior
        verify(request).setAttribute("galleryList", galleryList);
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    void testDoPostAddGallery() throws ServletException, IOException, SQLException {
        // Mock the request parameters
        when(request.getParameter("action")).thenReturn("add");
        when(request.getParameter("title")).thenReturn("Test Title");
        when(request.getParameter("description")).thenReturn("Test Description");

        // Mock the file upload
        Part filePart = mock(Part.class);
        when(request.getPart("image")).thenReturn(filePart);
        when(filePart.getSubmittedFileName()).thenReturn("test_image.jpg");
        when(filePart.getInputStream()).thenReturn(mock(InputStream.class));

        // Call the servlet's doPost method
        galleryServlet.doPost(request, response);

        // Verify the behavior
        verify(galleryService).addGallery(any(Gallery.class));
        verify(response).sendRedirect(anyString());
    }
}