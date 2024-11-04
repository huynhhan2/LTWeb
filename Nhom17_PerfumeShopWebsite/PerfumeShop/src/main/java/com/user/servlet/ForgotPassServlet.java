package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotpass")
public class ForgotPassServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			
			HttpSession session=req.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			
			boolean f=dao.checkEmPn(email, phno);
			if(f) 
			{
				boolean f2 = dao.updatePassword(email, phno, password);
				if(f2) 
				{
					session.setAttribute("succMsg", "Updated password successfully");
					resp.sendRedirect("login.jsp");
				}else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("forgotpass.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Your Account Information is Incorrect");
				resp.sendRedirect("forgotpass.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
