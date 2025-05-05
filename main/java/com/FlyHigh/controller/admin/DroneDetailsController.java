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
 * Servlet implementation class DroneDetailsController
 */
@WebServlet({ "/drone-details" })
public class DroneDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DroneService droneService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DroneDetailsController() {
        super();
        this.droneService = new DroneService(); 
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
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

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doGet(request, response);
    }
}
