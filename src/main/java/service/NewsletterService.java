package service;

import java.sql.SQLException;
import java.util.List;
import com.res.dao.NewsletterDAO;
import com.res.model.Newsletter;

public class NewsletterService {
    private NewsletterDAO newsletterDAO = new NewsletterDAO();

    public void addNewsletter(Newsletter newsletter) throws SQLException {
        newsletterDAO.addNewsletter(newsletter);
    }

    public List<Newsletter> getAllNewsletters() throws SQLException {
        return newsletterDAO.getAllNewsletters();
    }

    public void deleteNewsletter(int newsletterId) throws SQLException {
        newsletterDAO.deleteNewsletter(newsletterId);
    }
}