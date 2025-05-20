package com.FlyHigh.controller.admin;

import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.admin.DroneService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Controller to handle viewing and deleting individual drone details
 */
@WebServlet({ "/drone-details" })
public class DroneDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Service used to perform operations on Drone data
    private DroneService droneService;

    /**
     * Initializes the DroneDetailsController and the DroneService
     */
    public DroneDetailsController() {
        super();
        this.droneService = new DroneService(); 
    }

    /**
     * Handles GET requests to view drone details
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get drone ID from the request parameter
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                // Parse drone ID to integer
                int droneId = Integer.parseInt(idParam);
                // Fetch the drone object by ID
                DroneModel drone = droneService.getDroneById(droneId);

                if (drone != null) {
                    // If drone found, set it in the request and forward to details page
                    request.setAttribute("drone", drone);
                    request.getRequestDispatcher("WEB-INF/pages/admin/droneDetails.jsp").forward(request, response);
                } else {
                    // If drone not found, show not found page with message
                    request.setAttribute("errorMessage", "Drone not found for the provided ID.");
                    request.getRequestDispatcher("WEB-INF/pages/admin/NotFound.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                // If ID is not a valid integer, show error
                request.setAttribute("errorMessage", "Invalid drone ID format.");
                request.getRequestDispatcher("WEB-INF/pages/admin/NotFound.jsp").forward(request, response);
            }
        } else {
            // If ID is missing from the request, show error
            request.setAttribute("errorMessage", "Drone ID is required.");
            request.getRequestDispatcher("WEB-INF/pages/admin/NotFound.jsp").forward(request, response);
        }
    }

    /**
     * Handles POST requests for actions like delete
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get action and drone ID from the form
        String action = request.getParameter("action");
        int droneId = Integer.parseInt(request.getParameter("droneId"));

        switch (action) {
            case "delete":
                // Handle deletion
                handleDelete(request, response, droneId);
                break;
            default:
                // If action is unknown, send a 400 error
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
        }
    }

    /**
     * Handles drone deletion
     */
    private void handleDelete(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException {
        // Attempt to delete the drone using service
        boolean success = droneService.deleteDrone(id);

        if (success) {
            System.out.println("Deletion successful");
            // Redirect to manage page with success message
            response.sendRedirect(request.getContextPath() + "/manage-drone?success=Drone Deleted successfully");
        } else {
            System.out.println("Deletion failed");
            // If deletion fails, return to detail page with error
            request.setAttribute("errorMessage", "Failed to delete drone.");
            request.getRequestDispatcher("WEB-INF/pages/admin/droneDetails.jsp").forward(request, response);
        }
    }
}
