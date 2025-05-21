package com.FlyHigh.model;

import java.time.LocalDate;

public class OrderModel {
    private int id; 
    private int Order_quantity;
    private LocalDate Order_date;
    private float Total_amount;
    private String Status;
    
    public OrderModel() {}
    
    public OrderModel(int id, int Order_quantity, LocalDate Order_date, float Total_amount,
    		String Status) {
		this.id = id;
		this.Order_quantity = Order_quantity;
		this.Order_date = Order_date;
		this.Total_amount = Total_amount;
		this.Status = Status;
    }
    
    public OrderModel(LocalDate Order_date, float Total_amount) {
		
		this.Order_date = Order_date;
		this.Total_amount = Total_amount;
    }
    
    public OrderModel(String Status) {
		this.Status = Status;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrder_quantity() {
		return Order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		Order_quantity = order_quantity;
	}

	public LocalDate getOrder_date() {
		return Order_date;
	}

	public void setOrder_date(LocalDate order_date) {
		Order_date = order_date;
	}

	public float getTotal_amount() {
		return Total_amount;
	}

	public void setTotal_amount(float total_amount) {
		Total_amount = total_amount;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}
}
    
    
    
    
    
		
