package com.FlyHigh.model;

public class CategoryModel {
	private int id;
	private String name;
	
	public CategoryModel() {
		// TODO Auto-generated constructor stub
	}
	
	public CategoryModel(int id) {
		this.id= id;
	}

	public CategoryModel(int id, String name) {
		this.name = name;
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}