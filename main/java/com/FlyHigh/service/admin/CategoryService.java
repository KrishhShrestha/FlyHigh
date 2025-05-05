package com.FlyHigh.service.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.CategoryModel;
import com.FlyHigh.model.DroneModel;

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
	
	public List<CategoryModel> getAllCategory() {
	    if (dbConn == null) {
	        System.err.println("Database connection Error while fetching categories.");
	        return null;
	    }

	    List<CategoryModel> categoryList = new ArrayList<>();
	    String categoryQuery = "SELECT `Category_id`, `Category_name`, `Description` FROM `category`";

	    try (PreparedStatement categoryStmt = dbConn.prepareStatement(categoryQuery)) {
	        ResultSet categoryResult = categoryStmt.executeQuery();

	        while (categoryResult.next()) {
	            CategoryModel categoryModel = new CategoryModel();
	            categoryModel.setId(categoryResult.getInt("Category_id"));
	            categoryModel.setName(categoryResult.getString("Category_name"));
	            categoryModel.setDescription(categoryResult.getString("Description"));
	            categoryList.add(categoryModel);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return categoryList;
	}
	
	public boolean deleteCategory(int categoryId) {
	    if (dbConn == null) {
	        System.err.println("Database connection Error!");
	        return false;
	    }


		String deleteQuery = "DELETE FROM `category` WHERE Category_id = ?";
		
		try (PreparedStatement stmt = dbConn.prepareStatement(deleteQuery)) {
			stmt.setInt(1, categoryId);

			int rowsDeleted = stmt.executeUpdate();
			return rowsDeleted > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
