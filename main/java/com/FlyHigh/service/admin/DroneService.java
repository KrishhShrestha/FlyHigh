package com.FlyHigh.service.admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FlyHigh.config.DbConfig;
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

}