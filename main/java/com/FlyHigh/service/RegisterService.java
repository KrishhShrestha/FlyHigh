package com.FlyHigh.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.UserModel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class RegisterService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegisterService() {
		try {
			this.dbConn = DbConfig.getDbConnection(); //check for database connection
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new student in the database.
	 *
	 * @param studentModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	
	public Boolean addUser(UserModel UserModel) {
		if (dbConn == null) {//check for database connection
			System.err.println("Database connection is not available.");
			return null;
		}

// inserts into the database
		String insertQuery = "INSERT INTO user(User_name, User_phone, Gender, User_DOB, User_email, User_address, User_password, Role_Name, User_image) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
 

		try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {

			// Insert student details
			insertStmt.setString(1, UserModel.getFirstname());           // User_name
			insertStmt.setString(2, UserModel.getPhone());               // User_phone
			insertStmt.setString(3, UserModel.getGender());              // Gender
			insertStmt.setDate(4, Date.valueOf(UserModel.getDob()));     // User_DOB
			insertStmt.setString(5, UserModel.getEmail());               // User_email
			insertStmt.setString(6, UserModel.getAddress());             // User_address
			insertStmt.setString(7, UserModel.getPassword());            // User_password
			insertStmt.setString(8, "customer");                         // Role_Name — default role
			insertStmt.setString(9, UserModel.getImageUrl());            // User_image
			
			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during student registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}