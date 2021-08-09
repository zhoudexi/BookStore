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
import dao.OrderItemDao;
import domain.Order;
import domain.OrderItem;

/**
 * Servlet implementation class FindOrderByIdServlet
 */
@WebServlet("/FindOrderByIdServlet")
public class FindOrderByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindOrderByIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =  request.getParameter("id");
		OrderDao orderdao = DaoFactory.getOrderDAOInstance();
		OrderItemDao orderitem = DaoFactory.getOrderItemDaoDAOInstance();
		Order order = new Order();
		try {
			order=orderdao.findOrderByID(id);
			order.setOrderItems(orderitem.findOrderItemByOrder(order));
		}catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("order", order);
		request.getRequestDispatcher("/admin/login/home.jsp?item="+"view").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
