package com.sgy.dao.Impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.sgy.dao.UserDao;
import com.sgy.domain.User;
import com.sgy.utils.DataSourceUtils;

public class UserDaoImpl implements UserDao{

	@Override
	public void add(User user) throws SQLException {
		/**
		 * 添加用户到数据库
		 */
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="insert into user(username,password,gender,email,telephone,introduce) values(?,?,?,?,?,?);";
		qr.update(sql,user.getUsername(),user.getPassword(),
				user.getGender(),user.getEmail(),user.getTelephone(),
				user.getIntroduce());
		
	}

	@Override
	public User getByUsernameAndPwd(String username, String password) throws Exception {
		// TODO 用户登录
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from user where username = ? and password = ?";
		return qr.query(sql, new BeanHandler<>(User.class), username,password);
	}

	@Override
	public User getUserByName(String username) {
		String sql ="select * from user where username = ? ";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		User user = new User();
		try {
			user =  runner.query(sql, new BeanHandler<User>(User.class),username);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage().toString());
		}
		return user;
	}



}
