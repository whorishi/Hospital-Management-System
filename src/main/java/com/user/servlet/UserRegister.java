package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DB;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User u = new User(name,email,password);
		
		UserDao userdao = new UserDao(DB.connect());
		
		boolean f = userdao.UserRegister(u);
		HttpSession session = req.getSession();
		if(f==true) {
			System.out.println("Data Inserted Successfully");
			session.setAttribute("sucMsg", "Registration Done");
			resp.sendRedirect("user_register.jsp");
			
		} else {
			session.setAttribute("failMsg", "Registration Fail");
			resp.sendRedirect("user_register.jsp");
			System.out.println("Some Error Occured");
		}
	}
	

}
