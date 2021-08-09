package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.OrderDao;
import dao.OrderItemDao;

/**
 * Servlet implementation class DelOrderByIdServlet
 */
@WebServlet("/DelOrderByIdServlet")
public class DelOrderByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelOrderByIdServlet() {
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
		try {
			orderdao.byIddelete(id);
			orderitem.byIddelete(id);
		}catch (Exception e) {
			// TODO: handle exception
		}
		request.getRequestDispatcher("FindOrdersServlet").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
