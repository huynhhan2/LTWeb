package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.PerfumeDAOImpl;
import com.DB.DBConnect;
import com.entity.PerfumeDtls;
@WebServlet("/editPerfumes")
public class EditPerfumesServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price = req.getParameter("price");
			String status=req.getParameter("status");
			
			PerfumeDtls b =new PerfumeDtls();
			b=new PerfumeDtls();
			b.setperfumeID(id);
			b.setperfumename(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			PerfumeDAOImpl dao= new PerfumeDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditPerfumes(b);
			
			HttpSession session= req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Perfume Update Successfully");
				resp.sendRedirect("admin/all_perfumes.jsp");
			}else {
				session.setAttribute("faileMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_perfumes.jsp");
			}
			
		}catch(Exception E) {
			E.printStackTrace();
			
		}
	}
	
	
}
