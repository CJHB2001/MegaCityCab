package service;


import java.sql.SQLException;
import java.util.List;
import com.res.dao.GalleryDAO;
import com.res.model.Gallery;

public class GalleryService {
    private GalleryDAO galleryDAO = new GalleryDAO();

    public void addGallery(Gallery gallery) throws SQLException {
        galleryDAO.addGallery(gallery);
    }

    public List<Gallery> getAllGalleries() throws SQLException {
        return galleryDAO.getAllGalleries();
    }

    public void deleteGallery(int galleryId) throws SQLException {
        galleryDAO.deleteGallery(galleryId);
    }

    public Gallery getGalleryById(int id) throws SQLException {
        return galleryDAO.getGalleryById(id);
    }

    public void updateGallery(Gallery gallery) throws SQLException {
        galleryDAO.updateGallery(gallery);
    }
}
