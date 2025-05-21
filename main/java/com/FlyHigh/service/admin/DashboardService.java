package com.FlyHigh.service.admin;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.DroneModel;
import com.FlyHigh.model.OrderModel;

import java.sql.*;
import java.util.*;

public class DashboardService {

	private Connection dbConn;

	public DashboardService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			throw new RuntimeException("Database connection error", ex);
		}
	}

	/** 1) All orders */
	public List<OrderModel> getAllOrders() {
		String sql = "SELECT Order_id, Order_date, Total_amount, status FROM order_table ORDER BY Order_date DESC";
		try (PreparedStatement ps = dbConn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

			List<OrderModel> list = new ArrayList<>();
			while (rs.next()) {
				OrderModel o = new OrderModel();
				o.setId(rs.getInt("Order_id"));
				o.setOrder_quantity(0);
				o.setOrder_date(rs.getDate("Order_date").toLocalDate());
				o.setTotal_amount(rs.getFloat("Total_amount"));
				o.setStatus(rs.getString("status"));
				list.add(o);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	/** 2) Today's sales total */
	public double getTodaysSales() {
		String sql = "SELECT COALESCE(SUM(Total_amount),0) FROM order_table WHERE Order_date = CURDATE()";
		try (PreparedStatement ps = dbConn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			rs.next();
			return rs.getDouble(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/** 3) Total customers */
	public int getTotalCustomers() {
		String sql = "SELECT COUNT(*) FROM user";
		try (PreparedStatement ps = dbConn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/** 4) Total products */
	public int getTotalProducts() {
		String sql = "SELECT COUNT(*) FROM drone";
		try (PreparedStatement ps = dbConn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/** 5) Monthly revenue */
	public double getMonthlyRevenue() {
		String sql = "SELECT COALESCE(SUM(Total_amount),0) FROM order_table "
				+ "WHERE MONTH(Order_date)=MONTH(CURDATE()) AND YEAR(Order_date)=YEAR(CURDATE())";
		try (PreparedStatement ps = dbConn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			rs.next();
			return rs.getDouble(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	/** 6) Order status counts */
	public Map<String, Integer> getOrderStatusCounts() {
		String sql = "SELECT status, COUNT(*) FROM order_table GROUP BY status";
		Map<String, Integer> map = new HashMap<>();
		try (PreparedStatement ps = dbConn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				map.put(rs.getString(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	/** 7) Top selling products (by sum of quantity in user_drone_order) */
	public List<DroneModel> getTopSellingProducts(int limit) {
		String sql = "SELECT d.Drone_id, d.Drone_name, d.Drone_price, d.Drone_image, "
				+ "SUM(udo.quantity) AS sold_qty " + "FROM user_drone_order udo "
				+ " JOIN drone d ON udo.Drone_id=d.Drone_id "
				+ "GROUP BY d.Drone_id, d.Drone_name, d.Drone_price, d.Drone_image " + "ORDER BY sold_qty DESC LIMIT ?";
		List<DroneModel> list = new ArrayList<>();
		try (PreparedStatement ps = dbConn.prepareStatement(sql)) {
			ps.setInt(1, limit);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					DroneModel dm = new DroneModel();
					dm.setId(rs.getInt("Drone_id"));
					dm.setName(rs.getString("Drone_name"));
					dm.setPrice(rs.getFloat("Drone_price"));
					dm.setImageUrl(rs.getString("Drone_image"));
					dm.setQuantity(rs.getInt("sold_qty"));
					list.add(dm);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/** 8) Weekly sales for last 7 days */

	public List<Map<String, Object>> getAllOrderItemsWithInfo() {
		String sql = """
				SELECT
				  udo.Order_id,
				  u.user_name,
				  d.Drone_name,
				  udo.quantity,
				  o.status,
				  o.Order_date,
				  o.Total_amount
				FROM user_drone_order udo
				JOIN user u  ON u.User_id    = udo.User_id
				JOIN drone    d  ON d.Drone_id = udo.Drone_id
				JOIN order_table o ON o.Order_id = udo.Order_id
				ORDER BY o.Order_date DESC
				""";
		List<Map<String, Object>> list = new ArrayList<>();
		try (PreparedStatement ps = dbConn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("orderId", rs.getInt("Order_id"));
				m.put("userName", rs.getString("user_name"));
				m.put("droneName", rs.getString("Drone_name"));
				m.put("quantity", rs.getInt("quantity"));
				m.put("status", rs.getString("status"));
				m.put("orderDate", rs.getDate("Order_date").toLocalDate());
				m.put("totalAmount", rs.getDouble("Total_amount"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/** 10) Update an order's status */
	public boolean updateOrderStatus(int orderId, String newStatus) {
		String sql = "UPDATE order_table SET status = ? WHERE Order_id = ?";
		try (PreparedStatement ps = dbConn.prepareStatement(sql)) {
			ps.setString(1, newStatus);
			ps.setInt(2, orderId);
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}