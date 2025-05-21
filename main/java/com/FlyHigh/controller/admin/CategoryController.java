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
import com.FlyHigh.service.admin.DroneService;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/category" })
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryController() {
        super();
        // TODO Auto-generated constructor stub
        this.categoryService = new CategoryService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //get method
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<CategoryModel> categoryList = categoryService.getAllCategory(); //list created
		
		if (categoryList == null || categoryList.isEmpty()) {
		    request.setAttribute("errorMessage", "No category found or an error occurred.");
		}
		
		request.setAttribute("CategoryData", categoryList); //setting attributes

		
		request.getRequestDispatcher("WEB-INF/pages/admin/category.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//post method
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        switch (action) {
            case "delete":
                handleDelete(request, response, categoryId);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
        }
    }
// for deletion
    private void handleDelete(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException {
        boolean success = categoryService.deleteCategory(id);

        if (success) {
            System.out.println("Deletion successful");
            // Redirect after deletion
            response.sendRedirect(request.getContextPath() + "/category");
        } else {
            System.out.println("Deletion failed");
            // Handle deletion failure
            request.setAttribute("errorMessage", "Failed to delete drone.");
            request.getRequestDispatcher("WEB-INF/pages/admin/category.jsp").forward(request, response);
        }
    }

}
