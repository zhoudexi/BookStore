package com.sgy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
 * Servlet implementation class MyOrderList
 */
@WebServlet("/MyOrderList")
public class MyOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User tempuser=(User) request.getSession().getAttribute("user");
		String name=tempuser.getUsername();
		//判断是否是登陆状态
		if (name==null) {
			response.getWriter().write("请先登录");
			response.setHeader("Refresh", "2;URL="+request.getContextPath()+"/client/login.jsp");
			return ;
		}
		User user = new User();
		List<Order> orders = new ArrayList<Order>();
		UserDao userDao = DaoFactory.getUserDaoInstance();
		OrderDao orderDao = DaoFactory.getOrderDaoInstance();
		try {
			user = userDao.getUserByName(name);
			orders = orderDao.findOrderByUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("orderList",orders);
		request.getRequestDispatcher("/client/MyOrderList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
