package listener;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
@WebListener
public class SessionListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

	private ServletContext application;
    /**
     * Default constructor. 
     */
    public SessionListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
    	List<String> online=(List<String>) this.application.getAttribute("online");
    	String username=(String) arg0.getSession().getAttribute("username");
    	online.remove(username);
    	this.application.setAttribute("online", online);
    	//System.out.println(username+"退出了");
    	//System.out.println("当前在线人数："+online.size());
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    
    public void attributeAdded(HttpSessionBindingEvent arg0)  { 
    	List<String> online=(List<String>)this.application.getAttribute("online");
		if("username".equals(arg0.getName())) {
			online.add((String)arg0.getValue());
			System.out.println(arg0.getValue()+"登录了");
		}
		this.application.setAttribute("online", online);
		//System.out.println("当前在线人数："+online.size());
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	this.application=arg0.getServletContext();
		this.application.setAttribute("online", new LinkedList<String>());
    }
	
}
