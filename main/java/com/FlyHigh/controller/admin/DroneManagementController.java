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
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/manage-drone" })
public class DroneManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DroneService droneService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DroneManagementController() {
        super();
        // TODO Auto-generated constructor stub
        this.droneService = new DroneService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<DroneModel> droneList = droneService.getAllDrones();
		
		if (droneList == null || droneList.isEmpty()) {
		    request.setAttribute("errorMessage", "No drones found or an error occurred.");
		}
		
		request.setAttribute("DroneData", droneList);
		
		request.getRequestDispatcher("WEB-INF/pages/admin/droneManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
