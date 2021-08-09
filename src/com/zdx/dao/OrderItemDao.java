package com.sgy.dao;

import java.sql.SQLException;
import java.util.List;

import com.sgy.domain.Cartitem;
import com.sgy.domain.Order;
import com.sgy.domain.OrderItem;

public interface OrderItemDao {
	public List<OrderItem> findOrderItemByOrder(final Order order) throws SQLException;
	public boolean addOrderItem(Order order,Cartitem cartitem)throws SQLException;
}
