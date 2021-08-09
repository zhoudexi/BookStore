package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import domain.Order;
import domain.OrderItem;
import domain.Product;
import util.DataSourceUtils;

public class OrderItemDaoImpl implements OrderItemDao {
	private QueryRunner runner = new  QueryRunner(DataSourceUtils.getDataSource() );
	@Override
	public List<OrderItem> findOrderItemByOrder(Order order) throws SQLException {
		String sql = "select products.*,orderitem.* from products,orderitem where products.id=orderitem.product_id AND orderitem.order_id='"+order.getId()+"'";
		
		return runner.query(sql, new ResultSetHandler<List<OrderItem>>() {
			@Override
			public List<OrderItem> handle(ResultSet rs) throws SQLException {
				List<OrderItem> orderItems = new ArrayList<OrderItem>();
				while(rs.next()) {
					OrderItem orderitem = new OrderItem();
					orderitem.setBuynum(rs.getInt("orderitem.buynum"));
					
					Product p = new Product();
					p.setId(rs.getString("products.id"));
					p.setName(rs.getString("products.name"));
					p.setPrice(rs.getDouble("products.price"));
					p.setCategory(rs.getString("products.category"));
					p.setPnum(rs.getInt("products.pnum"));
					p.setImgurl(rs.getString("products.imgurl"));
					p.setDescription(rs.getString("products.description"));
					orderitem.setP(p);
					orderItems.add(orderitem);
				}
				return orderItems;
			}
		});
	}
	public int byIddelete(String id) {
		String sql = "DELETE FROM orderitem WHERE order_id = ?";
		
		int result = 0;
		try {
			
		    result = runner.update(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
