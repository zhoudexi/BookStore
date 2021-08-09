package com.sgy.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgy.domain.Notice;
import com.sgy.factory.ServiceFactory;
import com.sgy.service.NoticeService;

/**
 * Servlet implementation class NoticeEditServlet
 */
@WebServlet("/NoticeEditServlet")
public class NoticeEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeEditServlet() {
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
		String method = request.getParameter("method");
		if (method.equals("findById")) {
			findById(request, response);
		} else if (method.equals("editById")) {
			editById(request, response);
		}
	}

	private void findById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		NoticeService noticeService = ServiceFactory.getNoticesServiceInstance();
		Notice notice = new Notice();
		try {
			notice = noticeService.findOneNotice(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/admin/login/home.jsp?item=" + "Notice_Edit").forward(request, response);
	}

	private void editById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String details = request.getParameter("details");
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setDetails(details);
		NoticeService noticeService = ServiceFactory.getNoticesServiceInstance();
		List<Notice> notices = new ArrayList<Notice>();
		try {
			noticeService.editByIdNotice(Integer.parseInt(id), notice);
			notices = noticeService.findAllNotices();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("notices", notices);
		request.getRequestDispatcher("/admin/login/home.jsp?item=" + "Notice_List").forward(request, response);
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
