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
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
        this.searchService = new SearchService();
        this.droneService = new DroneService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 List<DroneModel> results = droneService.getAllDrones();
		 
		 request.setAttribute("drones", results);
		 request.getRequestDispatcher("WEB-INF/pages/search.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String keyword = request.getParameter("search");
	    Float min = request.getParameter("from") != null && !request.getParameter("from").isEmpty() 
	                    ? Float.parseFloat(request.getParameter("from")) : 0;
	    Float max = request.getParameter("to") != null && !request.getParameter("to").isEmpty() 
	                    ? Float.parseFloat(request.getParameter("to")) : 99999;

	    
	    List<DroneModel> results = searchService.searchDrones(keyword, min, max);

	    request.setAttribute("drones", results);
	    request.getRequestDispatcher("WEB-INF/pages/search.jsp").forward(request, response);
	}


}
