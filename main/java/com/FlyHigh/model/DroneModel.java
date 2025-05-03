package com.FlyHigh.model;

public class DroneModel {
    private int id; // optional, for database identity
    private String name;
    private String description;
    private float price;
    private CategoryModel category;

    private float weight;
    private float flightTime;
    private float range;
    private String cameraQuality;
    private String dimension;

    private String imageUrl;

    // Constructors
    public DroneModel() {}

    public DroneModel(String name, String description, float price, CategoryModel category,
                   float weight, float flightTime, float range,
                   String cameraQuality, String dimension, String imageUrl) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.weight = weight;
        this.flightTime = flightTime;
        this.range = range;
        this.cameraQuality = cameraQuality;
        this.dimension = dimension;
        this.imageUrl = imageUrl;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }

    public CategoryModel getCategory() {
        return category;
    }
    
    public void setCategory(CategoryModel category) {
        this.category = category;
    }

    public float getWeight() {
        return weight;
    }
    public void setWeight(float weight) {
        this.weight = weight;
    }

    public float getFlightTime() {
        return flightTime;
    }
    public void setFlightTime(float flightTime) {
        this.flightTime = flightTime;
    }

    public float getRange() {
        return range;
    }
    public void setRange(float range) {
        this.range = range;
    }

    public String getCameraQuality() {
        return cameraQuality;
    }
    public void setCameraQuality(String cameraQuality) {
        this.cameraQuality = cameraQuality;
    }

    public String getDimension() {
        return dimension;
    }
    public void setDimension(String dimension) {
        this.dimension = dimension;
    }

    public String getImageUrl() {
        return imageUrl;
    }
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}