package com.FlyHigh.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.FlyHigh.model.CategoryModel;
import com.FlyHigh.service.admin.CategoryService;
import com.FlyHigh.util.ValidationUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/addcategory", "/add-category" })

public class AddCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCategoryController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/pages/admin/addcategory.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errorMessage = validateFields(request);

		if (errorMessage != null) {
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("WEB-INF/pages/admin/category.jsp").forward(request, response);

			return;
		}

		
		String name = request.getParameter("categoryname");
		String description = request.getParameter("categorydescription");

		CategoryModel categoryModel = new CategoryModel(
				name, 
				description);
		
		
		CategoryService categoryService = new CategoryService();

		Boolean success = categoryService.addCategory(categoryModel);
		if (success != null && success) {
			response.sendRedirect(request.getContextPath() + "/category");

		} else {
			request.setAttribute("errorMessage", "Failed to add category. Please try again.");
			request.getRequestDispatcher("WEB-INF/pages/admin/addcategory.jsp").forward(request, response);
		}
	}

	private String validateFields(HttpServletRequest request) {
		String name = request.getParameter("categoryname");
		String description = request.getParameter("categorydescription");

		if (ValidationUtil.isNullOrEmpty(name))
			return "Category name is required.";
		if (ValidationUtil.isNullOrEmpty(description))
			return "Category description is required.";

		return null;
	}
}
