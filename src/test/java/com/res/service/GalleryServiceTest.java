package com.res.service;

import com.res.model.Gallery;

import service.GalleryService;

import com.res.dao.GalleryDAO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.sql.SQLException;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class GalleryServiceTest {

    private GalleryService galleryService;

    @BeforeEach
    void setUp() {
        galleryService = new GalleryService();
    }

    @Test
    void testAddGallery() throws SQLException {
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryService.addGallery(gallery);

        // Verify that the gallery was added
        List<Gallery> galleryList = galleryService.getAllGalleries();
        assertFalse(galleryList.isEmpty());
        assertEquals("Test Title", galleryList.get(galleryList.size() - 1).getTitle());
    }

    @Test
    void testGetAllGalleries() throws SQLException {
        List<Gallery> galleryList = galleryService.getAllGalleries();
        assertNotNull(galleryList);
    }

    @Test
    void testGetGalleryById() throws SQLException {
        // Add a gallery first
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryService.addGallery(gallery);

        // Retrieve the gallery by ID
        List<Gallery> galleryList = galleryService.getAllGalleries();
        int galleryId = galleryList.get(galleryList.size() - 1).getId();
        Gallery retrievedGallery = galleryService.getGalleryById(galleryId);

        assertNotNull(retrievedGallery);
        assertEquals("Test Title", retrievedGallery.getTitle());
    }

    @Test
    void testUpdateGallery() throws SQLException {
        // Add a gallery first
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryService.addGallery(gallery);

        // Retrieve the gallery by ID
        List<Gallery> galleryList = galleryService.getAllGalleries();
        int galleryId = galleryList.get(galleryList.size() - 1).getId();
        Gallery galleryToUpdate = galleryService.getGalleryById(galleryId);

        // Update the gallery
        galleryToUpdate.setTitle("Updated Title");
        galleryToUpdate.setDescription("Updated Description");
        galleryToUpdate.setImagePath("updated_image.jpg");
        galleryService.updateGallery(galleryToUpdate);

        // Verify the update
        Gallery updatedGallery = galleryService.getGalleryById(galleryId);
        assertEquals("Updated Title", updatedGallery.getTitle());
        assertEquals("Updated Description", updatedGallery.getDescription());
        assertEquals("updated_image.jpg", updatedGallery.getImagePath());
    }

    @Test
    void testDeleteGallery() throws SQLException {
        // Add a gallery first
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryService.addGallery(gallery);

        // Retrieve the gallery by ID
        List<Gallery> galleryListBeforeDelete = galleryService.getAllGalleries();
        int galleryId = galleryListBeforeDelete.get(galleryListBeforeDelete.size() - 1).getId();

        // Delete the gallery
        galleryService.deleteGallery(galleryId);

        // Verify the deletion
        List<Gallery> galleryListAfterDelete = galleryService.getAllGalleries();
        assertNotEquals(galleryListBeforeDelete.size(), galleryListAfterDelete.size());
    }
}