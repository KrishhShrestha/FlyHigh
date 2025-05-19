package com.FlyHigh.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.ContactModel;
import com.FlyHigh.model.UserModel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class ContactService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public ContactService() {
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
	 * @param studentModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	
	public Boolean addMessage(ContactModel contactModel) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

//		String programQuery = "SELECT program_id FROM program WHERE name = ?";
		String insertQuery = "INSERT INTO `contact`(`fname`, `lname`, `email`, `message`)" + "VALUES (?,?,?,?)";

		try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {

			// Insert student details
//			insertStmt.setString(1, UserModel.getFirstname());  
			insertStmt.setString(1, contactModel.getFirstname());           
			insertStmt.setString(2, contactModel.getLastname());               
			insertStmt.setString(3, contactModel.getEmail());  
			insertStmt.setString(4, contactModel.getMessage());
			
			
			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during student registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}