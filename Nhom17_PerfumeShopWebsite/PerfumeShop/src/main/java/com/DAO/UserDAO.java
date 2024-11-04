package com.DAO;

import java.util.List;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);
	public User login(String email,String password);
	
	public boolean checkPassword(int id, String ps);
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em);
	
	public List<User> getAllUser();
	
	public User getUserById(int id);
	
	public boolean updateEditBooks(User b);
	
	public boolean deleteUser(int id);
	
	public boolean checkEmPn(String em, String pn);
	
	public boolean updatePassword(String em, String pn, String pw);
}


