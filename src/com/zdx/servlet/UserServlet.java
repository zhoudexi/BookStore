package com.sgy.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.sgy.domain.User;
import com.sgy.service.UserService;
import com.sgy.service.Impl.UserServiceImpl;
import com.sgy.utils.MD5Utils;
import com.sgy.utils.UUIDUtils;

/**
 * 和用户相关的servlet
 */
@WebServlet("/user")
public class UserServlet extends BaseServlet {
		
	/**
	 * 跳转注册页面
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
    public String registUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	return "/client/Register.jsp";
    }
    
	/**
	 * * 用户注册
	  * @throws Exception 
	*/        
    public String registe(HttpServletRequest request, HttpServletResponse resp) throws Exception {
    	request.setCharacterEncoding("UTF-8");
    	//1、封装数据
    	User user = new User();
    	BeanUtils.populate(user, request.getParameterMap());
    	
    	//2 调用service完成注册
    	UserService s=(UserService) new UserServiceImpl();
    	
    	s.regist(user);
    	request.setAttribute("msg", "注册成功");
    	return "/client/msg.jsp";
    }
    
    /**
                * 跳转到登录页面
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String loginUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	return "/client/login.jsp";
    }
    
    public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	//1.获取用户名 密码
    	String username=req.getParameter("username");
    	String password=req.getParameter("password");
    	
    	//2.调用service完成登录操作 返回user
    	UserService s=new UserServiceImpl();
        User user=s.login(username,password);
        
    	//3.判断用户
    	if(user==null) {
    		req.setAttribute("msg", "用户名密码不匹配");
    		//req.getRequestDispatcher("/client/login.jsp").forward(req, resp);
    		return "/client/login.jsp";
    	}
    	//4.将user放入session重定向
    	req.getSession().setAttribute("user", user);
    	resp.sendRedirect(req.getContextPath()+"/client/index.jsp");
    	return null;
    }
    
    /**
              * 用户退出
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String logOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	//清除session
    	req.getSession().invalidate();
    	
    	//重定向
    	resp.sendRedirect(req.getContextPath()+"/client/index.jsp");
    	//处理自动登录
    	return null;
    }
    
    
}
