package com.sgy.dao.Impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sgy.dao.ProductDao;
import com.sgy.domain.Product;
import com.sgy.utils.DataSourceUtils;

public class ProductDaoImpl implements ProductDao {

	//商品详情
	@Override
	public Product getBypid(String pid) throws Exception {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from products where id=? limit 1";
		
		return qr.query(sql, new BeanHandler<>(Product.class), pid);
	}

	/**
	 * 查询当前页的所有商品
	 * currPage:当前页码
	 * pageSize:一页显示多少商品
	 */
	@Override
	public List<Product> findByPage(int currPage, int pageSize) throws Exception {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from products limit ?,?";  
		
		return qr.query(sql, new BeanListHandler<>(Product.class), (currPage-1)*pageSize,pageSize);
	}

	/**
	 * 查询当前商品的总条数
	 */
	@Override
	public int getTotalCount() throws Exception {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from products"; 
		return ((Long)qr.query(sql, new ScalarHandler())).intValue();
	}

	/**
	 * 搜索商品
	 */
	@Override
	public Product searchByName(String pname) throws Exception {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from products where name like '%" + "?" + "%'";
		
		return qr.query(sql, new BeanHandler<>(Product.class), pname);
	}

	@Override
	public Product searchById(String product_id) {
		Product product = new Product();
		String sql="select * from products where id = ? ";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			product = runner.query(sql, new BeanHandler<Product>(Product.class),product_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return product;
	}

	@Override
	public List<Product> searchAll() {
		List<Product> ps = new ArrayList<Product>();
		String sql="select * from products";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			ps = runner.query(sql, new BeanListHandler<Product>(Product.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ps;
	}

	@Override
	public List<Product> searchByName2(String name) {
		List<Product> ps = new ArrayList<Product>();
		String sql="select * from products where name like '%"+name+"%'";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		try {
			ps = runner.query(sql, new BeanListHandler<Product>(Product.class));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ps;
	}

	@Override
	public boolean deleteProduct(String id) {
		String sql = "delete from products where id ='"+id+"'";
		int result = 0;
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			try {
				result = runner.update(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(result != 0)
			return true;
		else 
			return false;
	}

}
