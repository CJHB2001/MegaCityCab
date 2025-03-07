package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import java.util.Date;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BlogTest {
    private Blog blog;
    private Date testDate;

    @BeforeEach
    void setUp() {
        testDate = new Date();
        blog = new Blog("Test Title", testDate, "Test Summary", "/test/path.jpg");
    }

    @Test
    void testGettersAndSetters() {
        blog.setId(1);
        assertEquals(1, blog.getId());
        assertEquals("Test Title", blog.getTitle());
        assertEquals(testDate, blog.getDate());
        assertEquals("Test Summary", blog.getSummary());
        assertEquals("/test/path.jpg", blog.getImagePath());
    }

    @Test
    void testUpdateProperties() {
        Date newDate = new Date();
        blog.setTitle("Updated Title");
        blog.setDate(newDate);
        blog.setSummary("Updated Summary");
        blog.setImagePath("/updated/path.jpg");
        
        assertEquals("Updated Title", blog.getTitle());
        assertEquals(newDate, blog.getDate());
        assertEquals("Updated Summary", blog.getSummary());
        assertEquals("/updated/path.jpg", blog.getImagePath());
    }
}