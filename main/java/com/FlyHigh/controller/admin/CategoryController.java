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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<CategoryModel> categoryList = categoryService.getAllCategory();
		
		if (categoryList == null || categoryList.isEmpty()) {
		    request.setAttribute("errorMessage", "No category found or an error occurred.");
		}
		
		request.setAttribute("CategoryData", categoryList);

		
		request.getRequestDispatcher("WEB-INF/pages/admin/category.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
