package dao;

import java.sql.SQLException;
import java.util.List;

import domain.Order;
import domain.OrderItem;

public interface OrderDao {
	public List<Order> findAllOrder() throws SQLException;
	public Order findOrderByID(String id) throws SQLException;
	public int byIddelete(String id) throws SQLException;
	public List<Order> findOrdersByID(String id,String receiverName) throws SQLException;
}
