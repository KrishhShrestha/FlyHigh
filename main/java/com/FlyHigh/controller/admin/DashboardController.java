package com.FlyHigh.controller.admin;

import com.FlyHigh.service.admin.DashboardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final DashboardService service = new DashboardService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1) Orders list
		request.setAttribute("orderData", service.getAllOrders());

		// 2) Raw order-items for modal
		request.setAttribute("orderItems", service.getAllOrderItemsWithInfo());

		// 3) Summary cards
		request.setAttribute("todaysSales", service.getTodaysSales());
		request.setAttribute("totalCustomers", service.getTotalCustomers());
		request.setAttribute("totalProducts", service.getTotalProducts());
		request.setAttribute("monthlyRevenue", service.getMonthlyRevenue());

		// 4) Status counts
		request.setAttribute("statusCounts", service.getOrderStatusCounts());

		// 5) Top products
		request.setAttribute("topProducts", service.getTopSellingProducts(5));


		request.getRequestDispatcher("/WEB-INF/pages/admin/dashboard.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sId = req.getParameter("orderId");
		String newStatus = req.getParameter("newStatus");
		if (sId != null && newStatus != null) {
			int orderId = Integer.parseInt(sId);
			boolean ok = service.updateOrderStatus(orderId, newStatus);
			req.setAttribute("statusMessage", ok ? "Status updated" : "Update failed");
		}
		doGet(req, resp);
	}
}