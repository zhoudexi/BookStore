package com.sgy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sgy.dao.CartDao;
import com.sgy.dao.CartItemDao;
import com.sgy.dao.OrderDao;
import com.sgy.dao.OrderItemDao;
import com.sgy.dao.UserDao;
import com.sgy.domain.Cart;
import com.sgy.domain.Cartitem;
import com.sgy.domain.Order;
import com.sgy.domain.User;
import com.sgy.factory.DaoFactory;



/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//获取操作项目,预览订单、生成订单
		User tempuser=(User) request.getSession().getAttribute("user");
		String name=tempuser.getUsername();
		//判断是否是登陆状态
		if (name==null) {
			response.getWriter().write("请先登录");
			response.setHeader("Refresh", "2;URL="+request.getContextPath()+"/client/login.jsp");
			return ;
		}
		String op=request.getParameter("op");
		if(op.equals("prepare")){
			preOrder(request,response);
		}else if(op.equals("create")){
			creOrder(request,response);
		}
	}
	
	private void preOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		User tempuser=(User) request.getSession().getAttribute("user");
		String name=tempuser.getUsername();
		//判断是否是登陆状态
		if (name==null) {
			response.getWriter().write("请先登录");
			response.setHeader("Refresh", "2;URL="+request.getContextPath()+"/client/login.jsp");
			return ;
		}
		User user = new User();
		Cart cart = new Cart();
		List<Cartitem> cartitems = new ArrayList<Cartitem>();
		UserDao userDao = DaoFactory.getUserDaoInstance();
		CartDao cartDao = DaoFactory.geCartDaoInstance();
		CartItemDao cartItemDao = DaoFactory.getCartItemDaoInstance();
		//获取购物车中的商品信息作为订单信息预览
		try {
			user = userDao.getUserByName(name);
			//获取车信息
			cart = cartDao.getCartByUser(user);
			//获取商品项目信息
			cartitems = cartItemDao.getCartitemsByUser(user);
			//添加项目到车
			cart.setCartitems(cartitems);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("显示订单预览信息");
		System.out.println("==========================");
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("/client/order.jsp").forward(request, response);
	}
	
	private void creOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("生成订单");
		request.setCharacterEncoding("UTF-8");
		User tempuser=(User) request.getSession().getAttribute("user");
		String name=tempuser.getUsername();
		//判断是否是登陆状态
		if (name==null) {
			response.getWriter().write("请先登录");
			response.setHeader("Refresh", "2;URL="+request.getContextPath()+"/client/login.jsp");
			return ;
		}
		//取到订单基本信息
		String orderId = UUID.randomUUID().toString();
		double money = Double.parseDouble(request.getParameter("money"));
		String receiverName=request.getParameter("receiverName");
		String receiverPhone=request.getParameter("receiverPhone");
		String receiverAddress=request.getParameter("receiverAddress");
		Order order = new Order();
		User user = new User();
		UserDao userDao = DaoFactory.getUserDaoInstance();
		OrderDao orderDao = DaoFactory.getOrderDaoInstance();
		OrderItemDao orderItemDao = DaoFactory.getOrderItemDaoInstance();
		CartDao cartDao = DaoFactory.geCartDaoInstance();
		CartItemDao cartItemDao = DaoFactory.getCartItemDaoInstance();
		List<Cartitem> cartitems = new ArrayList<Cartitem>();
		//取到当前用户等信息
		user = userDao.getUserByName(name);
		//将用户信息和订单基本信息封装到order
		order.setUser(user);
		order.setId(orderId);
		order.setMoney(money);
		order.setReceiverName(receiverName);
		order.setReceiverPhone(receiverPhone);
		order.setReceiverAddress(receiverAddress);
		try {
			//1.根据封装的order在数据库中增加一条订单基本信息
			orderDao.addOrder(order);
			//查询购物车中的项目信息列表得到orderItems
			cartitems = cartItemDao.getCartitemsForOrder(user);
			//2.根据信息列表在数据库中依次写入每条orderItem信息
			for(Cartitem cartitem : cartitems) {
				orderItemDao.addOrderItem(order, cartitem);
			}
			//3.删除购物车中的项目
			cartDao.deleteCartByUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/client/submitOrder.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
