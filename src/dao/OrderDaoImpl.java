package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import domain.Order;
import domain.User;
import util.DataSourceUtils;

public class OrderDaoImpl implements OrderDao{
	private QueryRunner runner = new  QueryRunner(DataSourceUtils.getDataSource() );
	@Override
	public List<Order> findAllOrder() throws SQLException {
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id order by orders.user_id";	
		return runner.query(sql, new ResultSetHandler<List<Order>>() {
			@Override
			public List<Order> handle(ResultSet rs) throws SQLException {
				List<Order> orders = new ArrayList<Order>();
				while(rs.next()) {
					Order order=new Order();
					order.setId(rs.getString("orders.id"));
					order.setMoney(rs.getDouble("orders.money"));
					order.setOrdertime(rs.getDate("orders.ordertime"));
					order.setPaystate(rs.getInt("orders.paystate"));
					order.setReceiverAddress(rs.getString("orders.receiverAddress"));
					order.setReceiverName(rs.getString("orders.receiverName"));
					order.setReceiverPhone(rs.getString("orders.receiverPhone"));
					
					User user = new User();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setIntroduce(rs.getString("user.introduce"));
					user.setPassword(rs.getString("user.password"));
					user.setRegisttime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					order.setUser(user);
					orders.add(order);
				}
				return orders;
			}
		});
	}
	public List<Order> findOrdersByID(String id,String receiverName) throws SQLException {
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id AND orders.id like '%"+id+"%' AND orders.receiverName like '%"+receiverName+"%'";
		return runner.query(sql,new ResultSetHandler<List<Order>>() {
			@Override
			public List<Order> handle(ResultSet rs) throws SQLException {
				List<Order> orders = new ArrayList<Order>();
				while(rs.next()) {
					Order order=new Order();
					order.setId(rs.getString("orders.id"));
					order.setMoney(rs.getDouble("orders.money"));
					order.setOrdertime(rs.getDate("orders.ordertime"));
					order.setPaystate(rs.getInt("orders.paystate"));
					order.setReceiverAddress(rs.getString("orders.receiverAddress"));
					order.setReceiverName(rs.getString("orders.receiverName"));
					order.setReceiverPhone(rs.getString("orders.receiverPhone"));
					
					User user = new User();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setIntroduce(rs.getString("user.introduce"));
					user.setPassword(rs.getString("user.password"));
					user.setRegisttime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					order.setUser(user);
					orders.add(order);
				}
				return orders;
			}
		});
	}
	public Order findOrderByID(String id) throws SQLException {
		System.out.println(id);
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id AND orders.id='"+id+"'";
		
		return runner.query(sql, new ResultSetHandler<Order>() {
			@Override
			public Order handle(ResultSet rs) throws SQLException {
				Order order=new Order();
				while(rs.next()) {
					order.setId(rs.getString("orders.id"));
					order.setMoney(rs.getDouble("orders.money"));
					order.setOrdertime(rs.getDate("orders.ordertime"));
					order.setPaystate(rs.getInt("orders.paystate"));
					order.setReceiverAddress(rs.getString("orders.receiverAddress"));
					order.setReceiverName(rs.getString("orders.receiverName"));
					order.setReceiverPhone(rs.getString("orders.receiverPhone"));
					
					User user = new User();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setIntroduce(rs.getString("user.introduce"));
					user.setPassword(rs.getString("user.password"));
					user.setRegisttime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					order.setUser(user);
					System.out.println(order.getMoney());
				}
				return order;
			}
		});
	}
	public int byIddelete(String id) {
		String sql = "DELETE FROM orders WHERE id = ?";
		
		int result = 0;
		try {
			
		    result = runner.update(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
