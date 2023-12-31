package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DoctorDao;
import com.db.DB;

@WebServlet("/delete_doctor")
public class DeleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		
		System.out.println(email);
		
		DoctorDao docDao = new DoctorDao(DB.connect());
		docDao.deleteDoctor(email);
		resp.sendRedirect("admin/doctor.jsp");
		
	}

}
