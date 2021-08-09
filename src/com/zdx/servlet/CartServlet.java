package com.sgy.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sgy.dao.CartDao;
import com.sgy.dao.CartItemDao;
import com.sgy.dao.ProductDao;
import com.sgy.dao.UserDao;
import com.sgy.domain.Cart;
import com.sgy.domain.Cartitem;
import com.sgy.domain.Product;
import com.sgy.domain.User;
import com.sgy.factory.DaoFactory;


/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取操作项目
		String op=request.getParameter("op");
		if(op.equals("add")){
			addCart(request,response);
		}else if(op.equals("delete")){
			deleteCart(request,response);
		}else if(op.equals("show")){
			showCart(request,response);
		}
	}

	private void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		//HttpSession session=request.getSession();
		//String name=(String)request.getSession().getAttribute("username");
		//User name=(User) request.getSession().getAttribute("username");
		User tempuser=(User) request.getSession().getAttribute("user");
		String name=tempuser.getUsername();
		
		//判断是否是登陆状态
		if (name==null) {
			response.getWriter().write("请登录账号");
			response.setHeader("Refresh", "2;URL="+request.getContextPath()+"/client/login.jsp");
			return ;
		}
		
		String product_id = request.getParameter("product_id");
		
		User user = new User();
		Product product = new Product();
		UserDao userDao = DaoFactory.getUserDaoInstance();
		ProductDao productDao = DaoFactory.getProductDaoInstance();
		CartDao cartDao = DaoFactory.geCartDaoInstance();
		CartItemDao cartItemDao = DaoFactory.getCartItemDaoInstance();
		
		try {
			user = userDao.getUserByName(name);
			product = productDao.searchById(product_id);
			//判断购物车中是否存在当前用户的购物车项目，不存在则创建项目
			if (!cartDao.checkCartByUser(user)) {
				cartDao.addCartByUser(user);
			}
			//添加商品到购物车，判断购物车中是否存在该用户的该商品
			if (cartItemDao.checkCartItem(user, product_id)) {
				//存在则增加商品数量
				cartItemDao.changeCartItem(user, product_id);	
			}else
				//不存在则新增商品项目
				cartItemDao.addCartItem(user, product_id);
			//增加购物车金额
			
			cartDao.addMoneyByUser(user, product);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		//跳转到显示购物车方法
		response.sendRedirect(request.getContextPath()+"/CartServlet?op=show");
	}
	
	private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		/*HttpSession session=request.getSession();
		String name=(String) session.getAttribute("username");*/
		User tempuser=(User) request.getSession().getAttribute("user");
		String name=tempuser.getUsername();
		
		//判断是否是登陆状态
		if (tempuser.getUsername()==null) {
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
		
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("/client/Cart.jsp").forward(request, response);
	}
	
	
	private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		User tempuser=(User) request.getSession().getAttribute("user");
		String name=tempuser.getUsername();
		String product_id = request.getParameter("product_id");
		double item_money = Double.parseDouble(request.getParameter("money"));
		User user = new User();
		UserDao userDao = DaoFactory.getUserDaoInstance();
		CartDao cartDao = DaoFactory.geCartDaoInstance();
		CartItemDao cartItemDao = DaoFactory.getCartItemDaoInstance();
		try {
			user = userDao.getUserByName(name);
			//如果对应的商品项目删除成功，则减去购物车相应的金额
			if (cartItemDao.deleteCartItem(user, product_id)) {
				cartDao.reduceMoneyByItemMoney(user, item_money);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		response.sendRedirect(request.getContextPath()+"/CartServlet?op=show");
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
