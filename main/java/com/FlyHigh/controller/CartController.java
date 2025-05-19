package com.FlyHigh.controller;

import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.admin.DroneService;
import com.FlyHigh.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    public CartController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            int droneId = Integer.parseInt(request.getParameter("productId"));

            List<Integer> cart = (List<Integer>) SessionUtil.getAttribute(request, "cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            if (!cart.contains(droneId)) {
                cart.add(droneId);
            }

            SessionUtil.setAttribute(request, "cart", cart);

            // Redirect to /cart to show updated cart (triggers doGet)
            response.sendRedirect(request.getContextPath() + "/cart");
        } else if ("remove".equalsIgnoreCase(action)) {
            // Optional: Handle remove action if you want to support removing items from cart
            List<Integer> cart = (List<Integer>) SessionUtil.getAttribute(request, "cart");
            if (cart != null) {
                int droneId = Integer.parseInt(request.getParameter("productId"));
                cart.remove(Integer.valueOf(droneId));
                SessionUtil.setAttribute(request, "cart", cart);
            }
            response.sendRedirect(request.getContextPath() + "/cart");
        } else {
            // For other actions, just redirect to cart page
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Integer> cart = (List<Integer>) SessionUtil.getAttribute(request, "cart");
        List<DroneModel> cartItems = new ArrayList<>();

        if (cart != null && !cart.isEmpty()) {
            DroneService droneService = new DroneService();

            for (Integer id : cart) {
                DroneModel drone = droneService.getDroneById(id);
                if (drone != null) {
                    cartItems.add(drone);
                }
            }
        }

        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("WEB-INF/pages/cart.jsp").forward(request, response);
    }
}
