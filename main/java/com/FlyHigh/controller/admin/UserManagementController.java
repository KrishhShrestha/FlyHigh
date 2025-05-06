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
       
	private UserService userService;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementController() {
        super();
        this.userService = new UserService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String idParam = request.getParameter("id");
            if (idParam != null) {
                try {
                    int userId = Integer.parseInt(idParam);
                    boolean deleted = userService.deleteUserById(userId);
                    if (deleted) {
                        System.out.println("User deleted successfully.");
                    } else {
                        System.out.println("Failed to delete user.");
                    }
                } catch (NumberFormatException e) {
                    System.err.println("Invalid user ID: " + idParam);
                }
            }
            // Redirect to refresh the user list and avoid resubmission
            response.sendRedirect(request.getContextPath() + "/UserManagementController");
            return;
        }

        // Default action: load users
        List<UserModel> UserList = userService.getAllUser();
        
        if (UserList == null || UserList.isEmpty()) {
            request.setAttribute("errorMessage", "No users found or an error occurred.");
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
