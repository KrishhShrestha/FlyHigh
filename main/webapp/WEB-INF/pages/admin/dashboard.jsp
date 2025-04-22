<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/dashboard.css" />
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Main Content -->
        <main class="main-content">
            <div class="dashboard-title">
                <h1>Dashboard Overview</h1>
                <p>Welcome back! Here's what's happening with your drone store today.</p>
            </div>

            <!-- Sales Summary Cards -->
            <section class="sales-summary">
                <div class="summary-card teal">
                    <div class="card-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    <div class="card-content">
                        <h3>Today's Sales</h3>
                        <p class="amount">$2,456.78</p>
                        <p class="trend positive">+15% from yesterday</p>
                    </div>
                </div>
                
                <div class="summary-card orange">
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Customers</h3>
                        <p class="amount">24</p>
  
                    </div>
                </div>
                
                <div class="summary-card blue">
                    <div class="card-icon">
                        <i class="fas fa-box"></i>
                    </div>
                    <div class="card-content">
                        <h3>Total Products</h3>
                        <p class="amount">156</p>
                        <p class="trend neutral">No change</p>
                    </div>
                </div>
                
                <div class="summary-card green">
                    <div class="card-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="card-content">
                        <h3>Monthly Revenue</h3>
                        <p class="amount">$45,892.34</p>
                        <p class="trend positive">+22% from last month</p>
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
                            <p class="status-count">42</p>
                        </div>
                    </div>
                    
                    <div class="status-card">
                        <div class="status-icon processing">
                            <i class="fas fa-cog"></i>
                        </div>
                        <div class="status-content">
                            <h3>Orders Processing</h3>
                            <p class="status-count">28</p>
                        </div>
                    </div>
                    
                    <div class="status-card">
                        <div class="status-icon delivered">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="status-content">
                            <h3>Orders Delivered</h3>
                            <p class="status-count">156</p>
                        </div>
                    </div>
                    
                    <div class="status-card">
                        <div class="status-icon canceled">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <div class="status-content">
                            <h3>Orders Canceled</h3>
                            <p class="status-count">8</p>
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
                                    <th>Customer</th>
                                    <th>Product</th>
                                    <th>Date</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#ORD-5642</td>
                                    <td>John Smith</td>
                                    <td>DJI Mini 3 Pro</td>
                                    <td>Apr 22, 2025</td>
                                    <td>$759.00</td>
                                    <td><span class="status-badge processing">Processing</span></td>
                                    <td class="actions">
                                        <button class="action-btn view"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn edit"><i class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#ORD-5641</td>
                                    <td>Sarah Johnson</td>
                                    <td>Autel EVO II Pro</td>
                                    <td>Apr 22, 2025</td>
                                    <td>$1,495.00</td>
                                    <td><span class="status-badge delivered">Delivered</span></td>
                                    <td class="actions">
                                        <button class="action-btn view"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn edit"><i class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#ORD-5640</td>
                                    <td>Michael Brown</td>
                                    <td>Skydio 2+</td>
                                    <td>Apr 21, 2025</td>
                                    <td>$999.00</td>
                                    <td><span class="status-badge pending">Pending</span></td>
                                    <td class="actions">
                                        <button class="action-btn view"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn edit"><i class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#ORD-5639</td>
                                    <td>Emily Davis</td>
                                    <td>DJI Mavic 3</td>
                                    <td>Apr 21, 2025</td>
                                    <td>$2,049.00</td>
                                    <td><span class="status-badge canceled">Canceled</span></td>
                                    <td class="actions">
                                        <button class="action-btn view"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn edit"><i class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#ORD-5638</td>
                                    <td>Robert Wilson</td>
                                    <td>Autel Nano+</td>
                                    <td>Apr 20, 2025</td>
                                    <td>$659.00</td>
                                    <td><span class="status-badge delivered">Delivered</span></td>
                                    <td class="actions">
                                        <button class="action-btn view"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn edit"><i class="fas fa-edit"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- Two Column Layout for Products and Weekly Sales Chart -->
            <section class="two-column-section">
                <!-- Product Listings -->
                <div class="column product-listings">
                    <div class="section-header">
                        <h2>Top Selling Products</h2>
                        <button class="view-all-btn">View All</button>
                    </div>
                    <div class="product-list">
                        <div class="product-item">
                            <div class="product-image">
                                <div class="placeholder-image">
                                    <i class="fas fa-drone-alt"></i>
                                </div>
                            </div>
                            <div class="product-details">
                                <h4>DJI Mini 3 Pro</h4>
                                <p class="product-category">Consumer Drones</p>
                                <div class="product-stats">
                                    <span class="stock">In Stock: 24</span>
                                    <span class="price">$759.00</span>
                                </div>
                                <p class="products-sold">Total Sold: 128 units</p>
                            </div>
                        </div>
                        
                        <div class="product-item">
                            <div class="product-image">
                                <div class="placeholder-image">
                                    <i class="fas fa-drone-alt"></i>
                                </div>
                            </div>
                            <div class="product-details">
                                <h4>DJI Mavic 3</h4>
                                <p class="product-category">Professional Drones</p>
                                <div class="product-stats">
                                    <span class="stock">In Stock: 12</span>
                                    <span class="price">$2,049.00</span>
                                </div>
                                <p class="products-sold">Total Sold: 86 units</p>
                            </div>
                        </div>
                        
                        <div class="product-item">
                            <div class="product-image">
                                <div class="placeholder-image">
                                    <i class="fas fa-drone-alt"></i>
                                </div>
                            </div>
                            <div class="product-details">
                                <h4>Autel EVO II Pro</h4>
                                <p class="product-category">Professional Drones</p>
                                <div class="product-stats">
                                    <span class="stock">In Stock: 8</span>
                                    <span class="price">$1,495.00</span>
                                </div>
                                <p class="products-sold">Total Sold: 64 units</p>
                            </div>
                        </div>
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
                            <span>$3000</span>
                            <span>$2500</span>
                            <span>$2000</span>
                            <span>$1500</span>
                            <span>$1000</span>
                            <span>$500</span>
                            <span>$0</span>
                        </div>
                        <div class="chart">
                            <div class="chart-line">
                                <div class="chart-point" style="--point-height: 60%;" data-value="$1800"></div>
                                <div class="chart-point" style="--point-height: 75%;" data-value="$2250"></div>
                                <div class="chart-point" style="--point-height: 90%;" data-value="$2700"></div>
                                <div class="chart-point" style="--point-height: 70%;" data-value="$2100"></div>
                                <div class="chart-point" style="--point-height: 80%;" data-value="$2400"></div>
                                <div class="chart-point" style="--point-height: 50%;" data-value="$1500"></div>
                                <div class="chart-point" style="--point-height: 65%;" data-value="$1950"></div>
                            </div>
                        </div>
                        <div class="chart-x-axis">
                            <span>Mon</span>
                            <span>Tue</span>
                            <span>Wed</span>
                            <span>Thu</span>
                            <span>Fri</span>
                            <span>Sat</span>
                            <span>Sun</span>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>
</html>