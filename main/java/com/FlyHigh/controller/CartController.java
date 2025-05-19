package com.FlyHigh.controller;

import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.CartService;
import com.FlyHigh.service.RegisterService;
import com.FlyHigh.service.admin.DroneService;
import com.FlyHigh.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private static final int MAX_QUANTITY = 10;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Get or create cart from session
        Map<Integer, Integer> cart = (Map<Integer, Integer>) SessionUtil.getAttribute(request, "cart");
        
        if (cart == null) {
            cart = new HashMap<>();
        }

        // Handle actions
        if ("add".equalsIgnoreCase(action)) {
            int droneId = Integer.parseInt(request.getParameter("productId"));
            int currentQty = cart.getOrDefault(droneId, 0);
            if (currentQty < MAX_QUANTITY) {
                cart.put(droneId, currentQty + 1);
            }
        } else if ("remove".equalsIgnoreCase(action)) {
            int droneId = Integer.parseInt(request.getParameter("productId"));
            cart.remove(droneId);
        } else if ("updateQuantity".equalsIgnoreCase(action)) {
            int droneId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            if (quantity <= 0) {
                cart.remove(droneId);
            } else if (quantity <= MAX_QUANTITY) {
                cart.put(droneId, quantity);
            }
        } else if ("checkout".equalsIgnoreCase(action)) {
        	String email = (String) SessionUtil.getAttribute(request, "email");
        	
        	RegisterService registerService = new RegisterService();
        	String id = registerService.getIdByEmail(email);

        	
        	System.out.println(email + " " + id);
        	

//        	CartService cartService = new CartService();
//        	cartService.handleCheckout(id,cart);
        }

        // Save cart to session
        SessionUtil.setAttribute(request, "cart", cart);
        response.sendRedirect(request.getContextPath() + "/cart");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) SessionUtil.getAttribute(request, "cart");
        
        List<DroneModel> cartItems = new ArrayList<>();
        Map<Integer, Integer> quantityMap = new HashMap<>(); // can also be changed to Map

        if (cart != null && !cart.isEmpty()) {
            DroneService droneService = new DroneService();
            Iterator<Map.Entry<Integer, Integer>> iterator = cart.entrySet().iterator();

            while (iterator.hasNext()) {
                Map.Entry<Integer, Integer> entry = iterator.next();
                Integer droneId = entry.getKey();
                DroneModel drone = droneService.getDroneById(droneId);
                if (drone != null) {
                    cartItems.add(drone);
                    quantityMap.put(droneId, entry.getValue());
                } else {
                    iterator.remove(); 
                }
            }

            SessionUtil.setAttribute(request, "cart", cart);
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("quantityMap", quantityMap);
        request.getRequestDispatcher("WEB-INF/pages/cart.jsp").forward(request, response);
    }
}




















