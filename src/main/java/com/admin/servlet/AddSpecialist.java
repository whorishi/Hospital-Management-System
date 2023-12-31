package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DB;

@WebServlet("/add_specialist")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("spec_name");
		
		SpecialistDao speDao = new SpecialistDao(DB.connect());
		boolean f = speDao.addSpecialist(name);
		
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("sucMsg", "Specialist Added Successfully");
			resp.sendRedirect("admin/index.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Specialist Already Exist");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}
