package com.FlyHigh.model;

import java.time.LocalDate;

public class UserModel {
    private int id;
    private String firstname;
    private String lastname;
    private String phone;
    private String gender;
    private String dob;
    private String email;
    private String address;
    private String password;
    private String confirmpassword;
    private String role;

    // 1. Empty constructor
    public UserModel() {
    }

    // 2. Constructor with all variables
    public UserModel(int id, String firstname, String lastname, String phone, String gender,
                       String dob, String email,String address, String password, String confirmpassword, String role) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.gender = gender;
        this.dob = dob;
        this.email = email;
        this.address = address;
        this.password = password;
        this.confirmpassword = confirmpassword;
        this.role = role;
    }

    // 3. Constructor with all variables except id
    public UserModel(String firstname, String lastname, String phone, String gender,
            String dob, String email,String address, String password, String confirmpassword, String role) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.phone = phone;
		this.gender = gender;
		this.dob = dob;
		this.email = email;
		this.address = address;
		this.password = password;
		this.confirmpassword = confirmpassword;
		this.role = role;
    }


    // 4. Constructor with all variables except id and role
    public UserModel( String firstname, String lastname, String phone, String gender,
            String dob, String email,String address, String password, String confirmpassword) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.phone = phone;
		this.gender = gender;
		this.dob = dob;
		this.email = email;
		this.address = address;
		this.password = password;
		this.confirmpassword = confirmpassword;
    }
    
    // 5. Constructor with email and pass
    public UserModel( String email, String password) {
		this.email = email;
		this.password = password;
//		this.role = "admin";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	

}