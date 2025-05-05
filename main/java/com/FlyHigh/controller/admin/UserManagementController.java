package com.FlyHigh.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.FlyHigh.model.UserModel;
import com.FlyHigh.service.admin.DroneService;
import com.FlyHigh.service.admin.UserService;

/**
 * Servlet implementation class UserManagementController
 */
@WebServlet("/UserManagementController")
public class UserManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService UserService;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementController() {
        super();
        this.UserService = new UserService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<UserModel> UserList = UserService.getAllUser();
		
		if (UserList == null || UserList.isEmpty()) {
		    request.setAttribute("errorMessage", "No drones found or an error occurred.");
		}
		
		request.setAttribute("UserData", UserList);

		
		request.getRequestDispatcher("WEB-INF/pages/admin/user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
