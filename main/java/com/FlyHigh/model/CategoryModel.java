package com.FlyHigh.model;

public class CategoryModel {
	private int id;
	private String name;
	private String description;
	
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
	
	public CategoryModel(int id, String name, String description) {
		this.id = id;
		this.name = name;
		this.description = description;
	}
	
	public CategoryModel(String name, String description) {
		this.name = name;
		this.description = description;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}