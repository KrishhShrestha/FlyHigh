package com.FlyHigh.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.Map;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.ContactModel;
import com.FlyHigh.model.UserModel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class CartService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public CartService() {
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
	
	public boolean handleCheckout(int userId, Map<Integer,Integer> cart) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return false;
		}

		System.out.println("hit");
		
		return false;
	}
}