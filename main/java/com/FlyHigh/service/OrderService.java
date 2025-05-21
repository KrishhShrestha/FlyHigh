package com.FlyHigh.service;

import com.FlyHigh.config.DbConfig;
import com.FlyHigh.model.OrderModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OrderService {

    /**
     * Finds all orders for a given user email.
     * Each OrderModel aggregates total quantity of drones in that order.
     */
    public List<OrderModel> findByUserEmail(String email) {
        List<OrderModel> orders = new ArrayList<>();

        String sql = "" +
            "SELECT ot.Order_id, ot.Order_date, ot.Total_amount, ot.status, " +
            "       SUM(udo.quantity) AS total_qty " +
            "  FROM user u " +
            "  JOIN user_drone_order udo ON u.User_id = udo.User_id " +
            "  JOIN order_table ot        ON udo.Order_id = ot.Order_id " +
            " WHERE u.User_email = ? " +
            " GROUP BY ot.Order_id, ot.Order_date, ot.Total_amount, ot.status " +
            " ORDER BY ot.Order_date DESC";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderModel om = new OrderModel();
                    om.setId(rs.getInt("Order_id"));
                    om.setOrder_date(rs.getDate("Order_date").toLocalDate());
                    om.setTotal_amount(rs.getFloat("Total_amount"));
                    om.setStatus(rs.getString("status"));
                    om.setOrder_quantity(rs.getInt("total_qty"));
                    orders.add(om);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();  // replace with your logging framework
        }
        return orders;
    }
}