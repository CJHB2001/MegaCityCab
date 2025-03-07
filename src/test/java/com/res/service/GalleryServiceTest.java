package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.SQLException;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Gallery;

import service.GalleryService;

public class GalleryServiceTest {
    private GalleryService galleryService;
    private Gallery testGallery;

    @BeforeEach
    public void setUp() throws SQLException {
        galleryService = new GalleryService();
        testGallery = new Gallery("Service Test", "Service Description", "service.jpg");
        galleryService.addGallery(testGallery);
    }

    @AfterEach
    public void tearDown() throws SQLException {
        List<Gallery> galleries = galleryService.getAllGalleries();
        for (Gallery gallery : galleries) {
            galleryService.deleteGallery(gallery.getId());
        }
    }

    @Test
    public void testCreateGallery() throws SQLException {
        Gallery newGallery = new Gallery("New Test", "New Description", "new.jpg");
        galleryService.addGallery(newGallery);
        List<Gallery> galleries = galleryService.getAllGalleries();
        assertTrue(galleries.stream().anyMatch(g -> g.getTitle().equals("New Test")));
    }

    @Test
    public void testReadGallery() throws SQLException {
        List<Gallery> galleries = galleryService.getAllGalleries();
        assertFalse(galleries.isEmpty());
        assertEquals("Service Test", galleries.get(0).getTitle());
    }

    @Test
    public void testUpdateGallery() throws SQLException {
        Gallery existing = galleryService.getAllGalleries().get(0);
        assertNotNull(existing);
        
        existing.setDescription("Updated Service Description");
        galleryService.updateGallery(existing);
        Gallery updated = galleryService.getGalleryById(existing.getId());
        assertEquals("Updated Service Description", updated.getDescription());
    }

    @Test
    public void testDeleteGallery() throws SQLException {
        Gallery existing = galleryService.getAllGalleries().get(0);
        assertNotNull(existing);
        
        galleryService.deleteGallery(existing.getId());
        List<Gallery> galleries = galleryService.getAllGalleries();
        assertTrue(galleries.isEmpty());
    }
}
