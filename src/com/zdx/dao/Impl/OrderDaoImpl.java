package com.sgy.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sgy.dao.OrderDao;
import com.sgy.domain.Order;
import com.sgy.domain.User;
import com.sgy.utils.DataSourceUtils;

public class OrderDaoImpl implements OrderDao{

	@Override
	public List<Order> findAllOrder() throws SQLException {
		//创建sql
				String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id order by orders.user_id";
				//构造一个指定数据源ds的QueryRunner对象
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				//返回一个QueryRunner对象query()方法的查询结果
				return runner.query(sql, new ResultSetHandler<List<Order>>() {
					@Override
					public List<Order> handle(ResultSet rs) throws SQLException {
						//创建订单集合
						List<Order> orders = new ArrayList<Order>();
						//循环遍历订单和用户信息
						while(rs.next()) {			
							Order order = new Order();
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
							user.setRegisttime(rs.getDate("user.registerTime"));
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

	@Override
	public List<Order> findOrderByReceiverName(String receiverName) throws SQLException {
		//创建sql
				String sql;
				if (receiverName=="") {
					sql = "select orders.*,user.* from orders ,user where user.id=orders.user_id order by orders.user_id";
				}else
					sql = "select orders.*,user.* from orders ,user where user.id=orders.user_id and orders.receiverName = '"+receiverName+"'";
						//构造一个指定数据源ds的QueryRunner对象
						QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
						//返回一个QueryRunner对象query()方法的查询结果
						return runner.query(sql, new ResultSetHandler<List<Order>>() {
							@Override
							public List<Order> handle(ResultSet rs) throws SQLException {
								// TODO Auto-generated method stub
								//创建订单集合
								List<Order> orders = new ArrayList<Order>();
								//循环遍历订单和用户信息
								while(rs.next()) {			
									Order order = new Order();
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
									user.setRegisttime(rs.getDate("user.registerTime"));
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

	@Override
	public List<Order> findOrderByUser(User user) throws SQLException {
		// TODO Auto-generated method stub
				String sql = "select * from orders where user_id = ? order by paystate";
				//构造一个指定数据源ds的QueryRunner对象
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				List<Order> orders = new ArrayList<Order>();
				try {
					orders = runner.query(sql,new BeanListHandler<Order>(Order.class),user.getId());
				} catch (Exception e) {
					// TODO: handle exception
				}
				return orders;
	}

	@Override
	public Order findOrderById(String id) throws SQLException {
		// TODO Auto-generated method stub
				//创建sql
				String sql = "select orders.*,user.* from orders ,user where user.id=orders.user_id and orders.id = '"+id+"'";
				//构造一个指定数据源ds的QueryRunner对象
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				return runner.query(sql, new ResultSetHandler<Order>() {

					@Override
					public Order handle(ResultSet rs) throws SQLException {
						// TODO Auto-generated method stub
						Order order = new Order();
						while(rs.next()) {
							order.setId(rs.getString("orders.id"));
							order.setMoney(rs.getDouble("orders.money"));
							order.setOrdertime(rs.getDate("orders.ordertime"));
							order.setPaystate(rs.getInt("orders.paystate"));
							order.setReceiverAddress(rs.getString("orders.receiverAddress"));
							order.setReceiverName(rs.getString("orders.receiverName"));
							order.setReceiverPhone(rs.getString("orders.receiverPhone"));
							//System.out.println(rs.getDate("user.registerTime"));
							User user = new User();
							user.setId(rs.getInt("user.id"));
							user.setEmail(rs.getString("user.email"));
							user.setGender(rs.getString("user.gender"));
							user.setIntroduce(rs.getString("user.introduce"));
							user.setPassword(rs.getString("user.password"));
							user.setRegisttime(rs.getDate("user.registerTime"));
							user.setRole(rs.getString("user.role"));
							user.setTelephone(rs.getString("user.telephone"));
							user.setUsername(rs.getString("user.username"));
							order.setUser(user);
						}
						return order;
					}
					
				});
	}

	@Override
	public boolean payOrder(String id) throws SQLException {
		// TODO Auto-generated method stub
				int result=0;
				String sql = "update orders set paystate = 1 WHERE id = ? ";
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());	
				try {
					result = runner.update(sql,id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (result!=0) {
					
					return true;
				}else
					return false;
	}

	@Override
	public boolean deleteOrder(String id) throws SQLException {
		// TODO Auto-generated method stub
				String sql = "delete orders,orderitem from orders,orderitem where orders.id=orderitem.order_id and orders.id ='"+id+"'";
				int result = 0;
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
					result = runner.update(sql);
				if(result != 0)
					return true;
				else 
					return false;
	}

	@Override
	public boolean addOrder(Order order) throws SQLException {
		int result=0;
		String sql = "insert into orders values(?,?,?,?,?,0,now(),?)";
		Object params[] = {order.getId(),order.getMoney(),order.getReceiverAddress(),
				order.getReceiverName(),order.getReceiverPhone(),order.getUser().getId()};
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		result = runner.update(sql, params);
		if (result!=0) {
			
			return true;
		}else
			return false;
	}

		
}
