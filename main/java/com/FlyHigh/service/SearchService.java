package com.FlyHigh.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.CategoryModel;
import com.FlyHigh.model.DroneModel;

public class SearchService {

    private Connection dbConn;

    public SearchService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("DB Connection Error: " + e.getMessage());
        }
    }

    public List<DroneModel> searchDrones(String keyword, Float minPrice, Float maxPrice) {
        List<DroneModel> drones = new ArrayList<>();

        if (dbConn == null) {
            System.err.println("DB connection not available.");
            return drones;
        }

        StringBuilder query = new StringBuilder("SELECT * FROM drone WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            query.append(" AND Drone_name LIKE ?");
            params.add("%" + keyword + "%");
        }
        if (minPrice != null) {
            query.append(" AND Drone_price >= ?");
            params.add(minPrice);
        }
        if (maxPrice != null) {
            query.append(" AND Drone_price <= ?");
            params.add(maxPrice);
        }

        try (PreparedStatement stmt = dbConn.prepareStatement(query.toString())) {
            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }

            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                int categoryId = result.getInt("Category_id");
                CategoryModel categoryModel = getCategoryById(categoryId);

                DroneModel drone = new DroneModel();
                drone.setId(result.getInt("Drone_id"));
                drone.setName(result.getString("Drone_name"));
                drone.setDescription(result.getString("Drone_description"));
                drone.setPrice(result.getFloat("Drone_price"));
                drone.setQuantity(result.getInt("Drone_quantity"));
                drone.setWeight(result.getFloat("Weight_grams"));
                drone.setFlightTime(result.getFloat("Flight_time_minutes"));
                drone.setRange(result.getFloat("Range_meter"));
                drone.setCameraQuality(result.getString("Camera_quality"));
                drone.setDimension(result.getString("Dimension"));
                drone.setImageUrl(result.getString("Drone_image"));
                drone.setCategory(categoryModel);

                drones.add(drone);
            }

        } catch (SQLException e) {
            System.err.println("Search error: " + e.getMessage());
            e.printStackTrace();
        }

        return drones;
    }



    private CategoryModel getCategoryById(int id) {
        String query = "SELECT * FROM category WHERE Category_id = ?";
        CategoryModel category = new CategoryModel();

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                category.setId(rs.getInt("Category_id"));
                category.setName(rs.getString("Category_name"));
                category.setDescription(rs.getString("Description"));
            }

        } catch (SQLException e) {
            System.err.println("Error fetching category: " + e.getMessage());
        }

        return category;
    }
}
