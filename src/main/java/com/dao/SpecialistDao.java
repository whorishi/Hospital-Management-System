package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SpecialistDao {
	private Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(String name) {
		boolean f=false;
		try {
			String query = "insert into specialist (spec_name) values (?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			
			int i = ps.executeUpdate();
			if(i==1) f=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public ArrayList<String> getAllSpecialization() {
		ArrayList<String> listOfSpec = new ArrayList<String>();
		try {
			String query = "select spec_name from specialist";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				String spec = rs.getString(1);
				listOfSpec.add(spec);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOfSpec;
	}
	
}
