package com.FlyHigh.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.admin.DroneService;

/**
 * Servlet implementation class DroneManagementController
 * This controller is responsible for handling requests related to managing drones.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/manage-drone" })
public class ManageDroneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Service class to handle business logic for drones
	private DroneService droneService;

    /**
     * Default constructor. Initializes the DroneService.
     */
    public ManageDroneController() {
        super();
        this.droneService = new DroneService();
    }

	/**
	 * Handles the GET request to load and display all drones.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Fetch all drones from the database
		List<DroneModel> droneList = droneService.getAllDrones();

		// Pass success message from the parameter
		request.setAttribute("success", request.getParameter("success"));

		// If no drones are found, error message is sent
		if (droneList == null || droneList.isEmpty()) {
		    request.setAttribute("errorMessage", "No drones found or an error occurred.");
		}

		// Set the fetched drone data in the request attribute to be used in JSP
		request.setAttribute("DroneData", droneList);

		// Forward the jsp page to the user
		request.getRequestDispatcher("WEB-INF/pages/admin/droneManagement.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Call doGet to display updated list after a POST action
		doGet(request, response);
	}
}
