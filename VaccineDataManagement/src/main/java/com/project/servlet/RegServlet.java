package com.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.entity.Bean;
import com.project.conn.Connectivity;
import com.project.dao.RegDAO;

@WebServlet("/register")
public class RegServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String info = null;
		int nid = Integer.parseInt(req.getParameter("nid"));
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String dob = req.getParameter("dob");
		int contact = Integer.parseInt(req.getParameter("contact"));
		String address = req.getParameter("address");
		String center = req.getParameter("center");
		
		Bean bn = new Bean(nid,name,gender,dob,contact,address,center);
		HttpSession session = req.getSession();
		try {
			RegDAO dao = new RegDAO(Connectivity.create());
			info = dao.insertData(bn);
			if(info != null) {
				
				session.setAttribute("success", "Registered Successfully");
				resp.sendRedirect("Register.jsp");
				
			}else {
				session.setAttribute("error", "Something wrong on server.....try again");
				resp.sendRedirect("Register.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

}
