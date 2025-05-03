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
		String insertQuery = "INSERT INTO `drone`(`Drone_name`, `Drone_description`, `Drone_price`, `Drone_weight`, `Flight_time`, `Drone_range`, `Camera_quality`, `Drone_dimension`, `Drone_image`, `Category_id`)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
 
		try (	PreparedStatement categoryStmt = dbConn.prepareStatement(categoryQuery);
				PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
			

			//	get categoryid
			categoryStmt.setString(1, String.valueOf(droneModel.getCategory().getId()));
			ResultSet result = categoryStmt.executeQuery();
			int categoryId = result.next() ? result.getInt("Category_id") : 1;
			
			insertStmt.setString(1, droneModel.getName());
			insertStmt.setString(2, droneModel.getDescription());
			insertStmt.setString(3, String.valueOf(droneModel.getPrice()));
			insertStmt.setString(4, String.valueOf(droneModel.getWeight()));
			insertStmt.setString(5, String.valueOf(droneModel.getFlightTime()));
			insertStmt.setString(6, String.valueOf(droneModel.getRange()));
			insertStmt.setString(7, droneModel.getCameraQuality());
			insertStmt.setString(8, droneModel.getDimension());
			insertStmt.setString(9, droneModel.getImageUrl());
			insertStmt.setString(10, String.valueOf(categoryId));
			
			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during student registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}