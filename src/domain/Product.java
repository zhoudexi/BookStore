package domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import dbpool.DbcpConnectionPool;

public class Product {
	private String id, name, category, imgurl, description;
	private double price;
	private int pnum;

	Connection conn = null;
	java.sql.Statement stmt = null;
	ResultSet rs = null;

	PreparedStatement addstmt = null;
	Connection addconn = null;

	public void add(Product p) {
		try {
			conn = DbcpConnectionPool.getConnection();
			String sql = "insert into products values(?,?,?,?,?,?,?)";
			addstmt = conn.prepareStatement(sql);
			addstmt.setString(1, UUID.randomUUID().toString());
			addstmt.setString(2, p.getName());
			addstmt.setDouble(3, p.getPrice());
			addstmt.setString(4, p.getCategory());
			addstmt.setInt(5, p.getPnum());
			addstmt.setString(6, p.getImgurl());
			addstmt.setString(7, p.getDescription());
			addstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbcpConnectionPool.close(addstmt, addconn);
		}
	}

	public List<Product> searchAll() {
		List<Product> list = new ArrayList<Product>();
		try {
			conn = DbcpConnectionPool.getConnection();
			
			String sql = "select * from products";
			stmt = conn.createStatement();	
			rs = stmt.executeQuery(sql);
			while (rs.next())
			{
				Product p = new Product();
				p.setId(rs.getString(1));
				p.setName(rs.getString(2));
				p.setPrice(rs.getDouble(3));
				p.setCategory(rs.getString(4));
				p.setPnum(rs.getInt(5));
				p.setImgurl(rs.getString(6));
				p.setDescription(rs.getString(7));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbcpConnectionPool.close(rs, stmt, conn);
		}
		return list;
	}
	
	
	public List<Product> searchByname(String name){
		String sql = "select name,price,pnum,imgurl from products where name like '%" + name + "%'";
		List<Product> list = new ArrayList<Product>();
		try{
			conn = DbcpConnectionPool.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next())  
			{
				Product p = new Product();
				p.setName(rs.getString(1));
				p.setPrice(rs.getDouble(2));
				p.setPnum(rs.getInt(3));
				p.setImgurl(rs.getString(4));
				list.add(p);
			}
			}catch(Exception e)
			  {
				  e.printStackTrace();
				  }
			  finally{  
			 DbcpConnectionPool.close(rs, stmt, conn);
			  }
		return list;
	} 
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
}
