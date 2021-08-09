package util;
import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
public class DataSourceUtils {
   private static ComboPooledDataSource dataSource = new ComboPooledDataSource();
   private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
   public static DataSource getDataSource() {
	return dataSource;
	
}
   //开启事务
   public static void startTransaction() throws SQLException{
   	Connection con = getConnection();
   	if (con!=null) {
   		con.setAutoCommit(false);
	}
   }
   public static Connection getConnection() throws SQLException{
   	Connection con = tl.get();
   	if(con==null) {
   		con=dataSource.getConnection();
   		tl.set(con);
   	}
   	return con;
   }
   //回滚事务
   @SuppressWarnings("null")
public static void rollback() throws SQLException {
		Connection con = getConnection();
	   	if(con==null) {
	   		con.rollback();
	   	}
   }
   //提交事务
   public static void releaseAndCloseonnection() throws SQLException {
   	Connection con = getConnection();
	if(con!=null) {
		con.commit();
	   	tl.remove();
	   	con.close();
	}
   }
}
