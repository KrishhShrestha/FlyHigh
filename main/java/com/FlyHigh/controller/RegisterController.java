package com.FlyHigh.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import com.FlyHigh.model.UserModel;
import com.FlyHigh.service.RegisterService;

/**
 * Servlet implementation class Register
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Retrieve form inputs
	    String firstname = request.getParameter("first_name");
	    String lastname = request.getParameter("last_name");
	    String phone = request.getParameter("phone");
	    String gender = request.getParameter("gender");
	    String dob = request.getParameter("dob");
	    String email = request.getParameter("email");
	    String address = request.getParameter("address");
	    String password = request.getParameter("password");
	    String confirmpassword = request.getParameter("confirm-password");


	    // Initialize error message
	    String errorMessage = null;

	    // Regex for email validation
	    String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

	    // Validate fields are not empty and meet required conditions
	    if (firstname == null || firstname.isEmpty()) {
	        errorMessage = "First Name is required.";
	    } else if (lastname == null || lastname.isEmpty()) {
	        errorMessage = "Last Name is required.";
	    } else if (phone == null || phone.isEmpty()) {
	        errorMessage = "phone is required.";
	    } else if (gender == null || gender.isEmpty()) {
	        errorMessage = "Gender is required.";
	    } else if (dob  == null) {
	        errorMessage = "dob is required.";
	    } else if (email == null || email.isEmpty()) {
	        errorMessage = "Email is required.";
	    } else if (!email.matches(emailRegex)) {
	        errorMessage = "Invalid email format.";
	    } else if (address == null || address.isEmpty()) {
	        errorMessage = "address is required.";
	    } else if (password == null || password.isEmpty()) {
	        errorMessage = "Password is required.";
	    } else if (!password.equals(confirmpassword)) {
	        errorMessage = "Passwords do not match.";
	    }
	    
	   

	    // If there is an error, return the user to the form with the error message
	    if (errorMessage != null) {
	        System.out.println(errorMessage);
	        request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
	    } else {
	    	 
	    	System.out.println(firstname);
	    	System.out.println(lastname);
	    	System.out.println(phone);
	    	System.out.println(gender);
	    	System.out.println(dob);
	    	System.out.println(email);
	    	System.out.println(address);
	    	System.out.println(password);
	    	System.out.println(confirmpassword);
	        
	    	
	    	
	    UserModel userModel = new UserModel(
	    		    firstname,
	    		    lastname,
	    		    phone,
	    		    gender,
	    		    dob,
	    		    email,
	    		    address,
	    		    password,
	    		    confirmpassword
	    		);
	    
	    RegisterService registerService = new RegisterService();
	    registerService.addUser(userModel);

    
	    response.sendRedirect(request.getContextPath() + "/login");

	    	
	    }
	}


}