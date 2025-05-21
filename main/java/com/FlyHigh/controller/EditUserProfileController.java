package com.FlyHigh.controller;

import com.FlyHigh.model.UserModel;
import com.FlyHigh.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

@WebServlet("/edituserprofile")
@MultipartConfig
public class EditUserProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();
    private static final String UPLOAD_DIR = "img/uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1) Get email from session
        HttpSession session = request.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("email") : null;

        if (email == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2) Load user from DB
        UserModel user = userService.findByEmail(email);
        request.setAttribute("user", user);

        // 3) Forward to edit form
        request.getRequestDispatcher("/WEB-INF/pages/edituserprofile.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1) Get email from session
        HttpSession session = request.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("email") : null;

        if (email == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2) Load current user
        UserModel user = userService.findByEmail(email);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 3) Read form fields
        String firstname = request.getParameter("firstname");
        String lastname  = request.getParameter("lastname");
        String phone     = request.getParameter("phone");
        String gender    = request.getParameter("gender");
        String dob       = request.getParameter("dob");
        String address   = request.getParameter("address");
        String password  = request.getParameter("password");
        String confirm   = request.getParameter("confirmPassword");

        boolean hasError = false;
        if (firstname == null || firstname.trim().isEmpty()) {
            request.setAttribute("firstnameError", "First name is required");
            hasError = true;
        }
        if (lastname == null || lastname.trim().isEmpty()) {
            request.setAttribute("lastnameError", "Last name is required");
            hasError = true;
        }
        if (password != null && !password.isEmpty() && !password.equals(confirm)) {
            request.setAttribute("passwordError", "Passwords do not match");
            hasError = true;
        }

        // 4) Handle image upload
        Part filePart = request.getPart("profileImage");
        if (filePart != null && filePart.getSize() > 0) {
            String newName = UUID.randomUUID() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File dir = new File(uploadPath);
            if (!dir.exists()) dir.mkdirs();
            String fullPath = uploadPath + File.separator + newName;
            filePart.write(fullPath);
            user.setImageUrl(UPLOAD_DIR + "/" + newName);
        }

        if (hasError) {
            // re-populate fields so form isn’t blank
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setPhone(phone);
            user.setGender(gender);
            user.setDob(dob);
            user.setAddress(address);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/pages/editprofile.jsp")
                   .forward(request, response);
            return;
        }

        // 5) Update model
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setPhone(phone);
        user.setGender(gender);
        user.setDob(dob);
        user.setAddress(address);
        if (password != null && !password.isEmpty()) {
            user.setPassword(password);
        }

        // 6) Persist to DB
        boolean updated = userService.updateUser(user);
        if (updated) {
            request.setAttribute("message", "Profile updated successfully");
        } else {
            request.setAttribute("uploadError", "Failed to update profile");
        }

        // 7) Forward back to edit form with fresh data
        UserModel refreshed = userService.findByEmail(email);
        request.setAttribute("user", refreshed);
        request.getRequestDispatcher("/WEB-INF/pages/edituserprofile.jsp")
               .forward(request, response);
    }
}