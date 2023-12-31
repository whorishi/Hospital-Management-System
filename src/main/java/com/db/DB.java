package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	public static Connection conn;
	
	public static Connection connect() {
		
		final String url = "jdbc:mysql://localhost:3306/cityhospital";
		final String username = "root";
		final String password = "Rishi@07102002";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,username,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
}
