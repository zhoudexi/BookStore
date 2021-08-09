package com.sgy.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgy.dao.ProductDao;
import com.sgy.domain.Product;
import com.sgy.factory.DaoFactory;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/ProductListServlet")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<Product> products = null;
		String name = request.getParameter("name");
		
		ProductDao productDao = DaoFactory.getProductDaoInstance();
		try {
			if (name == null) {
				products = productDao.searchAll();
			} else {
				products = productDao.searchByName2(name);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
		}
		request.setAttribute("productList", products);
		request.getRequestDispatcher("/admin/login/home.jsp?item=" + "product_list").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
