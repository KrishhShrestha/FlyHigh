package com.FlyHigh.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.FlyHigh.model.UserModel;
import com.FlyHigh.service.RegisterService;
import com.FlyHigh.util.ImageUtil;
import com.FlyHigh.util.PasswordUtil;
import com.FlyHigh.util.ValidationUtil;
import jakarta.servlet.http.Part;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)

public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String errorMessage = validateRegistrationForm(request);

        if (errorMessage != null) {
            System.out.println(errorMessage);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        // Gather data from form
        String firstname = request.getParameter("first_name");
        String lastname = request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        
        
        String password = request.getParameter("password");       
        password = PasswordUtil.encrypt(email, password);
        
        
		Part image = request.getPart("image");
		String imageUrl = ImageUtil.getImageNameFromPart(image);
		String formattedImageUrl = ImageUtil.formatImageUrl(imageUrl);
        
        
        // Create model and persist user
        UserModel userModel = new UserModel(
            firstname,
            lastname,
            phone,
            gender,
            dob,
            email,
            address,
            password,
            formattedImageUrl
        );
        
        
        RegisterService registerService = new RegisterService();
        
        Boolean ImageUpload = ImageUtil.uploadImage(image, formattedImageUrl, request.getServletContext().getRealPath("/"), "user_profile");
        
        if(ImageUpload) {
        	registerService.addUser(userModel);
        	System.out.println("User Created");
        	
        	response.sendRedirect(request.getContextPath() + "/login");
        }else {
        	System.out.println("Failed Adding Image");
        }
        
    }
    
    
    private String validateRegistrationForm(HttpServletRequest request) {
        String firstname = request.getParameter("first_name");
        String lastname = request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirm-password");

        if (ValidationUtil.isNullOrEmpty(firstname))
            return "First name is required.";
        if (ValidationUtil.isNullOrEmpty(lastname))
            return "Last name is required.";
        if (ValidationUtil.isNullOrEmpty(phone))
            return "Phone number is required.";
        if (ValidationUtil.isNullOrEmpty(gender))
            return "Gender is required.";
        if (ValidationUtil.isNullOrEmpty(dob))
            return "Date of birth is required.";
        if (ValidationUtil.isNullOrEmpty(email))
            return "Email is required.";
        if (ValidationUtil.isNullOrEmpty(address))
            return "Address is required.";
        if (ValidationUtil.isNullOrEmpty(password))
            return "Password is required.";
        if (ValidationUtil.isNullOrEmpty(confirmpassword))
            return "Please confirm your password.";
        if (!ValidationUtil.isValidPhoneNumber(phone))
            return "Phone number must be 10 digits and start with 98.";
        if (!ValidationUtil.isValidGender(gender))
            return "Gender must be 'male' or 'female'.";
        if (!ValidationUtil.isValidEmail(email))
            return "Invalid email format.";
        if (!ValidationUtil.isValidPassword(password))
            return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
        if (!ValidationUtil.doPasswordsMatch(password, confirmpassword))
            return "Passwords do not match.";
    
		try {
			Part image = request.getPart("image");
		    
			if (image == null || ValidationUtil.isNullOrEmpty(image.getSubmittedFileName())) {
		        return "User image is required.";
		    }
		    
			if (!ValidationUtil.isValidImageExtension(image)) 
				return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
			
		} catch (IOException | ServletException e) {
			return "Error handling image file. Please ensure the file is valid.";
		}
        
        return null; 
    }
}
