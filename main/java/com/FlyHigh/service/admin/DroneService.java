package com.FlyHigh.service.admin;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.CategoryModel;
import com.FlyHigh.model.DroneModel;
import com.FlyHigh.model.UserModel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class DroneService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public DroneService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new student in the database.
	 *
	 * @param  the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */		
	public Boolean addDrone(DroneModel droneModel) {
	    if (dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return null;
	    }
	
	    String categoryQuery = "SELECT `Category_id` FROM `category` WHERE `Category_id`  = ?";
	    String insertQuery = "INSERT INTO `drone` (`Drone_name`, `Drone_description`, `Drone_price`, `Drone_quantity`, `Weight_grams`, `Flight_time_minutes`, `Range_meter`, `Camera_quality`, `Dimension`, `Drone_image`, `Category_id`) " +
	                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	    try (
	        PreparedStatement categoryStmt = dbConn.prepareStatement(categoryQuery);
	        PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)
	    ) {
	        // Validate or get category ID
	        categoryStmt.setInt(1, droneModel.getCategory().getId());
	        ResultSet result = categoryStmt.executeQuery();
	        int categoryId = result.next() ? result.getInt("Category_id") : 1;
	
	        // Set parameters for insert
	        insertStmt.setString(1, droneModel.getName());
	        insertStmt.setString(2, droneModel.getDescription());
	        insertStmt.setFloat(3, droneModel.getPrice());
	        insertStmt.setInt(4, droneModel.getQuantity());
	        insertStmt.setFloat(5, droneModel.getWeight());
	        insertStmt.setFloat(6, droneModel.getFlightTime());
	        insertStmt.setFloat(7, droneModel.getRange());
	        insertStmt.setString(8, droneModel.getCameraQuality());
	        insertStmt.setString(9, droneModel.getDimension());
	        insertStmt.setString(10, droneModel.getImageUrl());
	        insertStmt.setInt(11, categoryId);
	
	        return insertStmt.executeUpdate() > 0;
	    } catch (SQLException e) {
	        System.err.println("Error inserting drone: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	}
	
	
	public List<DroneModel> getAllDrones() {
	    if (dbConn == null) {
	        System.err.println("Database connection Error while fetching drones.");
	        return null;
	    }

	    String query = "SELECT `Drone_id`, `Drone_name`, `Drone_description`, `Drone_price`, `Drone_quantity`, `Weight_grams`, `Flight_time_minutes`, `Range_meter`, `Camera_quality`, `Dimension`, `Drone_image`, `Category_id` FROM `drone`";

	    List<DroneModel> droneList = new ArrayList<>();

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        ResultSet result = stmt.executeQuery();

	        while (result.next()) {
	            int categoryId = result.getInt("Category_id");

	            // Correct SQL for selecting a specific category by ID
	            String categoryQuery = "SELECT `Category_id`, `Category_name`, `Description` FROM `category` WHERE `Category_id` = ?";
	            CategoryModel categoryModel = new CategoryModel();

	            try (PreparedStatement categoryStmt = dbConn.prepareStatement(categoryQuery)) {
	                categoryStmt.setInt(1, categoryId);
	                ResultSet categoryResult = categoryStmt.executeQuery();

	                if (categoryResult.next()) {
	                    categoryModel.setId(categoryResult.getInt("Category_id"));
	                    categoryModel.setName(categoryResult.getString("Category_name"));
	                    categoryModel.setDescription(categoryResult.getString("Description"));
	                    
	                }
	            }

	            // Create and populate the DroneModel
	            DroneModel droneModel = new DroneModel();
	            
	            droneModel.setId(result.getInt("Drone_id"));
	            droneModel.setName(result.getString("Drone_name"));
	            droneModel.setDescription(result.getString("Drone_description"));
	            droneModel.setPrice(result.getFloat("Drone_price"));
	            droneModel.setQuantity(result.getInt("Drone_quantity"));
	            droneModel.setWeight(result.getFloat("Weight_grams"));
	            droneModel.setFlightTime(result.getFloat("Flight_time_minutes"));
	            droneModel.setRange(result.getFloat("Range_meter"));
	            droneModel.setCameraQuality(result.getString("Camera_quality"));
	            droneModel.setDimension(result.getString("Dimension"));
	            droneModel.setImageUrl(result.getString("Drone_image"));
	            droneModel.setCategory(categoryModel);

	            droneList.add(droneModel);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return droneList;
	}
	
	public Boolean editDrone(int editID, DroneModel droneModel) {
	    if (dbConn == null) {
	        System.err.println("Database connection is not available.");
	        return false;
	    }

	    String updateQuery = "UPDATE `drone` SET `Drone_name` = ?, `Drone_description` = ?, `Drone_price` = ?, " +
	            "`Drone_quantity` = ?, `Weight_grams` = ?, `Flight_time_minutes` = ?, `Range_meter` = ?, " +
	            "`Camera_quality` = ?, `Dimension` = ?, `Drone_image` = ?, `Category_id` = ? WHERE `Drone_id` = ?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(updateQuery)) {
	        stmt.setString(1, droneModel.getName());
	        stmt.setString(2, droneModel.getDescription());
	        stmt.setFloat(3, droneModel.getPrice());
	        stmt.setInt(4, droneModel.getQuantity());
	        stmt.setFloat(5, droneModel.getWeight());
	        stmt.setFloat(6, droneModel.getFlightTime());
	        stmt.setFloat(7, droneModel.getRange());
	        stmt.setString(8, droneModel.getCameraQuality());
	        stmt.setString(9, droneModel.getDimension());
	        stmt.setString(10, droneModel.getImageUrl()); 
	        stmt.setInt(11, droneModel.getCategory().getId());
	        
	        stmt.setInt(12, editID);

	        return stmt.executeUpdate() > 0;
	    } catch (SQLException e) {
	        System.err.println("Error updating drone: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}

	
	public DroneModel getDroneById(int droneId) {
	    if (dbConn == null) {
	        System.err.println("Database connection Error while fetching the drone.");
	        return null;
	    }

	    String query = "SELECT `Drone_id`, `Drone_name`, `Drone_description`, `Drone_price`, `Drone_quantity`, `Weight_grams`, `Flight_time_minutes`, `Range_meter`, `Camera_quality`, `Dimension`, `Drone_image`, `Category_id` FROM `drone` WHERE `Drone_id` = ?";

	    DroneModel droneModel = null;

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setInt(1, droneId); // Set the droneId in the query
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            int categoryId = result.getInt("Category_id");

	            // Fetch the category information
	            String categoryQuery = "SELECT `Category_id`, `Category_name`, `Description` FROM `category` WHERE `Category_id` = ?";
	            CategoryModel categoryModel = new CategoryModel();

	            try (PreparedStatement categoryStmt = dbConn.prepareStatement(categoryQuery)) {
	                categoryStmt.setInt(1, categoryId);
	                ResultSet categoryResult = categoryStmt.executeQuery();

	                if (categoryResult.next()) {
	                    categoryModel.setId(categoryResult.getInt("Category_id"));
	                    categoryModel.setName(categoryResult.getString("Category_name"));
	                    categoryModel.setDescription(categoryResult.getString("Description"));
	                }
	            }

	            // Create and populate the DroneModel
	            droneModel = new DroneModel();
	            droneModel.setId(result.getInt("Drone_id"));
	            droneModel.setName(result.getString("Drone_name"));
	            droneModel.setDescription(result.getString("Drone_description"));
	            droneModel.setPrice(result.getFloat("Drone_price"));
	            droneModel.setQuantity(result.getInt("Drone_quantity"));
	            droneModel.setWeight(result.getFloat("Weight_grams"));
	            droneModel.setFlightTime(result.getFloat("Flight_time_minutes"));
	            droneModel.setRange(result.getFloat("Range_meter"));
	            droneModel.setCameraQuality(result.getString("Camera_quality"));
	            droneModel.setDimension(result.getString("Dimension"));
	            droneModel.setImageUrl(result.getString("Drone_image"));
	            droneModel.setCategory(categoryModel);
	        }
	    } catch (SQLException e) {
	        System.err.println("Error fetching drone by ID: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }

	    return droneModel;
	}

	public boolean deleteDrone(int droneId) {
	    if (dbConn == null) {
	        System.err.println("Database connection Error!");
	        return false;
	    }


		String deleteQuery = "DELETE FROM `drone` WHERE Drone_id = ?";
		
		try (PreparedStatement stmt = dbConn.prepareStatement(deleteQuery)) {
			stmt.setInt(1, droneId);

			int rowsDeleted = stmt.executeUpdate();
			return rowsDeleted > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}