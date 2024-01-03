package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DB;

@WebServlet("/doctor_comment")
public class DoctorComment extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String comment = req.getParameter("comment");
		int appointmentId = Integer.parseInt(req.getParameter("appid"));
		int doctorId = Integer.parseInt(req.getParameter("docid"));
		
		AppointmentDao appDao = new AppointmentDao(DB.connect());
		
		boolean f = appDao.UpdateCommentStatus(appointmentId,doctorId,comment);
		HttpSession session = req.getSession();
		if(f==true)
		{
			session.setAttribute("commetSucMsg","Comment Updated");
			resp.sendRedirect("doctor/patient.jsp");
		}
		else
		{
			session.setAttribute("commetErrMsg","Somthing went wrong");
			resp.sendRedirect("doctor/patient.jsp");
		}
	}
	
	

}
