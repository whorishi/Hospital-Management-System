package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addDoctor(Doctor doctor) {
		boolean f = false;

		try {
			String query = "insert into doctorinfo (name,dob,qualification,email,contact,password,specialization) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, doctor.getName());
			ps.setString(2, doctor.getDob());
			ps.setString(3, doctor.getQualification());
			ps.setString(4, doctor.getEmail());
			ps.setString(5, doctor.getContact());
			ps.setString(6, doctor.getPassword());
			ps.setString(7, doctor.getSpecialization());

			int i = ps.executeUpdate();
			if (i == 1)
				f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public ArrayList<Doctor> getAllDoctors() {
		ArrayList<Doctor> listOfDoctor = new ArrayList<Doctor>();

		try {
			String query = "select * from doctorinfo";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Doctor d = new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setEmail(rs.getString(5));
				d.setContact(rs.getString(6));
				d.setPassword(rs.getString(7));
				d.setSpecialization(rs.getString(8));

				listOfDoctor.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listOfDoctor;
	}

	public void deleteDoctor(String email) {
		try {
			String query = "delete from doctorinfo where email = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			
			ps.executeUpdate();
			System.out.println("Delete");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateDoctor(int id,String name, String dob, String quali, String spec, String email, String contact, String password) {
		try {
			String query = "update doctorinfo set name=?,dob=?,qualification=?,specialization=?,email=?,contact=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, dob);
			ps.setString(3, quali);
			ps.setString(4, spec);
			ps.setString(5, email);
			ps.setString(6, contact);
			ps.setString(7, password);
			ps.setInt(8, id);
			
			ps.executeUpdate();
			System.out.println("Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Doctor getDoctorById(int id) {
		Doctor doc = null;
		try {
			String query = "select * from doctorinfo where id = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				doc = new Doctor();
				doc.setId(rs.getInt(1));
				doc.setName(rs.getString(2));
				doc.setDob(rs.getString(3));
				doc.setQualification(rs.getString(4));
				doc.setEmail(rs.getString(5));
				doc.setContact(rs.getString(6));
				doc.setPassword(rs.getString(7));
				doc.setSpecialization(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doc;
	}

	public Doctor login(String email,String password) {
		Doctor doc = null;
		try {
			String query = "select * from doctorinfo where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				doc= new Doctor();
				doc.setId(rs.getInt(1));
				doc.setName(rs.getString(2));
				doc.setDob(rs.getString(3));
				doc.setQualification(rs.getString(4));
				doc.setEmail(rs.getString(5));
				doc.setContact(rs.getString(6));
				doc.setPassword(rs.getString(7));
				doc.setSpecialization(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doc;
	}
}
