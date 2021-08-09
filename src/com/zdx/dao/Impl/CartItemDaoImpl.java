package com.sgy.dao.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sgy.dao.CartItemDao;
import com.sgy.domain.Cartitem;
import com.sgy.domain.Product;
import com.sgy.domain.User;
import com.sgy.utils.DataSourceUtils;

public class CartItemDaoImpl implements CartItemDao {


	@Override
	public boolean checkCartItem(User user, String product_id) {
		// TODO Auto-generated method stub
		int result=0;
		String sql ="select count(*) from cartitem where user_id = ? and product_id = ? ";
		Object params[] = {user.getId(),product_id};
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = ((Long)runner.query(sql,new ScalarHandler(),params)).intValue();
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result==0) {
			return false;
		}else
			return true;
	}
	
	@Override
	public boolean addCartItem(User user,String product_id) {
		// TODO Auto-generated method stub
		int result=0;
		String sql = "insert into cartitem values(null,?,?,?)";
		Object params[] = {user.getId(),product_id,1}; 
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = runner.update(sql, params);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(result != 0) {
			
			return true;
		}
		else 
			return false;
	}

	@Override
	public boolean changeCartItem(User user, String product_id) {
		// TODO Auto-generated method stub
		int result=0;
		String sql = "update cartitem set num = num+1 WHERE user_id = ? and product_id = ? ";
		Object params[] = {user.getId(),product_id}; 
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = runner.update(sql, params);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(result != 0) {
			
			return true;
		}
		else 
			return false;
	}

	@Override
	public List<Cartitem> getCartitemsByUser(User user)  throws SQLException {
		// TODO Auto-generated method stub
		
		String sql = "select cartitem.*,products.* from cartitem ,products "
				+ "where cartitem.product_id = products.id and cartitem.user_id = '"+user.getId()+"'";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new ResultSetHandler<List<Cartitem>>() {
			@Override
			public List<Cartitem> handle(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Cartitem> cartitems = new ArrayList<Cartitem>();
				while(rs.next()) {
					
					Cartitem cartitem = new Cartitem();
					cartitem.setNum(rs.getInt("cartitem.num"));
					Product product = new Product();
					product.setId(rs.getString("products.id"));
					product.setName(rs.getString("products.name"));
					product.setPrice(rs.getDouble("products.price"));
					product.setPnum(rs.getInt("products.pnum"));
					product.setCategory(rs.getString("products.category"));
					product.setDescription(rs.getString("products.description"));
					cartitem.setProduct(product);
					cartitems.add(cartitem);
				}
				return cartitems;
			}
		});
	}

	@Override
	public List<Cartitem> getCartitemsForOrder(User user) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select product_id,num from cartitem where user_id = '"+user.getId()+"'";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new ResultSetHandler<List<Cartitem>>() {
			@Override
			public List<Cartitem> handle(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Cartitem> cartitems = new ArrayList<Cartitem>();
				while(rs.next()) {
					Cartitem cartitem = new Cartitem();
					cartitem.setNum(rs.getInt("num"));
					Product product = new Product();
					product.setId(rs.getString("product_id"));
					cartitem.setProduct(product);
					cartitems.add(cartitem);
				}
				return cartitems;
			}
		});
	}
	
	
	@Override
	public boolean deleteCartItem(User user, String product_id) {
		// TODO Auto-generated method stub
		int result=0;
		String sql = "delete from cartitem where user_id = ? and product_id = ? ";
		Object params[] = {user.getId(),product_id};
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			result = runner.update(sql, params);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(result != 0) {
			
			return true;
		}
		else 
			return false;
	}

	
	
}
