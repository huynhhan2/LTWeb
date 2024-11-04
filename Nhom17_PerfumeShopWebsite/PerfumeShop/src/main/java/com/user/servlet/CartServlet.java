package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.PerfumeDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.PerfumeDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			String source = req.getParameter("source");
			PerfumeDAOImpl dao=new PerfumeDAOImpl(DBConnect.getConn());
			PerfumeDtls b=dao.getPerfumeById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setperfumeName(b.getperfumename());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f) 
			{
				
				session.setAttribute("addCart", "Perfume Added to cart");
				//resp.sendRedirect("all_new_perfume.jsp");
				
				if ("jsp0".equals(source)) {
					resp.sendRedirect("all_recent_perfume.jsp");
		        } else if ("jsp1".equals(source)) {
		        	resp.sendRedirect("all_new_perfume.jsp");
		        } else if ("jsp2".equals(source)) {
		        	resp.sendRedirect("all_old_perfume.jsp");
		        }  else {
		        	resp.sendRedirect("all_recent_perfume.jsp");
		        }
				
			}else {
				
				session.setAttribute("failed", "Something Wrong on server");
				//resp.sendRedirect("all_new_perfume.jsp");
				if ("jsp0".equals(source)) {
					resp.sendRedirect("all_recent_perfume.jsp");
		        } else if ("jsp1".equals(source)) {
		        	resp.sendRedirect("all_new_perfume.jsp");
		        } else if ("jsp2".equals(source)) {
		        	resp.sendRedirect("all_old_perfume.jsp");
		        } else {
		        	resp.sendRedirect("all_recent_perfume.jsp");
		        }
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
