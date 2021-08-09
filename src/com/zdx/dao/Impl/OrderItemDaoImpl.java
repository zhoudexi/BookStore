package com.sgy.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import com.sgy.dao.OrderItemDao;
import com.sgy.domain.Cartitem;
import com.sgy.domain.Order;
import com.sgy.domain.OrderItem;
import com.sgy.domain.Product;
import com.sgy.utils.DataSourceUtils;

public class OrderItemDaoImpl implements OrderItemDao {

	@Override
	public List<OrderItem> findOrderItemByOrder(Order order) throws SQLException {
		// TODO Auto-generated method stub
		String order_id = order.getId();
		String sql = "select orderitem.*,products.* from orderitem ,products "
				+ "where orderitem.product_id=products.id and orderitem.order_id ='" + order_id + "'";
		// 构造一个指定数据源ds的QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// 返回一个QueryRunner对象query()方法的查询结果
		return runner.query(sql, new ResultSetHandler<List<OrderItem>>() {

			@Override
			public List<OrderItem> handle(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<OrderItem> orderItems = new ArrayList<OrderItem>();
				while (rs.next()) {
					
					OrderItem orderItem = new OrderItem();
					orderItem.setOrder(order);
					orderItem.setBuynum(rs.getInt("orderitem.buynum"));
					Product product = new Product();
					product.setId(rs.getString("products.id"));
					product.setName(rs.getString("products.name"));
					product.setPrice(rs.getDouble("products.price"));
					product.setCategory(rs.getString("products.category"));
					product.setDescription(rs.getString("products.description"));
					orderItem.setP(product);
					orderItems.add(orderItem);
				}
				return orderItems;
			}
		});
	}

	@Override
	public boolean addOrderItem(Order order, Cartitem cartitem) throws SQLException {
		int result = 0;
		String sql = "insert into orderitem values(?,?,?)";
		Object params[] = { order.getId(), cartitem.getProduct().getId(), cartitem.getNum() };
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		result = runner.update(sql, params);
		if (result != 0) {
			
			return true;
		}
		return false;
	}

}
