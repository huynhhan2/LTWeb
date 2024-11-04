	package com.admin.servlet;

import java.io.IOException;

import com.DAO.PerfumeDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class PerfumeDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			PerfumeDAOImpl dao= new PerfumeDAOImpl(DBConnect.getConn());
			boolean f=dao.deletePerfumes(id);
			
			HttpSession session= req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Perfume Delete Successfully");
				resp.sendRedirect("admin/all_perfumes.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_perfumes.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
}
