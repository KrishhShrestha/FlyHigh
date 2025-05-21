package com.FlyHigh.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.FlyHigh.model.CategoryModel;
import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.admin.CategoryService;
import com.FlyHigh.util.ValidationUtil;

/**
 * Servlet implementation class EditCategoryController
 */
@WebServlet("/editcategory")
public class EditCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategoryController() {
        super();
        
    this.categoryService = new CategoryService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve the "id" parameter from the request
		String idParam = request.getParameter("id");
		// Check if the id parameter is provided and not empt
        if (idParam != null && !idParam.isEmpty()) {
            try {
            	// parsing id parameter to an integer
                int categoryId = Integer.parseInt(idParam);
                
                CategoryModel category = categoryService.getCategoryById(categoryId);

                if (category != null) {
                	// If the category is found, set it as a request attribute
                    request.setAttribute("category", category);
                    request.getRequestDispatcher("WEB-INF/pages/admin/editcategory.jsp").forward(request, response);
                } else {
                	// If no category is found for the given ID, show an error message
                    request.setAttribute("errorMessage", "Drone not found for the provided ID.");
                    request.getRequestDispatcher("WEB-INF/pages/admin/category.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid Category ID format.");
                request.getRequestDispatcher("WEB-INF/pages/admin/category.jsp").forward(request, response);
            }
        } else {
        	
            request.setAttribute("errorMessage", "Category ID is required.");
            request.getRequestDispatcher("WEB-INF/pages/admin/NotFound.jsp").forward(request, response);// Forward to a not found error page
        }
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Validate input fields
	    String errorMessage = validateFields(request);

	    if (errorMessage != null) {
	        request.setAttribute("errorMessage", errorMessage);
	        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	        CategoryModel category = categoryService.getCategoryById(categoryId);
	        request.setAttribute("category", category);
	        request.getRequestDispatcher("WEB-INF/pages/admin/editcategory.jsp").forward(request, response);
	        return;
	    }
	    
	    // Get and parse categoryId
	    String categoryIdParam = request.getParameter("categoryId");
	    int categoryId;
	    try {
	        categoryId = Integer.parseInt(categoryIdParam);
	    } catch (NumberFormatException e) {
	        request.setAttribute("errorMessage", "Invalid category ID.");
	        request.getRequestDispatcher("WEB-INF/pages/admin/editcategory.jsp").forward(request, response);
	        return;
	    }
	    System.out.println(categoryIdParam + categoryId );
	    // Extract and sanitize inputs
	    String name = request.getParameter("category");
	    String description = request.getParameter("description");

	    // Create model with ID
	    CategoryModel categoryModel = new CategoryModel(categoryId, name, description);

	    // Update category
	    boolean success = categoryService.updateCategoryById(categoryModel);
	    if (success) {
	        response.sendRedirect(request.getContextPath() + "/category?success=Category updated successfully");
	    } else {
	        request.setAttribute("errorMessage", "Failed to update category. Please try again.");
	        request.setAttribute("category", categoryModel);
	        request.getRequestDispatcher("WEB-INF/pages/admin/editcategory.jsp").forward(request, response);
	    }
	}


	private String validateFields(HttpServletRequest request) {
	    String name = request.getParameter("category");  
	    String description = request.getParameter("description"); 

	    if (ValidationUtil.isNullOrEmpty(name))
	        return "Category name is required.";
	    if (ValidationUtil.isNullOrEmpty(description))
	        return "Category description is required.";

	    return null;
	}

}
