package com.DAO;

import java.util.List;

import com.entity.Perfume_Order;

public interface PerfumeOrderDAO {
	
	
	public boolean saveOrder(List<Perfume_Order> b);
	public List<Perfume_Order> getBook(String email);
	
	public List<Perfume_Order> getAllOrder();
}
