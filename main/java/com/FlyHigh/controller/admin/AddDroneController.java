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

@WebServlet(asyncSupported = true, urlPatterns = { "/add-drone" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)

public class AddDroneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CategoryService categoryService;

    /**
     * Used to initialize categoryService
     */
    public AddDroneController() {
        super();
        this.categoryService = new CategoryService();
    }

    /**
     * Loads add drone page with category list
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CategoryModel> categoryList = categoryService.getAllCategory();
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("WEB-INF/pages/admin/addDrone.jsp").forward(request, response);
	}

    /**
     * Handles form submission for adding a new drone
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// validate input fields
		String errorMessage = validateFields(request);

		// if validation fails, return to form with error
		if (errorMessage != null) {
		    request.setAttribute("errorMessage", errorMessage);
		    List<CategoryModel> categoryList = categoryService.getAllCategory();
		    request.setAttribute("categoryList", categoryList);
		    request.getRequestDispatcher("WEB-INF/pages/admin/addDrone.jsp").forward(request, response);
		    return;
		}

		// extract form data
		String name = request.getParameter("drone_name");
		String description = request.getParameter("description");
		float price = Float.parseFloat(request.getParameter("price"));
		int category = Integer.parseInt(request.getParameter("category"));		
		float weight = Float.parseFloat(request.getParameter("weight"));
		float flightTime = Float.parseFloat(request.getParameter("flight_time"));
		float rangeStr = Float.parseFloat(request.getParameter("range"));
		String cameraQuality = request.getParameter("camera_quality");
		String dimension = request.getParameter("dimension");
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		// handle image upload
		Part image = request.getPart("image");
		String imageUrl = ImageUtil.getImageNameFromPart(image);
		String formattedImageUrl = ImageUtil.formatImageUrl(imageUrl);

		// create drone model
		CategoryModel categoryModel = new CategoryModel(category);
		DroneModel droneModel = new DroneModel(
			name,
			description,
			price,
			categoryModel,
			weight,
			flightTime,
			rangeStr,
			cameraQuality,
			dimension,
			formattedImageUrl,
			quantity
		);

		// initialize drone service
		DroneService droneService = new DroneService();

		// upload image and save drone
		Boolean ImageUpload = ImageUtil.uploadImage(image, formattedImageUrl, request.getServletContext().getRealPath("/"), "product");

        if (ImageUpload) {
        	droneService.addDrone(droneModel);
        	response.sendRedirect(request.getContextPath() + "/manage-drone?success=Drone added successfully");
        } else {
        	System.out.println("Failed Adding Image");
        }
	}

    /**
     * Used to validate the fields from the form
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

	    if (ValidationUtil.isNullOrEmpty(name)) return "Drone name is required.";
	    if (ValidationUtil.isNullOrEmpty(description)) return "Description is required.";
	    if (ValidationUtil.isNullOrEmpty(priceStr)) return "Price is required.";
	    try {
	        float price = Float.parseFloat(priceStr);
	        if (price <= 0) return "Price must be a positive number.";
	    } catch (NumberFormatException e) {
	        return "Price must be a valid number.";
	    }

	    if (ValidationUtil.isNullOrEmpty(categoryStr)) return "Category is required.";
	    try {
	        int category = Integer.parseInt(categoryStr);
	        if (category <= 0) return "Please select a valid category.";
	    } catch (NumberFormatException e) {
	        return "Category must be a valid number.";
	    }

	    if (ValidationUtil.isNullOrEmpty(weightStr)) return "Weight is required.";
	    try {
	        float weight = Float.parseFloat(weightStr);
	        if (weight <= 0) return "Weight must be a positive number.";
	    } catch (NumberFormatException e) {
	        return "Weight must be a valid number.";
	    }

	    if (ValidationUtil.isNullOrEmpty(flightTimeStr)) return "Flight time is required.";
	    try {
	        float flightTime = Float.parseFloat(flightTimeStr);
	        if (flightTime <= 0) return "Flight time must be a positive number.";
	    } catch (NumberFormatException e) {
	        return "Flight time must be a valid number.";
	    }

	    if (ValidationUtil.isNullOrEmpty(rangeStr)) return "Range is required.";
	    try {
	        float range = Float.parseFloat(rangeStr);
	        if (range <= 0) return "Range must be a positive number.";
	    } catch (NumberFormatException e) {
	        return "Range must be a valid number.";
	    }

	    if (ValidationUtil.isNullOrEmpty(cameraQuality)) return "Camera quality is required.";
	    if (ValidationUtil.isNullOrEmpty(dimension)) return "Dimension is required.";

	    if (ValidationUtil.isNullOrEmpty(quantityStr)) return "Quantity is required.";
	    try {
	        int quantity = Integer.parseInt(quantityStr);
	        if (quantity < 0) return "Quantity must be zero or a positive number.";
	    } catch (NumberFormatException e) {
	        return "Quantity must be a valid number.";
	    }

	    try {
	        Part image = request.getPart("image");
	        if (image == null || ValidationUtil.isNullOrEmpty(image.getSubmittedFileName())) {
	            return "Drone image is required.";
	        }
	        if (!ValidationUtil.isValidImageExtension(image)) {
	            return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
	        }
	    } catch (IOException | ServletException e) {
	        return "Error handling image file. Please ensure the file is valid.";
	    }

	    return null; 
	}
}
