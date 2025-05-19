package com.FlyHigh.controller;

import java.io.IOException;

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
 * LoginController is responsible for handling login requests.
 * It interacts with the LoginService to authenticate users.
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
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("success", request.getParameter("success"));
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for user login.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String errorMessage = validateLoginFields(req);

		if (errorMessage != null) {
			req.setAttribute("errorMessage", errorMessage);
			req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
			return;
		}

		String email = req.getParameter("email").trim();
		String password = req.getParameter("password").trim();

		UserModel userModel = new UserModel(email, password);
		String userRole = loginService.getUserRole(userModel);

		if (userRole == null || userRole.trim().isEmpty()) {
			req.setAttribute("errorMessage", "User not found.");
			req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
			return;
		}

		userModel.setRole(userRole);
		Boolean loginStatus = loginService.loginUser(userModel);

		if (loginStatus != null && loginStatus) {
			SessionUtil.setAttribute(req, "email", email);

			if (userModel.getRole().equals("admin")) {
				CookieUtil.addCookie(resp, "role", "admin", 30 * 60);
				resp.sendRedirect(req.getContextPath() + "/dashboard");
			} else {
				CookieUtil.addCookie(resp, "role", "customer", 30 * 60);
				resp.sendRedirect(req.getContextPath() + "/home");
			}
		} else {
			handleLoginFailure(req, resp, loginStatus);
		}
	}

	/**
	 * Validates login input fields.
	 */
	private String validateLoginFields(HttpServletRequest req) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		if (ValidationUtil.isNullOrEmpty(email)) {
			return "Email is required.";
		}

		if (!ValidationUtil.isValidEmail(email)) {
			return "Please enter a valid email address.";
		}

		if (ValidationUtil.isNullOrEmpty(password)) {
			return "Password is required.";
		}

		return null; // No errors
	}

	/**
	 * Handles login failures by setting error message and forwarding back to login.
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "Invalid email or password!";
		}

		req.setAttribute("errorMessage", errorMessage);
		req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	}
}
