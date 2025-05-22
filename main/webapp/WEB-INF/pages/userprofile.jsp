<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.FlyHigh.model.UserModel"%>
<%@ page import="com.FlyHigh.model.OrderModel"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile - FlyHigh</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pages/userprofile.css" />
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="container" style="margin-inline:auto">
		<div class="sidebar">
			<h2>Overview</h2>
			<a href="${pageContext.request.contextPath}/userprofile"
				class="active">Profile</a> <a href="#">My orders</a> <a href="#">Payment</a>
			<a href="#">Address</a>
		</div>

		<div class="main-content">
			<%
			if (request.getAttribute("message") != null) {
			%>
			<div class="alert success">
				<%=request.getAttribute("message")%>
			</div>
			<%
			}
			%>

			<%
			// Get the user from the session
			UserModel user = (UserModel) request.getAttribute("user");

			// Fallback if user is not in session
			if (user == null) {
				user = new UserModel();
				user.setFirstname("User");
				user.setEmail("user@gmail.com");
			}

			// Format registration date (assuming it's stored in user model or session)
			String memberSince = "Jan 2024";
			%>

			<h1>
				Welcome,
				<%=user.getFirstname()%>!
			</h1>

			<div class="card-container">
				<div class="profile-card">
					<img
						src="${user.imageUrl != null && !user.imageUrl.isEmpty() ? pageContext.request.contextPath.concat('/').concat(user.imageUrl) : pageContext.request.contextPath.concat('/img/default-profile.png')}"
						alt="Profile image" />
					<div class="profile-details">
						<h3><%=user.getFirstname() + " "%></h3>
						<p><%=user.getEmail()%></p>
						<p>
							DOB:
							<%=memberSince%></p>
						<a href="${pageContext.request.contextPath}/edituserprofile"
							class="btn">Edit Profile</a>
					</div>
				</div>

				<div class="credit">
					<p>My Available FlyHigh Credit</p>
					<h1>USD $0.00</h1>
					<p style="margin-top: 4rem">USD $0.00 available soon</p>
				</div>
			</div>

			<div class="orders">
				<h1>Your Recent Orders</h1>
				<%
				// Get orders from request (would be set by controller in a real app)
				List<OrderModel> orders = (List<OrderModel>) request.getAttribute("orders");

				if (orders == null || orders.isEmpty()) {
				%>
				<p>No orders found.</p>
				<%
				} else {
				%>
				<table class="orders-table">
					<thead>
						<tr>
							<th>Order ID</th>
							<th>Date</th>
							<th>Quantity</th>
							<th>Total Amount</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (OrderModel order : orders) {
						%>
						<tr>
							<td><%=order.getId()%></td>
							<td><%=order.getOrder_date()%></td>
							<td><%=order.getOrder_quantity()%></td>
							<td>USD $<%=String.format("%.2f", order.getTotal_amount())%></td>
							<td><span
								class="status <%=order.getStatus().toLowerCase()%>"><%=order.getStatus()%></span></td>
							<td><a
								href="${pageContext.request.contextPath}/order?id=<%= order.getId() %>"
								class="btn small">View Details</a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>