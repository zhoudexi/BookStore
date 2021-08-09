package com.sgy.factory;

import com.sgy.dao.CartDao;
import com.sgy.dao.CartItemDao;
import com.sgy.dao.NoticeDao;
import com.sgy.dao.OrderDao;
import com.sgy.dao.OrderItemDao;
import com.sgy.dao.ProductDao;
import com.sgy.dao.UserDao;
import com.sgy.dao.Impl.CartDaoImpl;
import com.sgy.dao.Impl.CartItemDaoImpl;
import com.sgy.dao.Impl.NoticeDaolmpl;
import com.sgy.dao.Impl.OrderDaoImpl;
import com.sgy.dao.Impl.OrderItemDaoImpl;
import com.sgy.dao.Impl.ProductDaoImpl;
import com.sgy.dao.Impl.UserDaoImpl;


public class DaoFactory {
	public DaoFactory() {
		
	}
	public static NoticeDao getNoticeDaoInstance() {
		return new NoticeDaolmpl();
	}
	public static OrderDao getOrderDaoInstance() {
		return new OrderDaoImpl();
	}
	public static OrderItemDao getOrderItemDaoInstance() {
		return new OrderItemDaoImpl();
	}
	public static ProductDao getProductDaoInstance() {
		return new ProductDaoImpl();
	}
	/*public static SalesDao getSalesDaoInstance() {
		return new SalesDaoImpl();
	}*/
	public static UserDao getUserDaoInstance() {
		return new UserDaoImpl();
	}
	public static CartDao geCartDaoInstance() {
		return new CartDaoImpl();	
	}
	public static CartItemDao getCartItemDaoInstance() {
		return new CartItemDaoImpl();
	}
	
}
