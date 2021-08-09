package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.OrderDao;
import domain.Order;

/**
 * Servlet implementation class FindOrdersByIdServlet
 */
@WebServlet("/FindOrdersByIdServlet")
public class FindOrdersByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindOrdersByIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =  request.getParameter("id");
		String receiverName =  request.getParameter("receiverName");
		OrderDao orderdao = DaoFactory.getOrderDAOInstance();
		List<Order> orders = null;
		try {
			orders=orderdao.findOrdersByID(id, receiverName);
		}catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/admin/login/home.jsp?item="+"orders").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
