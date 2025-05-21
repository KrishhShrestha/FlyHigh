<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/dashboard.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<jsp:include page="sidebar.jsp" />

	<div style="margin-left: 15vw" class="dashboard-container">
		<main class="main-content">
			<!-- Title -->
			<div class="dashboard-title">
				<h1>Dashboard Overview</h1>
				<p>Welcome back! Here's what's happening with your drone store
					today.</p>
			</div>

			<!-- Sales Summary Cards -->
			<section class="sales-summary">
				<div class="summary-card teal">
					<div class="card-icon">
						<i class="fas fa-shopping-bag"></i>
					</div>
					<div class="card-content">
						<h3>Today's Sales</h3>
						<p class="amount">$${todaysSales}</p>
					</div>
				</div>

				<div class="summary-card orange">
					<div class="card-icon">
						<i class="fas fa-users"></i>
					</div>
					<div class="card-content">
						<h3>Total Customers</h3>
						<p class="amount">${totalCustomers}</p>
					</div>
				</div>

				<div class="summary-card blue">
					<div class="card-icon">
						<i class="fas fa-box"></i>
					</div>
					<div class="card-content">
						<h3>Total Products</h3>
						<p class="amount">${totalProducts}</p>
					</div>
				</div>

				<div class="summary-card green">
					<div class="card-icon">
						<i class="fas fa-dollar-sign"></i>
					</div>
					<div class="card-content">
						<h3>Monthly Revenue</h3>
						<p class="amount">$${monthlyRevenue}</p>
					</div>
				</div>
			</section>

			<!-- Order Management Section -->
			<section class="order-management">
				<div class="section-header">
					<h2>Order Management</h2>
					<button class="view-all-btn">View All</button>
				</div>

				<div class="order-status-cards">
					<div class="status-card">
						<div class="status-icon pending">
							<i class="fas fa-clock"></i>
						</div>
						<div class="status-content">
							<h3>Orders Pending</h3>
							<p class="status-count">
								<c:choose>
									<c:when test="${not empty statusCounts['pending']}">${statusCounts['pending']}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>

					<div class="status-card">
						<div class="status-icon processing">
							<i class="fas fa-cog"></i>
						</div>
						<div class="status-content">
							<h3>Orders Processing</h3>
							<p class="status-count">
								<c:choose>
									<c:when test="${not empty statusCounts['processing']}">${statusCounts['processing']}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>

					<div class="status-card">
						<div class="status-icon delivered">
							<i class="fas fa-check-circle"></i>
						</div>
						<div class="status-content">
							<h3>Orders Delivered</h3>
							<p class="status-count">
								<c:choose>
									<c:when test="${not empty statusCounts['success']}">${statusCounts['success']}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>

					<div class="status-card">
						<div class="status-icon canceled">
							<i class="fas fa-times-circle"></i>
						</div>
						<div class="status-content">
							<h3>Orders Canceled</h3>
							<p class="status-count">
								<c:choose>
									<c:when test="${not empty statusCounts['']}">${statusCounts['']}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
				</div>

				<!-- Recent Orders Table -->
				<div class="recent-orders">
					<h3>Recent Orders</h3>
					<div class="table-container">
						<table class="orders-table">
							<thead>
								<tr>
									<th>Order ID</th>
									<th>Date</th>
									<th>Amount</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${orderData}">
									<tr>
										<td>${order.id}</td>
										<td>${order.order_date}</td>
										<td>$${order.total_amount}</td>
										<td><span class="status-badge ${order.status}">${order.status}</span></td>
										<td>
											<button class="action-btn view"
												onclick="openOrderModal('${order.id}','${order.order_date}','${order.total_amount}','${order.status}')">
												View</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>

			<!-- Order Details Modal -->
			<div id="orderModal" class="modal" style="display: none;">
				<div class="modal-content">
					<span class="close-btn" onclick="closeModal()">&times;</span>
					<h2>Order Details</h2>
					<p>
						<strong>ID:</strong> <span id="modalOrderId"></span>
					</p>
					<p>
						<strong>Date:</strong> <span id="modalOrderDate"></span>
					</p>
					<p>
						<strong>Amount:</strong> $<span id="modalTotalAmount"></span>
					</p>
					<p>
						<strong>Status:</strong> <span id="modalStatus"></span>
					</p>
				</div>
			</div>
			<script>
				function openOrderModal(id, date, amt, status) {
					document.getElementById('modalOrderId').innerText = id;
					document.getElementById('modalOrderDate').innerText = date;
					document.getElementById('modalTotalAmount').innerText = amt;
					document.getElementById('modalStatus').innerText = status;
					document.getElementById('orderModal').style.display = 'block';
				}
				function closeModal() {
					document.getElementById('orderModal').style.display = 'none';
				}
			</script>

			<!-- Top Selling Products & Weekly Sales Chart -->
			<section class="two-column-section">
				<!-- Top Selling Products -->
				<div class="column product-listings">
					<div class="section-header">
						<h2>Top Selling Products</h2>
						<button class="view-all-btn">View All</button>
					</div>
					<div class="product-list">
						<c:forEach var="drone" items="${topProducts}">
							<div class="product-item">
								<img src="${pageContext.request.contextPath}/${drone.imageUrl}"
									alt="${drone.name}" />
								<div class="product-details">
									<h4>${drone.name}</h4>
									<p>Sold: ${drone.quantity} units</p>
									<p>Price: $${drone.price}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- Weekly Sales Chart -->
				<div class="column weekly-sales">
					<div class="section-header">
						<h2>Weekly Sales</h2>
						<button class="view-all-btn">View Report</button>
					</div>
					<div class="chart-container">
						<div class="chart-y-axis">
							<c:forEach var="i" begin="0" end="6">
								<span>$${(maxWeeklySale/6)*(6-i)}</span>
							</c:forEach>
						</div>
						<div class="chart">
							<div class="chart-line">
								<c:set var="scale" value="${maxWeeklySale}" />
								<c:forEach var="entry" items="${weeklySales.entrySet()}">
									<div class="chart-point"
										style="--point-height: ${ (entry.value/scale)*100 }%;"
										title="$${entry.value}"></div>
								</c:forEach>
							</div>
						</div>
						<div class="chart-x-axis">
							<c:forEach var="entry" items="${weeklySales.entrySet()}">
								<span>${entry.key.dayOfWeek.name().substring(0,3)}</span>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>

		</main>
	</div>
</body>
</html>