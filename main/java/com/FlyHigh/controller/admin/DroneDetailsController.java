package com.FlyHigh.controller.admin;

import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.admin.DroneService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet({ "/drone-details" })
public class DroneDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DroneService droneService;

    public DroneDetailsController() {
        super();
        this.droneService = new DroneService(); 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int droneId = Integer.parseInt(idParam);
                DroneModel drone = droneService.getDroneById(droneId);

                if (drone != null) {
                    request.setAttribute("drone", drone);
                    request.getRequestDispatcher("WEB-INF/pages/admin/droneDetails.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Drone not found for the provided ID.");
                    request.getRequestDispatcher("WEB-INF/pages/admin/droneDetails.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid drone ID format.");
                request.getRequestDispatcher("WEB-INF/pages/admin/droneDetails.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Drone ID is required.");
            request.getRequestDispatcher("WEB-INF/pages/admin/droneDetails.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int droneId = Integer.parseInt(request.getParameter("droneId"));

        switch (action) {
            case "delete":
                handleDelete(request, response, droneId);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException {
        boolean success = droneService.deleteDrone(id);

        if (success) {
            System.out.println("Deletion successful");
            // Redirect after deletion
            response.sendRedirect(request.getContextPath() + "/manage-drone");
        } else {
            System.out.println("Deletion failed");
            // Handle deletion failure (you can forward to an error page or show an error message)
            request.setAttribute("errorMessage", "Failed to delete drone.");
            request.getRequestDispatcher("WEB-INF/pages/admin/droneDetails.jsp").forward(request, response);
        }
    }
}

