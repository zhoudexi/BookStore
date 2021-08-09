package com.sgy.dao;

import com.sgy.domain.User;

public interface UserDao {

	void add(User user) throws Exception;
	
	User getByUsernameAndPwd(String username, String password)throws Exception;
	public User getUserByName(String username);
}
