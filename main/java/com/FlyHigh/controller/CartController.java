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
        String email = (String) SessionUtil.getAttribute(request, "email");

        if (cart == null) {
            cart = new HashMap<>();
        }

        if ("add".equalsIgnoreCase(action)) {
            int droneId = Integer.parseInt(request.getParameter("productId"));
            int currentQty = cart.getOrDefault(droneId, 0);
            if (currentQty < MAX_QUANTITY) {
                cart.put(droneId, currentQty + 1);
            }
            SessionUtil.setAttribute(request, "cart", cart);
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        } else if ("remove".equalsIgnoreCase(action)) {
            int droneId = Integer.parseInt(request.getParameter("productId"));
            cart.remove(droneId);
            SessionUtil.setAttribute(request, "cart", cart);
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        } else if ("updateQuantity".equalsIgnoreCase(action)) {
            int droneId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            if (quantity <= 0) {
                cart.remove(droneId);
            } else if (quantity <= MAX_QUANTITY) {
                cart.put(droneId, quantity);
            }
            
            SessionUtil.setAttribute(request, "cart", cart);
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        } else if ("checkout".equalsIgnoreCase(action)) {
            CartService cartService = new CartService();
            String errorMessage = cartService.handleCheckout(email, cart);

            if (errorMessage == null) {
                SessionUtil.setAttribute(request, "cart", null);
                response.sendRedirect(request.getContextPath() + "/purchasesuccess");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart?error=" + java.net.URLEncoder.encode(errorMessage, "UTF-8"));
            }

        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) SessionUtil.getAttribute(request, "cart");
        
        List<DroneModel> cartItems = new ArrayList<>();
        Map<Integer, Integer> quantityMap = new HashMap<>();
        
       
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
        
        request.setAttribute("errorMessage", request.getParameter("error"));
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("quantityMap", quantityMap);
        request.getRequestDispatcher("WEB-INF/pages/cart.jsp").forward(request, response);
    }
}




















