package dao;

import java.sql.SQLException;
import java.util.List;

import domain.Order;
import domain.OrderItem;

public interface OrderItemDao {
	public List<OrderItem> findOrderItemByOrder(final Order order)throws SQLException;
	public int byIddelete(String id)throws SQLException;
}
