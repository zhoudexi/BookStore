package dao;

public class DaoFactory {
	public DaoFactory() {
		// TODO Auto-generated constructor stub
	}
	public static OrderDao getOrderDAOInstance() {
		return new OrderDaoImpl();
	}
	public static OrderItemDao getOrderItemDaoDAOInstance() {
		return new OrderItemDaoImpl();
	}
}
