package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DB;
import com.entity.Doctor;

@WebServlet("/add_doctor")
public class AddDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialization = req.getParameter("specialization");
		String email = req.getParameter("email");
		String contact = req.getParameter("contact");
		String password = req.getParameter("password");
		
		Doctor doctor = new Doctor(name, dob, qualification, specialization, email, contact, password);
		
		DoctorDao docDao = new DoctorDao(DB.connect());
		
		boolean f = docDao.addDoctor(doctor);
		HttpSession session = req.getSession();
		if(f)
		{
			session.setAttribute("sucMsg", "Doctor Added Successfully");
			resp.sendRedirect("admin/doctor.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something Went Wrong");
			resp.sendRedirect("admin/doctor.jsp");
		}
		
	}
	
}
