package com.sgy.service;

import com.sgy.domain.User;

public interface UserService {

	void regist(User user) throws Exception;

	User login(String username, String password) throws Exception;


}
