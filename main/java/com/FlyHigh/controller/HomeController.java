package com.FlyHigh.controller;

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
 * @author Fly High
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Home", "/"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DroneService droneService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        this.droneService = new DroneService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DroneModel> allDrones = droneService.getAllDrones();

        int mid = allDrones.size() / 2;
        List<DroneModel> topDrones = allDrones.subList(0, mid);
        List<DroneModel> trendingDrones = allDrones.subList(mid, allDrones.size());

        request.setAttribute("topDrones", topDrones);               // Used in Trending Products
        request.setAttribute("trendingDrones", trendingDrones);     // Used in New Arrivals


        request.getRequestDispatcher("WEB-INF/pages/home.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
