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
public class UserService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public UserService() {
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
	
	
	
	public List<UserModel> getAllUser() {
	    if (dbConn == null) {
	        System.err.println("Database connection Error while fetching drones.");
	        return null;
	    }

	    String query = "SELECT User_id, User_name, User_phone, Gender, User_DOB, User_email, User_password, User_address, Role_Name, User_image FROM user";

	    List<UserModel> UserList = new ArrayList<>();

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        ResultSet result = stmt.executeQuery();

	        while (result.next()) {
	          

	            // Create and populate the DroneModel
	            UserModel UserModel = new UserModel();
	            UserModel.setId(result.getInt("User_id"));
	            UserModel.setFirstname(result.getString("User_name"));
	            UserModel.setPhone(result.getString("User_phone"));
	            UserModel.setGender(result.getString("Gender"));
	            UserModel.setDob(result.getString("User_DOB"));
	            UserModel.setEmail(result.getString("User_email"));
	            UserModel.setPassword(result.getString("User_password"));
	            UserModel.setAddress(result.getString("User_address"));
	            UserModel.setRole(result.getString("Role_Name"));
	            UserModel.setImageUrl(result.getString("User_image"));
	            

	            UserList.add(UserModel);
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return UserList;
	}
	
	
    public boolean deleteUserById(int id) {
        if (dbConn == null) {
            System.err.println("Database connection error while deleting user.");
            return false;
        }

        String query = "DELETE FROM user WHERE User_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public boolean updateUserRole(int userId, String newRole) {
        if (dbConn == null) {
            System.err.println("Database connection error while updating user role.");
            return false;
        }

        String query = "UPDATE user SET Role_Name = ? WHERE User_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, newRole);
            stmt.setInt(2, userId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	

}