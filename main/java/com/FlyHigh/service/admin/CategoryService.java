package com.FlyHigh.service.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.CategoryModel;

public class CategoryService {

	private Connection dbConn;

	public CategoryService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	public Boolean addCategory(CategoryModel categoryModel) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		String insertQuery = "INSERT INTO category (Category_name, Description) VALUES (?, ?)";

		try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
			insertStmt.setString(1, categoryModel.getName());
			insertStmt.setString(2, categoryModel.getDescription());

			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during category insertion: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}
