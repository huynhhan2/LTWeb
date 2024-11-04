package com.DAO;

import java.util.List;
import com.entity.Cart;

public interface CartDAO {
	public boolean addCart(Cart c);
	public List<Cart> getPerfumeByUser(int userId);
	public boolean deletePerfume(int bid, int uid, int cid);
	
	
}
