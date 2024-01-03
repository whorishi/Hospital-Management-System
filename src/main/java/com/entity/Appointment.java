package com.entity;

public class Appointment {
	private int appointmentId;
	private int userId;
	private String name;
	private String gender;
	private int age;
	private String date;
	private String email;
	private String contact;
	private String disease;
	private int doctorId;
	private String address;
	private String status;
	
	//Constructors
	public Appointment(int appointmentId, int userId, String name, String gender, int age, String date, String email,
			String contact, String disease, int doctorId, String address, String status) {
		super();
		this.appointmentId = appointmentId;
		this.userId = userId;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.date = date;
		this.email = email;
		this.contact = contact;
		this.disease = disease;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}
	
	public Appointment(int userId, String name, String gender, int age, String date, String email,
			String contact, String disease, int doctorId, String address, String status) {
		super();
		this.userId = userId;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.date = date;
		this.email = email;
		this.contact = contact;
		this.disease = disease;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}
	
	public Appointment() {
		super();
	}
	
	
	
	//Getter-Setter Functions
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
