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

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int nid = Integer.parseInt(req.getParameter("nid"));
		HttpSession session = req.getSession();
		try {
			RegDAO dao = new RegDAO(Connectivity.create());
			boolean f=dao.deleteUser(nid);
			if(f) {
				session.setAttribute("success", "Deleted Successfully");
				resp.sendRedirect("database.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
