<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/dashboard.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<style>
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: none;
	align-items: center;
	justify-content: center;
}

.modal-content {
	background: #fff;
	padding: 1.5rem;
	border-radius: 6px;
	width: 90%;
	max-width: 500px;
	position: relative;
}

.close-btn {
	position: absolute;
	top: 0.5rem;
	right: 1rem;
	cursor: pointer;
	font-size: 1.2rem;
}
</style>
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
									<c:when test="${not empty statusCounts['canceled']}">${statusCounts['canceled']}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
				</div>


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
										<td><span class="status-badge ${order.status}"> <c:choose>
													<c:when test="${order.status=='pending'}">Pending</c:when>
													<c:when test="${order.status=='processing'}">Processing</c:when>
													<c:when test="${order.status=='success'}">Delivered</c:when>
													<c:when test="${order.status=='canceled'}">Canceled</c:when>
												</c:choose>
										</span></td>
										<td>
											<button class="action-btn view"
												onclick="openOrderModal(${order.id})">View</button>
											<form method="post" action="dashboard"
												style="display: inline">
												<input type="hidden" name="orderId" value="${order.id}" />
												<select name="newStatus" required>
													<option value="pending"
														${order.status=='pending' ? 'selected':''}>pending</option>
													<option value="processing"
														${order.status=='processing' ? 'selected':''}>processing</option>
													<option value="success"
														${order.status=='success' ? 'selected':''}>success</option>
													<option value="canceled"
														${order.status=='canceled' ? 'selected':''}>canceled</option>
												</select>
												<button type="submit" class="action-btn update">Update</button>
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>

			<!-- Hidden item lists for each order -->
			<div style="display: hidden !important; height: 0px !important">
				<c:forEach var="itm" items="${orderItems}">
					<c:if test="${itm.orderId != null}">
						<div id="items-${itm.orderId}" style="display: hidden !important;"
							class="order-items">
							<ul>
								<strong>Customer:</strong> ${orderItems[0].userName}
								<br />
								<c:forEach var="sub" items="${orderItems}">
									<c:if test="${sub.orderId == itm.orderId}">
										<li><strong>Product:</strong> ${sub.droneName}<br /> <strong>Qty:</strong>
											${sub.quantity}<br /></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<!-- Modal -->
			<div id="orderModal" class="modal">
				<div class="modal-content">
					<span class="close-btn" onclick="closeModal()">&times;</span>
					<h2>
						Order #<span id="modalOrderId"></span> Details
					</h2>
					<div id="modalItemsContainer"></div>
				</div>
			</div>

			<script>
        function openOrderModal(orderId) {
        	const modal = document.getElementById('orderModal');
        	  modal.classList.add('show');
          document.getElementById('modalOrderId').innerText = orderId;
          const hidden = document.getElementById('items-' + orderId);
          document.getElementById('modalItemsContainer').innerHTML = hidden
            ? hidden.innerHTML
            : '<p>No items found.</p>';
          document.getElementById('orderModal').style.display = 'flex';
        }
        function closeModal() {
          document.getElementById('orderModal').style.display = 'none';
          const modal = document.getElementById('orderModal');
          modal.classList.remove('show');
        }
      </script>

			<!-- Top Selling Products & Weekly Sales Chart -->
			<section class="two-column-section">
				<!-- Top Selling Products -->
				<div class="column product-listings">
					<div class="section-header">
						<h2>Top Selling Products</h2>
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
					</div>
				</div>
			</section>
		</main>
	</div>
</body>
</html>