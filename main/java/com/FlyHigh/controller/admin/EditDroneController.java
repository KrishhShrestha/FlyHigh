package com.FlyHigh.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.List;

import com.FlyHigh.model.CategoryModel;
import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.admin.CategoryService;
import com.FlyHigh.service.admin.DroneService;
import com.FlyHigh.util.ImageUtil;
import com.FlyHigh.util.ValidationUtil;

/**
 * Servlet implementation class EditDroneController
 * Handles GET and POST requests for editing drone details
 */
@WebServlet(asyncSupported = true, name = "edit-drone", urlPatterns = { "/edit-drone" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class EditDroneController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DroneService droneService;
    private CategoryService categoryService;
    
    /**
     * Constructor
     * Initializes drone and category services
     */
    public EditDroneController() {
        super();
        this.categoryService = new CategoryService();
        this.droneService = new DroneService(); 
    }

    /**
     * Handles GET requests for editing a drone
     * Loads drone data and categories to display in the edit form
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int droneId = Integer.parseInt(idParam);
                
                // Load category list and drone details
                List<CategoryModel> categoryList = categoryService.getAllCategory();
                request.setAttribute("categoryList", categoryList);
                
                DroneModel drone = droneService.getDroneById(droneId);

                if (drone != null) {
                	// if drone found send user to edit drone page
                    request.setAttribute("drone", drone);
                    request.getRequestDispatcher("WEB-INF/pages/admin/editDrone.jsp").forward(request, response);
                } else {
                	// if drone not found send user to not found page
                    request.setAttribute("errorMessage", "Drone not found for the provided ID.");
                    request.getRequestDispatcher("WEB-INF/pages/admin/NotFound.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
            	// if cant convert id to number send user to not found page
                request.setAttribute("errorMessage", "Invalid drone ID format.");
                request.getRequestDispatcher("WEB-INF/pages/admin/NotFound.jsp").forward(request, response);
            }
            // send user to not found page if id not found
        } else {
            request.setAttribute("errorMessage", "Drone ID is required.");
            request.getRequestDispatcher("WEB-INF/pages/admin/NotFound.jsp").forward(request, response);
        }
    }

    /**
     * Handles POST requests to update drone details
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("drone_id");

        // Validate drone ID
        if (idParam == null || idParam.isEmpty()) {
            request.setAttribute("errorMessage", "Drone ID is required.");
            request.getRequestDispatcher("WEB-INF/pages/admin/editDrone.jsp").forward(request, response);
            return;
        }

        int droneId;
        try {
            droneId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid drone ID format.");
            request.getRequestDispatcher("WEB-INF/pages/admin/editDrone.jsp").forward(request, response);
            return;
        }

        // Validate all form fields
        String errorMessage = validateFields(request);
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);

            // Refill form data in case of validation error
            DroneModel drone = droneService.getDroneById(droneId);
            List<CategoryModel> categoryList = categoryService.getAllCategory();
            request.setAttribute("drone", drone);
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("WEB-INF/pages/admin/editDrone.jsp").forward(request, response);
            return;
        }

        // Extract form data
        String name = request.getParameter("drone_name");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int categoryId = Integer.parseInt(request.getParameter("category"));        
        float weight = Float.parseFloat(request.getParameter("weight"));
        float flightTime = Float.parseFloat(request.getParameter("flight_time"));
        float range = Float.parseFloat(request.getParameter("range"));
        String cameraQuality = request.getParameter("camera_quality");
        String dimension = request.getParameter("dimension");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Handle image upload
        String imageUrl;
        Part imagePart = request.getPart("image");
        String existingImageUrl = request.getParameter("existingImageUrl");

        if (imagePart != null && imagePart.getSize() > 0) {
            // If new image is uploaded, save it and generate the URL
            imageUrl = ImageUtil.getImageNameFromPart(imagePart);
            imageUrl = ImageUtil.formatImageUrl(imageUrl);

            // Upload image to server directory
            if (!ImageUtil.uploadImage(imagePart, imageUrl, request.getServletContext().getRealPath("/"), "product")) {
                request.setAttribute("errorMessage", "Failed to upload image.");
                DroneModel drone = droneService.getDroneById(droneId);
                List<CategoryModel> categoryList = categoryService.getAllCategory();
                request.setAttribute("drone", drone);
                request.setAttribute("categoryList", categoryList);
                request.getRequestDispatcher("WEB-INF/pages/admin/editDrone.jsp").forward(request, response);
                return;
            }
        } else {
            // Keep using the existing image
            imageUrl = existingImageUrl;
        }

        // Create drone model from form data
        CategoryModel categoryModel = new CategoryModel(categoryId);
        DroneModel droneModel = new DroneModel(
            name,
            description,
            price,
            categoryModel,
            weight,
            flightTime,
            range,
            cameraQuality,
            dimension,
            imageUrl,
            quantity
        );

        // Update drone in the database
        boolean success = droneService.editDrone(droneId, droneModel);
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/manage-drone?success=Drone updated successfully");
        } else {
            request.setAttribute("errorMessage", "Failed to update drone.");
            DroneModel drone = droneService.getDroneById(droneId);
            List<CategoryModel> categoryList = categoryService.getAllCategory();
            request.setAttribute("drone", drone);
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("WEB-INF/pages/admin/editDrone.jsp").forward(request, response);
        }
    }

    /**
     * Validates all input fields from the edit form
     * @return error message string if validation fails, or null if all fields are valid
     */
    public String validateFields(HttpServletRequest request) {
        String name = request.getParameter("drone_name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String categoryStr = request.getParameter("category");
        String weightStr = request.getParameter("weight");
        String flightTimeStr = request.getParameter("flight_time");
        String rangeStr = request.getParameter("range");
        String cameraQuality = request.getParameter("camera_quality");
        String dimension = request.getParameter("dimension");
        String quantityStr = request.getParameter("quantity");

        // Validate name
        if (ValidationUtil.isNullOrEmpty(name))
            return "Drone name is required.";

        // Validate description
        if (ValidationUtil.isNullOrEmpty(description))
            return "Description is required.";

        // Validate price
        if (ValidationUtil.isNullOrEmpty(priceStr))
            return "Price is required.";
        try {
            float price = Float.parseFloat(priceStr);
            if (price <= 0)
                return "Price must be a positive number.";
        } catch (NumberFormatException e) {
            return "Price must be a valid number.";
        }

        // Validate category
        if (ValidationUtil.isNullOrEmpty(categoryStr))
            return "Category is required.";
        try {
            int category = Integer.parseInt(categoryStr);
            if (category <= 0)
                return "Please select a valid category.";
        } catch (NumberFormatException e) {
            return "Category must be a valid number.";
        }

        // Validate weight
        if (ValidationUtil.isNullOrEmpty(weightStr))
            return "Weight is required.";
        try {
            float weight = Float.parseFloat(weightStr);
            if (weight <= 0)
                return "Weight must be a positive number.";
        } catch (NumberFormatException e) {
            return "Weight must be a valid number.";
        }

        // Validate flight time
        if (ValidationUtil.isNullOrEmpty(flightTimeStr))
            return "Flight time is required.";
        try {
            float flightTime = Float.parseFloat(flightTimeStr);
            if (flightTime <= 0)
                return "Flight time must be a positive number.";
        } catch (NumberFormatException e) {
            return "Flight time must be a valid number.";
        }

        // Validate range
        if (ValidationUtil.isNullOrEmpty(rangeStr))
            return "Range is required.";
        try {
            float range = Float.parseFloat(rangeStr);
            if (range <= 0)
                return "Range must be a positive number.";
        } catch (NumberFormatException e) {
            return "Range must be a valid number.";
        }

        // Validate camera quality
        if (ValidationUtil.isNullOrEmpty(cameraQuality))
            return "Camera quality is required.";

        // Validate dimension
        if (ValidationUtil.isNullOrEmpty(dimension))
            return "Dimension is required.";

        // Validate quantity
        if (ValidationUtil.isNullOrEmpty(quantityStr))
            return "Quantity is required.";
        try {
            int quantity = Integer.parseInt(quantityStr);
            if (quantity < 0)
                return "Quantity must be zero or a positive number.";
        } catch (NumberFormatException e) {
            return "Quantity must be a valid number.";
        }

        // All fields valid
        return null;
    }
}
