package com.FlyHigh.controller.admin;

import com.FlyHigh.model.DroneModel;
import com.FlyHigh.model.OrderModel;
import com.FlyHigh.service.admin.DashboardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DashboardService service = new DashboardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1) Recent orders
        List<OrderModel> orders = service.getAllOrders();
        request.setAttribute("orderData", orders);

        // 2) Summary cards
        request.setAttribute("todaysSales", service.getTodaysSales());
        request.setAttribute("totalCustomers", service.getTotalCustomers());
        request.setAttribute("totalProducts", service.getTotalProducts());
        request.setAttribute("monthlyRevenue", service.getMonthlyRevenue());

        // 3) Status counts
        Map<String,Integer> statusCounts = service.getOrderStatusCounts();
        request.setAttribute("statusCounts", statusCounts);

        // 4) Top products (limit 5)
        List<DroneModel> topProducts = service.getTopSellingProducts(5);
        request.setAttribute("topProducts", topProducts);

        // 5) Weekly sales and max value for chart scaling
        Map<LocalDate,Double> weeklySales = service.getWeeklySales();
        request.setAttribute("weeklySales", weeklySales);
        double maxSale = weeklySales.values().stream().mapToDouble(Double::doubleValue).max().orElse(1.0);
        request.setAttribute("maxWeeklySale", maxSale);

        // Forward to JSP
        request.getRequestDispatcher("/WEB-INF/pages/admin/dashboard.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}