package com.FlyHigh.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
	    String errorMessage = null;

	    String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
	    
	    if (password == null || password.isEmpty()) {
	        errorMessage = "password is required.";
	    } else if (email == null || email.isEmpty()) {
	        errorMessage = "Email is required.";
	    } else if (!email.matches(emailRegex)) {
	        errorMessage = "Invalid email format.";
	    }
	    
	    if (errorMessage != null) {
	        
	        System.out.println(errorMessage);
	        response.sendRedirect("/student-islington/login");
	    } else {
	    	System.out.println(password);
	    	System.out.println(email);
	    	
	    	response.sendRedirect("/student-islington/");
	    }
	}

}
