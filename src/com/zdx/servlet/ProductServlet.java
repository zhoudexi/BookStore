package com.sgy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgy.utils.BeanFactory;
import com.sgy.dao.ProductDao;
import com.sgy.dao.Impl.ProductDaoImpl;
import com.sgy.domain.PageBean;
import com.sgy.domain.Product;
import com.sgy.service.ProductService;
import com.sgy.service.Impl.ProductServiceImpl;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/product")
public class ProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 全部商品
	 */
	public String findByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		int currPage=Integer.parseInt(request.getParameter("currPage")) ;
		int pageSize=10;	//一页显示10个商品
		//调用service
		ProductService ps=(ProductService) BeanFactory.getBean("ProductService");
		PageBean<Product> bean=ps.findBypage(currPage,pageSize);
		
		//将结果放入request域中 请求转发
		request.setAttribute("pb", bean);
		
		return "/client/product_list.jsp";
	}
	
	
	/**
	 * 商品详情
	 * @throws Exception 
	 */
	
	public String getById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.获取商品Id
		String pid=request.getParameter("pid");
		
		//调用service
		ProductService ps=new ProductServiceImpl();
		Product p=ps.getBypid(pid);
		
		//将结果放入request域中 请求转发
		request.setAttribute("bean", p);
		
		return "/client/product_info.jsp";
	}
	
	public String searchByName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1.获取商品名称
		String pname = request.getParameter("name");

		// 调用service
		ProductService ps = new ProductServiceImpl();
		Product p = ps.searchByName(pname);
		
		// 将结果放入request域中 请求转发
		request.setAttribute("bean", p);

		return "/client/product_info.jsp";

	}

}
