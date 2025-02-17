package com.res.model;


import java.util.Date;

public class Blog {
    private int id;
    private String title;
    private Date date;
    private String summary;
    private String imagePath;

    public Blog() {}

    public Blog(String title, Date date, String summary, String imagePath) {
        this.title = title;
        this.date = date;
        this.summary = summary;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}
