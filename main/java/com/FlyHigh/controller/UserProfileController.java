package com.FlyHigh.controller;

import com.FlyHigh.model.OrderModel;
import com.FlyHigh.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
//import java.util.ArrayList;
import java.util.List;

import com.FlyHigh.service.OrderService;
import com.FlyHigh.service.UserService;
/**
 * Servlet implementation class UserProfileController
 */
@WebServlet("/userprofile")
public class UserProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // You’ll need a service to fetch users/orders
    private final UserService userService = new UserService();
    private final OrderService orderService = new OrderService();

    public UserProfileController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // A. Dump out all session attributes we care about
        String email = (String) session.getAttribute("email");
        String role  = (String) session.getAttribute("role");
        Object rawUser = session.getAttribute("user");
        System.out.println("DEBUG: session.email = " + email);
        System.out.println("DEBUG: session.role  = " + role);
        System.out.println("DEBUG: session.user  = " + rawUser);

        // B. Redirect if not logged in
        if (email == null) {
            System.out.println("DEBUG: No email in session—redirecting to /login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // C. Fetch UserModel by email
        UserModel user = userService.findByEmail(email);
        System.out.println("DEBUG: userService.findByEmail(\"" + email + "\") returned: " + user);
        request.setAttribute("user", user);

        // D. Flash message
        String message = (String) session.getAttribute("message");
        System.out.println("DEBUG: session.message = " + message);
        if (message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message");
            System.out.println("DEBUG: Cleared session.message");
        }

        // E. Fetch orders
        List<OrderModel> orders = orderService.findByUserEmail(email);
        System.out.println("DEBUG: orderService.findByUserEmail(\"" + email + "\") returned "
                            + orders.size() + " orders");
        for (OrderModel o : orders) {
            System.out.println("  Order #" + o.getId()
                               + " | qty=" + o.getOrder_quantity()
                               + " | date=" + o.getOrder_date()
                               + " | total=" + o.getTotal_amount()
                               + " | status=" + o.getStatus());
        }
        request.setAttribute("orders", orders);

        // F. Forward
        System.out.println("DEBUG: forwarding to userprofile.jsp");
        request.getRequestDispatcher("/WEB-INF/pages/userprofile.jsp")
               .forward(request, response);
        System.out.println("DEBUG: forward completed");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}