package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DB;
import com.entity.Appointment;

@WebServlet("/user_appointment")
public class UserAppointment extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid = Integer.parseInt(req.getParameter("uid"));
		
		String name = req.getParameter("name");
		
		String gender = req.getParameter("gender");
		
		String ageparam = req.getParameter("age");
		
		String appointmentDate = req.getParameter("appointment_date");
		
		String email = req.getParameter("email");
		
		String contact = req.getParameter("contact");
		
		String disease = req.getParameter("disease");
		
		int did = Integer.parseInt(req.getParameter("did"));
		
		String address = req.getParameter("address");
		
		String status = "pending";
		
		int age = Integer.parseInt(ageparam);
		Appointment ap = new Appointment(uid, name, gender, age, appointmentDate, email, contact, disease, did, address, status);
		AppointmentDao appDao = new AppointmentDao(DB.connect());
		boolean f = appDao.addAppointment(ap);
		
		HttpSession session = req.getSession();
		if(f==true)
		{
			
			session.setAttribute("bookedMsg", "Appointment Requested, Waiting For Approval");
			resp.sendRedirect("user_appointment.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "something went wrong");
			resp.sendRedirect("user_appointment.jsp");
		}
	}

}
