package com.res.controller;

import static org.mockito.Mockito.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Blog;
import service.BlogService;

public class BlogServletTest {
    private BlogServlet blogServlet;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;
    private BlogService blogService;

    @BeforeEach
    public void setUp() {
        blogServlet = new BlogServlet();
        blogService = new BlogService();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        session = mock(HttpSession.class);
    }

    @Test
    public void testDeleteAction() throws ServletException, IOException {
        when(request.getParameter("action")).thenReturn("delete");
        when(request.getParameter("id")).thenReturn("1");
        when(request.getSession()).thenReturn(session);

        blogServlet.doGet(request, response);
        
        verify(response).sendRedirect(anyString());
    }

    @Test
    public void testAddBlog() throws ServletException, IOException {
        when(request.getParameter("title")).thenReturn("New Blog");
        when(request.getParameter("summary")).thenReturn("New Content");
        when(request.getSession()).thenReturn(session);

        blogServlet.doPost(request, response);
        
        verify(response).sendRedirect(anyString());
    }
}