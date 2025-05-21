package com.FlyHigh.service.admin;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.DroneModel;
import com.FlyHigh.model.OrderModel;

import java.sql.*;
import java.time.LocalDate;
import java.util.*;

/**
 * Service for fetching dashboard metrics and orders.
 */
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
        try (PreparedStatement ps = dbConn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

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
        try (PreparedStatement ps = dbConn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
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
        try (PreparedStatement ps = dbConn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
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
        try (PreparedStatement ps = dbConn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /** 5) Monthly revenue */
    public double getMonthlyRevenue() {
        String sql = 
          "SELECT COALESCE(SUM(Total_amount),0) FROM order_table " +
          "WHERE MONTH(Order_date)=MONTH(CURDATE()) AND YEAR(Order_date)=YEAR(CURDATE())";
        try (PreparedStatement ps = dbConn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            rs.next();
            return rs.getDouble(1);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /** 6) Order status counts */
    public Map<String,Integer> getOrderStatusCounts() {
        String sql = "SELECT status, COUNT(*) FROM order_table GROUP BY status";
        Map<String,Integer> map = new HashMap<>();
        try (PreparedStatement ps = dbConn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
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
        String sql =
            "SELECT d.Drone_id, d.Drone_name, d.Drone_price, d.Drone_image, SUM(udo.quantity) AS sold_qty " +
            "FROM user_drone_order udo " +
            " JOIN drone d ON udo.Drone_id=d.Drone_id " +
            "GROUP BY d.Drone_id, d.Drone_name, d.Drone_price, d.Drone_image " +
            "ORDER BY sold_qty DESC LIMIT ?";
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
    public Map<LocalDate, Double> getWeeklySales() {
        String sql =
          "SELECT Order_date, COALESCE(SUM(Total_amount),0) AS daily_sum " +
          "FROM order_table " +
          "WHERE Order_date >= DATE_SUB(CURDATE(), INTERVAL 6 DAY) " +
          "GROUP BY Order_date ORDER BY Order_date";
        Map<LocalDate, Double> temp = new HashMap<>();
        try (PreparedStatement ps = dbConn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                temp.put(rs.getDate("Order_date").toLocalDate(),
                         rs.getDouble("daily_sum"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // fill any missing days
        Map<LocalDate, Double> full = new LinkedHashMap<>();
        LocalDate start = LocalDate.now().minusDays(6);
        for (int i = 0; i < 7; i++) {
            LocalDate d = start.plusDays(i);
            full.put(d, temp.getOrDefault(d, 0.0));
        }
        return full;
    }
}