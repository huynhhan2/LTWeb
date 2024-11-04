package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.entity.User;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
@WebServlet("/edit_account")
public class EditUserServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phno = req.getParameter("phno");
			String password=req.getParameter("password");
			
			User b=new User();
			b.setId(id);
			b.setName(name);
			b.setEmail(email);
			b.setPhno(phno);
			b.setPassword(password);
			
			UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session= req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Profile Update Successfully");
				resp.sendRedirect("admin/all_account.jsp");
			}else {
				session.setAttribute("faileMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_account.jsp");
			}
			
		}catch(Exception E) {
			E.printStackTrace();
			
		}
	}
	
	
}
