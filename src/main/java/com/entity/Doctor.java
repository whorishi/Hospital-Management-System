package com.entity;


public class Doctor {
	
	private int id;
	private String name;
	private String dob;
	private String qualification;
	private String specialization;
	private String email;
	private String contact;
	private String password;
	
	public Doctor() {
		super();
	}
	
	public Doctor(String name, String dob, String qualification, String specialization, String email, String contact,
			String password) {
		super();
		this.name = name;
		this.dob = dob;
		this.qualification = qualification;
		this.specialization = specialization;
		this.email = email;
		this.contact = contact;
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	
}
