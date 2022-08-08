package com.project.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String userName = req.getParameter("username");
		String password = req.getParameter("upassword");
		
		
		if(userName.equals("admin") && password.equals("root")) {
			
			HttpSession session = req.getSession();
			session.setAttribute("username", userName);
			resp.sendRedirect("database.jsp");
			
		}else {
			
			resp.sendRedirect("adminLogin.jsp");
			
		}
		
	}

}
