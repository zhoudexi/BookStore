package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import domain.Product;
/**
 * Servlet implementation class MenuSearchServlet
 */
@WebServlet("/MenuSearchServlet")
public class MenuSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//从request中获取搜索参数的值
		String action = request.getParameter("action");
		String name = request.getParameter("search");
		if(action.equals("search")) {
			List<Product> products = new ArrayList<Product>();
			//循环遍历结果集，设置产品属性，并将产品添加到ps产品列表中
			products = new Product().searchByname(name);
			//将产品列表products设置到request对象的products参数中
			request.setAttribute("products", products);
			//并将请求转发给ProductList.jsp页面进行后续操作。
			request.getRequestDispatcher("/client/ProductList.jsp").forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
