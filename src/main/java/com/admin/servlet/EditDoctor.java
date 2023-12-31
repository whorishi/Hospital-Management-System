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

@WebServlet("/edit_doctor")
public class EditDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idparam = req.getParameter("id");
		int id = Integer.parseInt(idparam);
		System.out.println(id);
		String name = req.getParameter("name");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialization = req.getParameter("specialization");
		String email = req.getParameter("email");
		String contact = req.getParameter("contact");
		String password = req.getParameter("password");
		
		DoctorDao docDao = new DoctorDao(DB.connect());
		docDao.updateDoctor(id, name, dob, qualification, specialization, email, contact, password);
		HttpSession session = req.getSession();
		session.setAttribute("UpdateSucMsg", "Details Updated Successfully");
		resp.sendRedirect("admin/doctor.jsp");
	}
	

}
