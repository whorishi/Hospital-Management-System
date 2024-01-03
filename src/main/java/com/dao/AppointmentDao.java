package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment ap) {
		boolean f=false;
		
		try {
			String query = "insert into appointmentinfo (uid,name,gender,age,date,email,contact,disease,did,address,status) values (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getName());
			ps.setString(3, ap.getGender());
			ps.setInt(4, ap.getAge());
			ps.setString(5, ap.getDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getContact());
			ps.setString(8, ap.getDisease());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public ArrayList<Appointment> getAllAppointmentsByUserId(int uid){
		ArrayList<Appointment> listOfAppointments = new ArrayList<Appointment>();
		
		try {
			String query = "Select * from appointmentinfo where uid = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Appointment app = new Appointment();
				app.setAppointmentId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getInt(5));
				app.setDate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setContact(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				listOfAppointments.add(app);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listOfAppointments;
	}
	
	public ArrayList<Appointment> getAllAppointmentsByDoctorId(int did){
		ArrayList<Appointment> listOfAppointments = new ArrayList<Appointment>();
		
		try {
			String query = "Select * from appointmentinfo where did = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, did);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Appointment app = new Appointment();
				app.setAppointmentId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getInt(5));
				app.setDate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setContact(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
				listOfAppointments.add(app);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listOfAppointments;
	}
	
	public Appointment getAppointmentsByAppointmentId(int aid){
		Appointment app = new Appointment();
		
		try {
			String query = "Select * from appointmentinfo where aid = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, aid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				app.setAppointmentId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getInt(5));
				app.setDate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setContact(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return app;
	}

	public boolean UpdateCommentStatus(int appointmentId, int doctorId, String comment) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String query = "update appointmentinfo set status=? where aid=? and did=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,comment);
			ps.setInt(2, appointmentId);
			ps.setInt(3, doctorId);
			int i=ps.executeUpdate();
			if(i==1) f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
