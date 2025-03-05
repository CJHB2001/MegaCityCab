package com.res.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class GalleryTest {

    @Test
    void testGalleryModel() {
        // Create a Gallery object
        Gallery gallery = new Gallery();
        gallery.setId(1);
        gallery.setTitle("Test Title");
        gallery.setDescription("Test Description");
        gallery.setImagePath("test_image.jpg");

        // Test getters
        assertEquals(1, gallery.getId());
        assertEquals("Test Title", gallery.getTitle());
        assertEquals("Test Description", gallery.getDescription());
        assertEquals("test_image.jpg", gallery.getImagePath());

        // Test parameterized constructor
        Gallery gallery2 = new Gallery("Test Title 2", "Test Description 2", "test_image2.jpg");
        assertEquals("Test Title 2", gallery2.getTitle());
        assertEquals("Test Description 2", gallery2.getDescription());
        assertEquals("test_image2.jpg", gallery2.getImagePath());
    }
}