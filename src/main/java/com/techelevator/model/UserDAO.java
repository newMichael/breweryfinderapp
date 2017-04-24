package com.techelevator.model;

import java.util.List;

public interface UserDAO {
	
	public void save(User user);
	public List<User> getPendingUsers();
	public User getUserByUserName(String userName);
	public void setIsEnabled(User user);
	public boolean userNameValidation(User user);
	public boolean userEmailValidation(User user);
	List<User> getAllUsers();
	List<User> getDisabledUsers();

}
