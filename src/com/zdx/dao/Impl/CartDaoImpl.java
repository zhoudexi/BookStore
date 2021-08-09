package com.sgy.dao.Impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sgy.dao.CartDao;
import com.sgy.domain.Cart;
import com.sgy.domain.Product;
import com.sgy.domain.User;
import com.sgy.utils.DataSourceUtils;

public class CartDaoImpl implements  CartDao {

	@Override
	public boolean checkCartByUser(User user) {
		// TODO Auto-generated method stub
		int result=0;
		String sql ="select count(*) from carts where user_id = ? ";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = ((Long)runner.query(sql,new ScalarHandler(),user.getId())).intValue();
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result==0) {
			return false;
		}else
			return true;
	}

	@Override
	public boolean addCartByUser(User user) {
		// TODO Auto-generated method stub
		int result=0;
		String sql = "insert into carts values(?,0)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = runner.update(sql, user.getId());
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(result != 0) {
			
			return true;
		}
		else 
			return false;
	}

	@Override
	public boolean addMoneyByUser(User user,Product product) {
		// TODO Auto-generated method stub
		int result=0;
		String sql = "update carts set money = money + ? WHERE user_id = ? ";
		Object params[] = {product.getPrice(),user.getId()};
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = runner.update(sql, params);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(result != 0) {
			
			return true;
		}
		else 
			return false;
	}

	@Override
	public boolean reduceMoneyByItemMoney(User user,double item_money) {
		// TODO Auto-generated method stub
		int result=0;
		String sql = "update carts set money = money - ? WHERE user_id = ? ";
		Object params[] = {item_money,user.getId()};
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = runner.update(sql, params);
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		if(result != 0) {
			
			return true;
		}
		else 
			return false;
	}
	
	@Override
	public Cart getCartByUser(User user) {
		// TODO Auto-generated method stub
		String sql = "select money from carts where user_id = ? ";
		Cart cart = new Cart();
		cart.setUser(user);
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			cart = runner.query(sql, new BeanHandler<Cart>(Cart.class),user.getId());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cart;
	}

	@Override
	public boolean deleteCartByUser(User user) {
		// TODO Auto-generated method stub
		int result = 0;
		String sql = "delete carts,cartitem from carts,cartitem where carts.user_id = cartitem.user_id and carts.user_id = ? ";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = runner.update(sql, user.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result != 0) {
			
			return true;
		}
		else 
			return false;
	}


}
