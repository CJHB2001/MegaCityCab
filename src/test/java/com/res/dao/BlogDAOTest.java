package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Blog;

public class BlogDAOTest {
    private BlogDAO blogDAO;
    private Blog testBlog;

    @BeforeEach
    void setUp() throws SQLException {
        blogDAO = new BlogDAO();
        testBlog = new Blog("DAO Test", new Date(), "DAO Test Summary", "dao_test.jpg");
        blogDAO.addBlog(testBlog);
    }

    @AfterEach
    void tearDown() throws SQLException {
        List<Blog> blogs = blogDAO.getAllBlogs();
        for (Blog blog : blogs) {
            blogDAO.deleteBlog(blog.getId());
        }
    }

    @Test
    void testCreateBlog() throws SQLException {
        Blog newBlog = new Blog("New Blog", new Date(), "New Blog Summary", "new_blog.jpg");
        blogDAO.addBlog(newBlog);
        List<Blog> blogs = blogDAO.getAllBlogs();
        assertTrue(blogs.stream().anyMatch(b -> b.getTitle().equals("New Blog")));
    }

    @Test
    void testReadBlogs() throws SQLException {
        List<Blog> blogs = blogDAO.getAllBlogs();
        assertFalse(blogs.isEmpty());
    }

    @Test
    void testUpdateBlog() throws SQLException {
        Blog blog = blogDAO.getAllBlogs().get(0);
        blog.setTitle("Updated Title");
        blogDAO.updateBlog(blog);
        
        Blog updatedBlog = blogDAO.getBlogById(blog.getId());
        assertEquals("Updated Title", updatedBlog.getTitle());
    }

    @Test
    void testDeleteBlog() throws SQLException {
        Blog blog = blogDAO.getAllBlogs().get(0);
        blogDAO.deleteBlog(blog.getId());
        List<Blog> blogs = blogDAO.getAllBlogs();
        assertTrue(blogs.isEmpty());
    }
}
