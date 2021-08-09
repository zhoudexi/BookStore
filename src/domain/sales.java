package domain;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbpool.DbcpConnectionPool;

public class sales {
	private String name;
	private int buynum;
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	
	public List<sales> getBuyNumList(String year,String month){
		//定义一个list集合
		List<sales> ps = new ArrayList<sales>();
		try{   
			conn = DbcpConnectionPool.getConnection();
			String sql="select name,buynum from"
					+ "(select products.name,orderitem.buynum,orders.ordertime from products,orderitem,orders"
					+ " where products.id=orderitem.product_id AND orders.id=orderitem.order_id"
					+ " ORDER BY orderitem.buynum desc) as a"
					+ " where date_format(ordertime,'%Y-%m') = '"+year+"-"+month+"';";  
			stmt = conn.createStatement(); 
			rs = stmt.executeQuery(sql);
			while (rs.next())  
			{
				sales p = new sales();
				p.setName(rs.getString(1));
				p.setBuynum(rs.getInt(2));
				ps.add(p);
			}
			}catch(Exception e)
			  {
				  e.printStackTrace();
				  }
			  finally{ 
			 DbcpConnectionPool.close(rs, stmt, conn);
			  }
		return ps;
	}
	
	
}
