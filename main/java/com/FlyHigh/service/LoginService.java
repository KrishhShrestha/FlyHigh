package com.FlyHigh.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.UserModel;
import com.FlyHigh.util.PasswordUtil;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class LoginService {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public LoginService() {
		try {
			dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Validates the user credentials against the database records.
	 *
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the user credentials are valid, false otherwise; null if a
	 *         connection error occurs
	 */
	public Boolean loginUser(UserModel UserModel) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		String query = "SELECT `User_email`, `User_password` FROM `user` WHERE `User_email` = ?";
		
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, UserModel.getEmail());
			
			
			ResultSet result = stmt.executeQuery();
			
			if (result.next()) {
				return validatePassword(result, UserModel);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return false;
	}

	/**
	 * Validates the password retrieved from the database.
	 *
	 * @param result       the ResultSet containing the username and password from
	 *                     the database
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the passwords match, false otherwise
	 * @throws SQLException if a database access error occurs
	 */
	private boolean validatePassword(ResultSet result, UserModel UserModel) throws SQLException {
	    String dbEmail = result.getString("User_email");
	    String dbPassword = result.getString("User_password");

	    String decryptedPassword = PasswordUtil.decrypt(dbPassword, dbEmail);

	    if (decryptedPassword == null) {
	        System.out.println("\nDecryption failed for email: " + dbEmail);
	        return false;
	    }

	    return dbEmail.equals(UserModel.getEmail()) && decryptedPassword.equals(UserModel.getPassword());
	}

}