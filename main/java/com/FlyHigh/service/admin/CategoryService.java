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
			this.dbConn = DbConfig.getDbConnection(); //checks for database connection
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
// method to add category
	public Boolean addCategory(CategoryModel categoryModel) {
		if (dbConn == null) {//checks for database connection
			System.err.println("Database connection is not available.");
			return null;
		}

		String insertQuery = "INSERT INTO category (Category_name, Description) VALUES (?, ?)"; //insert into database

		try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
			insertStmt.setString(1, categoryModel.getName());
			insertStmt.setString(2, categoryModel.getDescription());

			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {//exception handling
			System.err.println("Error during category insertion: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	// method to get category values
	public List<CategoryModel> getAllCategory() {
	    if (dbConn == null) {//checks for database connection
	        System.err.println("Database connection Error while fetching categories.");
	        return null;
	    }

	    List<CategoryModel> categoryList = new ArrayList<>();
	    String categoryQuery = "SELECT `Category_id`, `Category_name`, `Description` FROM `category`";//selects  from the  database

	    try (PreparedStatement categoryStmt = dbConn.prepareStatement(categoryQuery)) {
	        ResultSet categoryResult = categoryStmt.executeQuery();

	        while (categoryResult.next()) {
	            CategoryModel categoryModel = new CategoryModel();
	            categoryModel.setId(categoryResult.getInt("Category_id"));
	            categoryModel.setName(categoryResult.getString("Category_name"));
	            categoryModel.setDescription(categoryResult.getString("Description"));
	            categoryList.add(categoryModel);
	        }

	    } catch (SQLException e) {//exception handling
	        e.printStackTrace();
	        return null;
	    }

	    return categoryList;
	}
	// method to delete category
	public boolean deleteCategory(int categoryId) {
	    if (dbConn == null) {//checks for database connection
	        System.err.println("Database connection Error!");
	        return false;
	    }


		String deleteQuery = "DELETE FROM `category` WHERE Category_id = ?"; //deletes from the database
		
		try (PreparedStatement stmt = dbConn.prepareStatement(deleteQuery)) {
			stmt.setInt(1, categoryId);

			int rowsDeleted = stmt.executeUpdate();
			return rowsDeleted > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	// method to update category
	public boolean updateCategoryById(CategoryModel categoryModel) {
	    if (dbConn == null) {//checks for database connection
	        System.err.println("Database connection is not available.");
	        return false;
	    }
	    System.out.println(categoryModel.getName()+categoryModel.getDescription()+categoryModel.getId());
	    String updateQuery = "UPDATE category SET Category_name = ?, Description = ? WHERE Category_id = ?"; //updates to the database

	    try (PreparedStatement updateStmt = dbConn.prepareStatement(updateQuery)) {
	        updateStmt.setString(1, categoryModel.getName());
	        updateStmt.setString(2, categoryModel.getDescription());
	        updateStmt.setInt(3, categoryModel.getId());

	        int rowsUpdated = updateStmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException e) {//exception handling
	        System.err.println("Error during category update: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}
	// method to get category by id
	public CategoryModel getCategoryById(int categoryId) {
	    if (dbConn == null) {//checks for database connection
	        System.err.println("Database connection is not available.");
	        return null;
	    }

	    String query = "SELECT Category_id, Category_name, Description FROM category WHERE Category_id = ?"; //selects id from the database

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setInt(1, categoryId);
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            CategoryModel categoryModel = new CategoryModel();
	            categoryModel.setId(result.getInt("Category_id"));
	            categoryModel.setName(result.getString("Category_name"));
	            categoryModel.setDescription(result.getString("Description"));
	            return categoryModel;
	        } else {
	            return null; // No category found with the given ID
	        }

	    } catch (SQLException e) { //exception handling
	        System.err.println("Error fetching category by ID: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	}

	
}
