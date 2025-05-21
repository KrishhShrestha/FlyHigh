package com.FlyHigh.controller.admin;

import com.FlyHigh.model.ContactModel;
import com.FlyHigh.service.ContactService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/contact-messages")
public class AdminContactController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ContactService svc = new ContactService();
		List<ContactModel> messages = svc.getAllMessages();
		request.setAttribute("contacts", messages);
		request.getRequestDispatcher("/WEB-INF/pages/admin/adminContactMessages.jsp").forward(request, response);
	}
}