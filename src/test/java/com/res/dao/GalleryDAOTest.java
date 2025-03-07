package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.SQLException;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Gallery;

public class GalleryDAOTest {
    private GalleryDAO galleryDAO;
    private Gallery testGallery;

    @BeforeEach
    public void setUp() throws SQLException {
        galleryDAO = new GalleryDAO();
        testGallery = new Gallery("Test Image", "Test Description", "test.jpg");
        galleryDAO.addGallery(testGallery);
    }

    @AfterEach
    public void tearDown() throws SQLException {
        List<Gallery> galleries = galleryDAO.getAllGalleries();
        for (Gallery gallery : galleries) {
            galleryDAO.deleteGallery(gallery.getId());
        }
    }

    @Test
    public void testAddGallery() throws SQLException {
        List<Gallery> galleries = galleryDAO.getAllGalleries();
        assertFalse(galleries.isEmpty());
        assertEquals("Test Image", galleries.get(0).getTitle());
    }

    @Test
    public void testUpdateGallery() throws SQLException {
        Gallery toUpdate = galleryDAO.getAllGalleries().get(0);
        toUpdate.setTitle("Updated Title");
        galleryDAO.updateGallery(toUpdate);
        
        Gallery updated = galleryDAO.getGalleryById(toUpdate.getId());
        assertEquals("Updated Title", updated.getTitle());
    }

    @Test
    public void testDeleteGallery() throws SQLException {
        Gallery toDelete = galleryDAO.getAllGalleries().get(0);
        galleryDAO.deleteGallery(toDelete.getId());
        
        List<Gallery> galleries = galleryDAO.getAllGalleries();
        assertTrue(galleries.isEmpty());
    }

    @Test
    public void testGetGalleryById() throws SQLException {
        Gallery existing = galleryDAO.getAllGalleries().get(0);
        Gallery found = galleryDAO.getGalleryById(existing.getId());
        assertNotNull(found);
        assertEquals(existing.getTitle(), found.getTitle());
    }
}