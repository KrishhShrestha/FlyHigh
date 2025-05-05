//package com.FlyHigh.filter;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//
//import com.FlyHigh.util.CookieUtil;
//import com.FlyHigh.util.SessionUtil;
//
//@WebFilter(asyncSupported = true, urlPatterns = "/*")
//public class AuthenticationFilter implements Filter {
//
//	private static final String LOGIN = "/login";
//	private static final String REGISTER = "/register";
//	private static final String HOME = "/home";
//	private static final String ROOT = "/";
//	private static final String DASHBOARD = "/dashboard";
//	
//	private static final String MANAGE_DRONE = "/droneManage";
//	private static final String ADD_DRONE = "/addDrone";
//	
//	private static final String ADMIN_ORDER = "/droneDetails";
//	
//	private static final String CATEGORY = "/category";
//	private static final String ADDCATEGORY = "/addcategory";
//	private static final String EDITCATEGORY = "/editcategory";
//	
//	private static final String ABOUT = "/about";
//	private static final String PORTFOLIO = "/userprofile";
//	private static final String EDITPROFILE = "/edituserprofile";
//	private static final String CONTACT = "/contact";
//	private static final String CART = "/cart";
//	private static final String ORDER_LIST = "/orderlist";
//	private static final String CART_LIST = "/cartlist";
//
//	@Override
//	public void init(FilterConfig filterConfig) throws ServletException {
//		// Initialization logic, if required
//	}
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//
//		HttpServletRequest req = (HttpServletRequest) request;
//		HttpServletResponse res = (HttpServletResponse) response;
//
//		String uri = req.getRequestURI();
//		
//		if (uri.endsWith("/logout")) {
//		    chain.doFilter(request, response);
//		    return;
//		}
//
//		
//		// Allow access to resources
//		if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
//			chain.doFilter(request, response);
//			return;
//		}
//		
//		boolean isLoggedIn = SessionUtil.getAttribute(req, "email") != null;
//		
//		String userRole = CookieUtil.getCookie(req, "role") != null ? CookieUtil.getCookie(req, "role").getValue() : null;
//
//		
//		if ("admin".equals(userRole)) {
//			System.out.println("Admin  Login");
//			// Admin is logged in
//			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
//				res.sendRedirect(req.getContextPath() + DASHBOARD);
//			} else if (
//					uri.endsWith(DASHBOARD) ||
//					uri.endsWith(MANAGE_DRONE) || 
//					uri.endsWith(ADD_DRONE) || 
//					uri.endsWith(ADMIN_ORDER) || 
//					uri.endsWith(HOME) ||
//					uri.endsWith(CATEGORY) ||
//					uri.endsWith(ADDCATEGORY) ||
//					uri.endsWith(EDITCATEGORY) ||
//					uri.endsWith(ROOT)) {
//				
//				chain.doFilter(request, response);
//			} else if (uri.endsWith(ORDER_LIST) || uri.endsWith(CART_LIST)) {
//				res.sendRedirect(req.getContextPath() + DASHBOARD);
//			} else {
//				res.sendRedirect(req.getContextPath() + DASHBOARD);
//			}
//		} else if ("customer".equals(userRole)) {	
//			System.out.println("Customer login");
//			
//			// User is logged in
//			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
//				res.sendRedirect(req.getContextPath() + HOME);
//			} else if (
//					uri.endsWith(HOME) || 
//					uri.endsWith(ROOT) || 
//					uri.endsWith(ABOUT) || 
//					uri.endsWith(PORTFOLIO)|| 
//					uri.endsWith(CONTACT) || 
//					uri.endsWith(CART) ||
//					uri.endsWith(ORDER_LIST) || 
//					uri.endsWith(ABOUT) ||
//					uri.endsWith(EDITPROFILE) ||
//					uri.endsWith(CART_LIST)) {
//				chain.doFilter(request, response);
//			} else if (uri.endsWith(DASHBOARD) || uri.endsWith(MANAGE_DRONE) || uri.endsWith(ADD_DRONE)
//					|| uri.endsWith(ADMIN_ORDER)) {
//				res.sendRedirect(req.getContextPath() + HOME);
//			} else {
//				res.sendRedirect(req.getContextPath() + HOME);
//			}
//		} else {
//			// Not logged in
//			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
//				chain.doFilter(request, response);
//			} else {
//				System.out.println("Error redireting to login page");
//				res.sendRedirect(req.getContextPath() + LOGIN);
//			}
//		}
//	}
//
//	@Override
//	public void destroy() {
//		// Cleanup logic, if required
//	}
//}


package com.FlyHigh.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

import com.FlyHigh.util.CookieUtil;
import com.FlyHigh.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

	private static final String LOGIN = "/login";
	private static final String REGISTER = "/register";
	private static final String HOME = "/home";
	private static final String ROOT = "/";
	private static final String DASHBOARD = "/dashboard";
	private static final String LOGOUT = "/logout";

	// Admin paths
	private static final Set<String> ADMIN_PATHS = Set.of(
		DASHBOARD, "/droneManage", "/drone_add", "/droneDetails", 
		HOME, "/category", "/addcategory", "/editcategory", ROOT, "/userprofileadmin"
	);

	// Customer paths
	private static final Set<String> CUSTOMER_PATHS = Set.of(
		HOME, ROOT, "/about", "/userprofile", "/edituserprofile", "/contact",
		"/cart", "/orderlist", "/cartlist", "/drone"
	);

	// Public access paths
	private static final Set<String> PUBLIC_PATHS = Set.of(LOGIN, REGISTER, HOME, ROOT);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization logic, if needed
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI().substring(req.getContextPath().length());

		// Allow static resources
		if (uri.matches(".*(\\.png|\\.jpg|\\.css|\\.js|\\.woff2?|\\.ttf|\\.svg)$")) {
			chain.doFilter(request, response);
			return;
		}

		// Allow logout request
		if (uri.equals(LOGOUT)) {
			chain.doFilter(request, response);
			return;
		}

		boolean isLoggedIn = SessionUtil.getAttribute(req, "email") != null;
		
		String userRole = CookieUtil.getCookie(req, "role") != null
				? CookieUtil.getCookie(req, "role").getValue()
				: null;

		if ("admin".equals(userRole)) {
			if (uri.equals(LOGIN) || uri.equals(REGISTER)) {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			} else if (ADMIN_PATHS.contains(uri)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			}
		} else if ("customer".equals(userRole)) {
			if (uri.equals(LOGIN) || uri.equals(REGISTER)) {
				res.sendRedirect(req.getContextPath() + HOME);
			} else if (CUSTOMER_PATHS.contains(uri)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + HOME);
			}
		} else {

			if (PUBLIC_PATHS.contains(uri)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + LOGIN);
			}
		}
	}

	@Override
	public void destroy() {
		// Cleanup logic, if needed
	}
}
