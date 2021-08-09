package com.sgy.dao;

import com.sgy.domain.Cart;
import com.sgy.domain.Product;
import com.sgy.domain.User;

public interface CartDao {
	public boolean checkCartByUser(User user);
	public boolean addCartByUser(User user);
	public boolean addMoneyByUser(User user,Product product);
	public boolean reduceMoneyByItemMoney(User user,double item_money);
	public Cart getCartByUser(User user);
	public boolean deleteCartByUser(User user);
}
