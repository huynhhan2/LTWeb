package com.user.servlet;

import java.io.IOException;

import com.DAO.PerfumeDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldPerfume extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			
			
			PerfumeDAOImpl dao = new PerfumeDAOImpl(DBConnect.getConn());
			
			boolean f=dao.oldPerfumeDelete(em, "Old",id);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Old Book Delete Successfully");
				resp.sendRedirect("old_perfume.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong o server");
				resp.sendRedirect("old_perfume.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
