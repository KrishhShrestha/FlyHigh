package com.FlyHigh.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FlyHigh.model.UserModel;
import com.FlyHigh.service.LoginService;
import com.FlyHigh.util.CookieUtil;
import com.FlyHigh.util.SessionUtil;
import com.FlyHigh.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final LoginService loginService;

	/**
	 * Constructor initializes the LoginService.
	 */
	public LoginController() {
		this.loginService = new LoginService();
	}

	/**
	 * Handles GET requests to the login page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for user login.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
	
		if (email == null || email.trim().isEmpty() || !ValidationUtil.isValidEmail(email) || password == null || password.trim().isEmpty()) {
			req.setAttribute("errorMessage", "Email and password are required.");
			req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
			return;
		}

		UserModel userModel = new UserModel(email, password);
		
		
		String UserRole = loginService.getUserRole(userModel);
		userModel.setRole(UserRole);
		
		Boolean loginStatus = loginService.loginUser(userModel);
		

		if (loginStatus != null && loginStatus) {
			SessionUtil.setAttribute(req, "email", email);
			
			if (userModel.getRole().equals("admin")) {
				CookieUtil.addCookie(resp, "role", "admin", 5 * 30);
				resp.sendRedirect(req.getContextPath() + "/dashboard");
			} else {
				CookieUtil.addCookie(resp, "role", "customer", 5 * 30);
				resp.sendRedirect(req.getContextPath() + "/home"); 
			}
		} else {
			handleLoginFailure(req, resp, loginStatus);
		}
	}
	
	

	/**
	 * Handles login failures by setting attributes and forwarding to the login
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 * @param resp        HttpServletResponse object
	 * @param loginStatus Boolean indicating the login status
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "Invalid Email or password!";
		}
		
		req.setAttribute("errorMessage", errorMessage);
		req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	}

}