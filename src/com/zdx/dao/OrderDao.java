package com.sgy.dao;

import java.sql.SQLException;
import java.util.List;

import com.sgy.domain.Order;
import com.sgy.domain.User;



public interface OrderDao {
	//查询所有订单
		public List<Order> findAllOrder() throws SQLException;
		//根据收件姓名查询订单
		public List<Order> findOrderByReceiverName(String receiverName)throws SQLException;
		//根据用户查询订单
		public List<Order> findOrderByUser(User user)throws SQLException;
		//根据ID查询订单
		public Order findOrderById(String id)throws SQLException;
		//付款订单
		public boolean payOrder(String id) throws SQLException;
		//删除订单
		public boolean deleteOrder(String id) throws SQLException;
		//创建订单
		public boolean addOrder(Order order) throws SQLException;
}
