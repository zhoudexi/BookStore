package com.sgy.service.Impl;

import com.sgy.dao.UserDao;
import com.sgy.dao.Impl.UserDaoImpl;
import com.sgy.domain.User;
import com.sgy.service.UserService;
import com.sgy.utils.MailUtils;

public class UserServiceImpl implements UserService {

	/**
	 * 注册
	 */
	@Override
	public void regist(User user) throws Exception{
		// TODO Auto-generated method stub
		UserDao dao=new UserDaoImpl();
		dao.add(user);
		
		
	}

	/**
	 * 登录
	 */
	@Override
	public User login(String username, String password) throws Exception {
		// TODO 用户登录
		UserDao dao=new UserDaoImpl();		 
		return dao.getByUsernameAndPwd(username,password);
	}

	
}
