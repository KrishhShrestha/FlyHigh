package com.FlyHigh.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.SearchService;
import com.FlyHigh.service.admin.DroneService;

/**
 * Servlet implementation class Search
 */
@WebServlet(asyncSupported = true, name = "search", urlPatterns = { "/search", "/drones" })
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SearchService searchService;
	DroneService droneService;
	
    /**
     * Used to create the object of searchService and Droneservice when the controller is initalized
     */
    public SearchController() {
        super();
        // Initialize the services
        this.searchService = new SearchService();
        this.droneService = new DroneService();
    }

	/**
	 * Used to fetch all drones from the database and redirect to the user
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Fetch all drones from the database
		 List<DroneModel> results = droneService.getAllDrones();
		 // Set the results to the attribute in results
		 request.setAttribute("drones", results);
		 // Returns the jsp file to the user
		 request.getRequestDispatcher("WEB-INF/pages/search.jsp").forward(request, response);
	}

	/**
	 * Used to handle the search functionality
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// extract the search from the parameter
	    String keyword = request.getParameter("search");
	    // extract the min value from the parameter
	    Float min = request.getParameter("from") != null && !request.getParameter("from").isEmpty() ? Float.parseFloat(request.getParameter("from")) : 0;
	    // extract the max value from the parameter
	    Float max = request.getParameter("to") != null && !request.getParameter("to").isEmpty() ? Float.parseFloat(request.getParameter("to")) : 99999;
	    // use the searchservice to fetch searched drones
	    List<DroneModel> results = searchService.searchDrones(keyword, min, max);
	    // set the results attribute to the request
	    request.setAttribute("drones", results);
	    // returns the jsp file to the user
	    request.getRequestDispatcher("WEB-INF/pages/search.jsp").forward(request, response);
	}


}
