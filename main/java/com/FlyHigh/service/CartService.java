package com.FlyHigh.service;

import java.sql.*;
import java.time.LocalDate;
import java.util.Map;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.DroneModel;
import com.FlyHigh.service.admin.DroneService;

public class CartService {

    private Connection dbConn;

    public CartService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
        }
    }

    public String handleCheckout(String email, Map<Integer, Integer> cart) {
        if (dbConn == null) return "Database connection error.";

        try {
            int userId = getIdByEmail(email);
            if (userId <= 0) return "Invalid user email.";

            if (!isStockAvailable(cart)) {
                return "Not enough stock for one or more drones.";
            }

            double totalAmount = calculateTotalAmount(cart);
            dbConn.setAutoCommit(false);

            // Insert order
            String orderSql = "INSERT INTO order_table (Order_date, Total_amount, status) VALUES (?, ?, ?)";
            int orderId;

            try (PreparedStatement orderStmt = dbConn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
                orderStmt.setDate(1, Date.valueOf(LocalDate.now()));
                orderStmt.setDouble(2, totalAmount);
                orderStmt.setString(3, "pending");
                orderStmt.executeUpdate();

                try (ResultSet generatedKeys = orderStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        orderId = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("No order ID returned.");
                    }
                }
            }

            // Insert into user_drone_order
            String userOrderSql = "INSERT INTO user_drone_order (User_id, Drone_id, Order_id, quantity) VALUES (?, ?, ?, ?)";
            try (PreparedStatement userStmt = dbConn.prepareStatement(userOrderSql)) {
                for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                    userStmt.setInt(1, userId);
                    userStmt.setInt(2, entry.getKey());
                    userStmt.setInt(3, orderId);
                    userStmt.setInt(4, entry.getValue());
                    userStmt.addBatch();
                }
                userStmt.executeBatch();
            }

            // Update stock
            String stockUpdateSql = "UPDATE drone SET Drone_quantity = Drone_quantity - ? WHERE Drone_id = ?";
            try (PreparedStatement stockStmt = dbConn.prepareStatement(stockUpdateSql)) {
                for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                    stockStmt.setInt(1, entry.getValue());
                    stockStmt.setInt(2, entry.getKey());
                    stockStmt.addBatch();
                }
                stockStmt.executeBatch();
            }

            dbConn.commit();
            dbConn.setAutoCommit(true);
            return null;

        } catch (SQLException e) {
            try {
                dbConn.rollback();
            } catch (SQLException ex) {
                System.err.println("Rollback failed: " + ex.getMessage());
            }
            return "Checkout error: " + e.getMessage();
        }
    }

    public int getIdByEmail(String email) {
        String query = "SELECT User_id FROM user WHERE User_email = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return rs.getInt("User_id");
            }
        } catch (SQLException e) {
            System.err.println("Error fetching user ID: " + e.getMessage());
        }
        return -1;
    }

    private boolean isStockAvailable(Map<Integer, Integer> cart) {
        DroneService droneService = new DroneService();

        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            int droneId = entry.getKey();
            int requestedQty = entry.getValue();

            DroneModel drone = droneService.getDroneById(droneId);
            if (drone == null || requestedQty > drone.getQuantity()) {
                return false;
            }
        }

        return true;
    }

    private double calculateTotalAmount(Map<Integer, Integer> cart) {
        DroneService droneService = new DroneService();
        double total = 0.0;

        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            DroneModel drone = droneService.getDroneById(entry.getKey());
            if (drone != null) {
                total += drone.getPrice() * entry.getValue();
            }
        }

        return total;
    }
}
