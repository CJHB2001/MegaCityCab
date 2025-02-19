package service;


import java.sql.SQLException;
import java.util.List;
import com.res.dao.BlogDAO;
import com.res.model.Blog;

public class BlogService {
    private BlogDAO blogDAO = new BlogDAO();

    public void addBlog(Blog blog) throws SQLException {
        blogDAO.addBlog(blog);
    }

    public List<Blog> getAllBlogs() throws SQLException {
        return blogDAO.getAllBlogs();
    }

    public void deleteBlog(int blogId) throws SQLException {
        blogDAO.deleteBlog(blogId);
    }

    public Blog getBlogById(int id) throws SQLException {
        return blogDAO.getBlogById(id);
    }

    public void updateBlog(Blog blog) throws SQLException {
        blogDAO.updateBlog(blog);
    }
}
