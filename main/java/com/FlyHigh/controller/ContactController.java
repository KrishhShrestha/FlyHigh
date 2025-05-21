package com.FlyHigh.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.FlyHigh.model.ContactModel;
import com.FlyHigh.model.UserModel;
import com.FlyHigh.service.ContactService;
import com.FlyHigh.service.RegisterService;
import com.FlyHigh.util.ImageUtil;
import com.FlyHigh.util.PasswordUtil;
import com.FlyHigh.util.ValidationUtil;

/**
 * Servlet implementation class ContactController
 */
@WebServlet("/contact")
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactController() { // constructor called
        super(); //superclass called
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/contactus.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//post method
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String errorMessage = validateRegistrationForm(request); //validates input

        if (errorMessage != null) {
            System.out.println(errorMessage);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("WEB-INF/pages/contactus.jsp").forward(request, response);
            return;
        }

        // Gather data from form
        String firstname = request.getParameter("fname");
        String lastname = request.getParameter("lname");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        
        System.out.println(" Received Form Data:");
        System.out.println("First Name: " + firstname);
        System.out.println("Last Name: " + lastname);
        System.out.println("Email: " + email);
        System.out.println("Message: " + message);
        
        // object of contact model created
        ContactModel contactModel = new ContactModel(
            firstname,
            lastname,
            email,
            message
        );
        
        //object of contact service created
        ContactService contactService = new ContactService();
        boolean result = contactService.addMessage(contactModel);
        if (result) {
            request.setAttribute("successMessage", "Your message has been sent successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to send your message. Please try again.");
        }
        request.getRequestDispatcher("WEB-INF/pages/contactus.jsp").forward(request, response);


    }
	    
    //validation
    private String validateRegistrationForm(HttpServletRequest request) {
        String firstname = request.getParameter("fname");
        String lastname = request.getParameter("lname");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
     

        if (ValidationUtil.isNullOrEmpty(firstname))
            return "First name is required.";
        if (ValidationUtil.isNullOrEmpty(lastname))
            return "Last name is required.";
        if (ValidationUtil.isNullOrEmpty(email))
            return "Email is required.";
        if (ValidationUtil.isNullOrEmpty(message))
            return "Message is required.";

        
        
        return null; 
    }

}
