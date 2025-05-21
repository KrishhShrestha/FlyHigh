package com.FlyHigh.service;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {

	/**
	 * Finds a user by their email (User_email column).
	 */
	public UserModel findByEmail(String email) {
		String sql = "SELECT User_id, User_name, User_phone, Gender, User_DOB, "
				+ "User_email, User_address, Role_Name, User_image " + "FROM user WHERE User_email = ?";

		try (Connection conn = DbConfig.getDbConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					UserModel u = new UserModel();
					u.setId(rs.getInt("User_id"));
					u.setFirstname(rs.getString("User_name"));
					u.setPhone(rs.getString("User_phone"));
					u.setGender(rs.getString("Gender"));
					u.setDob(rs.getDate("User_DOB").toString());
					u.setEmail(rs.getString("User_email"));
					u.setAddress(rs.getString("User_address"));
					u.setRole(rs.getString("Role_Name"));
					u.setImageUrl(rs.getString("User_image"));
					return u;
				}
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace(); // replace with proper logging
		}
		return null;
	}

	public boolean updateUser(UserModel user) {
		String sql = "UPDATE user SET User_name = ?, User_phone = ?, Gender = ?, User_DOB = ?, "
				+ "User_email = ?, User_address = ?, User_image = ?" // add password if needed
				+ " WHERE User_id = ?";

		try (Connection conn = DbConfig.getDbConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, user.getFirstname());
			ps.setString(2, user.getPhone());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getDob());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getImageUrl());
			ps.setInt(8, user.getId());

			int affected = ps.executeUpdate();
			return affected == 1;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}

}