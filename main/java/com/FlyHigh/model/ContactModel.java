package com.FlyHigh.model;

public class ContactModel {
	private String firstname;
	private String lastname;
	private String email;
	private String message;
	
	


    public ContactModel(String firstname, String lastname, String email, String message) {
    	this.firstname = firstname;
    	this.lastname = lastname;
    	this.email = email;
    	this.message = message;
    	
    }

    public ContactModel() {
    	
    }


	public String getFirstname() {
		return firstname;
	}




	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}




	public String getLastname() {
		return lastname;
	}




	public void setLastname(String lastname) {
		this.lastname = lastname;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getMessage() {
		return message;
	}




	public void setMessage(String message) {
		this.message = message;
	}
    
}
