package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Blog;

import service.BlogService;

public class BlogServiceTest {
    private BlogService blogService;
    private Blog testBlog;

    @BeforeEach
    void setUp() throws SQLException {
        blogService = new BlogService();
        testBlog = new Blog("Service Test", new Date(), "Service Test Summary", "service_test.jpg");
        blogService.addBlog(testBlog);
    }

    @AfterEach
    void tearDown() throws SQLException {
        List<Blog> blogs = blogService.getAllBlogs();
        for (Blog blog : blogs) {
            blogService.deleteBlog(blog.getId());
        }
    }

    @Test
    void testCreateBlog() throws SQLException {
        Blog newBlog = new Blog("New Blog", new Date(), "New Content", "new.jpg");
        blogService.addBlog(newBlog);
        List<Blog> blogs = blogService.getAllBlogs();
        assertTrue(blogs.stream().anyMatch(b -> b.getTitle().equals("New Blog")));
    }

    @Test
    void testReadBlogs() throws SQLException {
        List<Blog> blogs = blogService.getAllBlogs();
        assertFalse(blogs.isEmpty());
    }

    @Test
    void testUpdateBlog() throws SQLException {
        Blog blog = blogService.getAllBlogs().get(0);
        blog.setTitle("Updated Blog");
        blogService.updateBlog(blog);
        
        Blog updatedBlog = blogService.getBlogById(blog.getId());
        assertEquals("Updated Blog", updatedBlog.getTitle());
    }

    @Test
    void testDeleteBlog() throws SQLException {
        Blog blog = blogService.getAllBlogs().get(0);
        blogService.deleteBlog(blog.getId());
        List<Blog> blogs = blogService.getAllBlogs();
        assertTrue(blogs.isEmpty());
    }
}