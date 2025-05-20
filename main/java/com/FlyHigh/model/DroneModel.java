package com.FlyHigh.model;

/**
 * Model class representing a drone in the FlyHigh system.
 */
public class DroneModel {
    private int id;
    private String name;
    private String description;
    private float price;
    private int quantity;
    private CategoryModel category;
    private float weight;
    private float flightTime;
    private float range;
    private String cameraQuality;
    private String dimension;
    private String imageUrl;

    // Default constructor
    public DroneModel() {}

    // Constructor with all fields including ID
    public DroneModel(int id, String name, String description, float price, CategoryModel category,
                      float weight, float flightTime, float range,
                      String cameraQuality, String dimension, String imageUrl, int quantity) {
        this.id = id;
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
        this.quantity = quantity;
    }

    // Constructor without ID 
    public DroneModel(String name, String description, float price, CategoryModel category,
                      float weight, float flightTime, float range,
                      String cameraQuality, String dimension, String imageUrl, int quantity) {
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
        this.quantity = quantity;
    }

    // Getters and setters for all fields
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

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
