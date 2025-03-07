package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class GalleryTest {
    private Gallery gallery;

    @BeforeEach
    public void setUp() {
        gallery = new Gallery("Nature", "Beautiful nature scene", "nature.jpg");
    }

    @Test
    public void testGettersAndSetters() {
        gallery.setId(1);
        assertEquals(1, gallery.getId());
        assertEquals("Nature", gallery.getTitle());
        assertEquals("Beautiful nature scene", gallery.getDescription());
        assertEquals("nature.jpg", gallery.getImagePath());

        gallery.setTitle("Updated Title");
        gallery.setDescription("New description");
        gallery.setImagePath("updated.jpg");
        
        assertEquals("Updated Title", gallery.getTitle());
        assertEquals("New description", gallery.getDescription());
        assertEquals("updated.jpg", gallery.getImagePath());
    }
}