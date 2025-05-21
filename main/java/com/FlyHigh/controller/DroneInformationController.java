package com.FlyHigh.controller;

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
@WebServlet({ "/drone-information" })
public class DroneInformationController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Service used to perform operations on Drone data
    private DroneService droneService;

    /**
     * Initializes the DroneInfromationController and the DroneService
     */
    public DroneInformationController() {
        super();
        this.droneService = new DroneService(); 
    }

    /**
     * Handles GET requests to view drone details
     */
    @Override
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
                    request.getRequestDispatcher("WEB-INF/pages/droneInformation.jsp").forward(request, response);
                } else {
                    // Redirect to /home if drone not found
                    response.sendRedirect(request.getContextPath() + "/home?error=Drone not found");
                }
            } catch (NumberFormatException e) {
                // Redirect to /home if ID is not a valid integer
                response.sendRedirect(request.getContextPath() + "/home?error=invalid id found");
            }
        } else {
            // Redirect to /home if ID is missing
            response.sendRedirect(request.getContextPath() + "/home?error=An error Occurred");
        }
    }
}
