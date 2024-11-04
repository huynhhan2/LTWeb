package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.PerfumeDAOImpl;
import com.DB.DBConnect;
import com.entity.PerfumeDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@WebServlet("/add_Perfumes")
@MultipartConfig
public class PerfumesAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price = req.getParameter("price");
			String categories=req.getParameter("categories");
			String status=req.getParameter("status");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			PerfumeDtls b=new PerfumeDtls(bookName,author,price,categories,status,fileName,"admin");
			PerfumeDAOImpl dao=new PerfumeDAOImpl(DBConnect.getConn());
			
			boolean f=dao.addPerfumes(b);
			HttpSession session=req.getSession();
			if(f) {
				String path=getServletContext().getRealPath(""+"perfume");
				File file =new File(path);
				part.write(path+File.separator+fileName);
				session.setAttribute("succMsg", "Perfume Add Sucessfully");
				resp.sendRedirect("admin/add_perfumes.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/add_perfumes.jsp");
			}
		
		}catch(Exception E) {
			E.printStackTrace();
			
		}
	}
	
}
