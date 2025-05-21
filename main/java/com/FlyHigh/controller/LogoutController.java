package com.FlyHigh.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.FlyHigh.util.CookieUtil;
import com.FlyHigh.util.SessionUtil;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
	/*
	 * The constructor is called when the login controller is initalized
	 */
	public LogoutController() {
        super();
    }
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		System.out.println("Logging out"); // print a message for debugging
		
		//		Delete the cookie for role upon logout
		CookieUtil.deleteCookie(response, "role");
		//		Clear the Sesison 
		SessionUtil.invalidateSession(request);
		// Redirect the user to the login page with a success message
		response.sendRedirect(request.getContextPath() + "/login?success=Logged out successfully!");
	}

}
