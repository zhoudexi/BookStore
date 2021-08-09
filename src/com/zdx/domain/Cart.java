package com.sgy.domain;

import java.util.ArrayList;
import java.util.List;

public class Cart{

	private User user;
	private double money;
	List<Cartitem> cartitems = new ArrayList<Cartitem>();
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public List<Cartitem> getCartitems() {
		return cartitems;
	}
	public void setCartitems(List<Cartitem> cartitems) {
		this.cartitems = cartitems;
	}
	
}
