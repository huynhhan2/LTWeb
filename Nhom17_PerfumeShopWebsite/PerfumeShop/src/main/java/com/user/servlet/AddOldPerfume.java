package com.user.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.PerfumeDAOImpl;
import com.DB.DBConnect;
import com.entity.PerfumeDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/add_old_perfume")
@MultipartConfig
public class AddOldPerfume extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price = req.getParameter("price");
			String categories="Newest Perfume";
			String status="Active";
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			String useremail = req.getParameter("user");
			
			PerfumeDtls b=new PerfumeDtls(bookName,author,price,categories,status,fileName,useremail);
			PerfumeDAOImpl dao=new PerfumeDAOImpl(DBConnect.getConn());
			
			boolean f=dao.addPerfumes(b);
			HttpSession session=req.getSession();
			if(f) {
				String path=getServletContext().getRealPath(""+"book");
				File file =new File(path);
				part.write(path+File.separator+fileName);
				session.setAttribute("succMsg", "Perfume Add Sucessfully");
				resp.sendRedirect("sell_perfume.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("sell_perfume.jsp");
			}
		
		}catch(Exception E) {
			E.printStackTrace();
			
		}
	}
}
