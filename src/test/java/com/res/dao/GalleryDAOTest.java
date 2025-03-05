package com.res.dao;

import com.res.model.Gallery;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.sql.SQLException;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class GalleryDAOTest {

    private GalleryDAO galleryDAO;

    @BeforeEach
    void setUp() {
        galleryDAO = new GalleryDAO();
    }

    @Test
    void testAddGallery() throws SQLException {
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryDAO.addGallery(gallery);

        List<Gallery> galleryList = galleryDAO.getAllGalleries();
        assertFalse(galleryList.isEmpty());
        assertEquals("Test Title", galleryList.get(galleryList.size() - 1).getTitle());
    }

    @Test
    void testGetAllGalleries() throws SQLException {
        List<Gallery> galleryList = galleryDAO.getAllGalleries();
        assertNotNull(galleryList);
    }

    @Test
    void testDeleteGallery() throws SQLException {
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryDAO.addGallery(gallery);

        List<Gallery> galleryListBeforeDelete = galleryDAO.getAllGalleries();
        int galleryId = galleryListBeforeDelete.get(galleryListBeforeDelete.size() - 1).getId();

        galleryDAO.deleteGallery(galleryId);

        List<Gallery> galleryListAfterDelete = galleryDAO.getAllGalleries();
        assertNotEquals(galleryListBeforeDelete.size(), galleryListAfterDelete.size());
    }

    @Test
    void testGetGalleryById() throws SQLException {
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryDAO.addGallery(gallery);

        List<Gallery> galleryList = galleryDAO.getAllGalleries();
        int galleryId = galleryList.get(galleryList.size() - 1).getId();

        Gallery retrievedGallery = galleryDAO.getGalleryById(galleryId);
        assertNotNull(retrievedGallery);
        assertEquals("Test Title", retrievedGallery.getTitle());
    }

    @Test
    void testUpdateGallery() throws SQLException {
        Gallery gallery = new Gallery("Test Title", "Test Description", "test_image.jpg");
        galleryDAO.addGallery(gallery);

        List<Gallery> galleryList = galleryDAO.getAllGalleries();
        int galleryId = galleryList.get(galleryList.size() - 1).getId();

        Gallery galleryToUpdate = galleryDAO.getGalleryById(galleryId);
        galleryToUpdate.setTitle("Updated Title");
        galleryToUpdate.setDescription("Updated Description");
        galleryToUpdate.setImagePath("updated_image.jpg");

        galleryDAO.updateGallery(galleryToUpdate);

        Gallery updatedGallery = galleryDAO.getGalleryById(galleryId);
        assertEquals("Updated Title", updatedGallery.getTitle());
        assertEquals("Updated Description", updatedGallery.getDescription());
        assertEquals("updated_image.jpg", updatedGallery.getImagePath());
    }
}