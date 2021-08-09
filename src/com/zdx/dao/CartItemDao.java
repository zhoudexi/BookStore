package com.sgy.dao;

import java.sql.SQLException;
import java.util.List;

import com.sgy.domain.Cartitem;
import com.sgy.domain.User;

public interface CartItemDao {
	
	public boolean checkCartItem(User user,String product_id);
	public boolean addCartItem(User user,String product_id);
	public boolean changeCartItem(User user,String product_id);
	public boolean deleteCartItem(User user,String product_id);
	public List<Cartitem> getCartitemsByUser(User user) throws SQLException;
	public List<Cartitem> getCartitemsForOrder(User user) throws SQLException;
	
}
