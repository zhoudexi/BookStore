<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String book[][] = new String[4][4];
		book[0] = (String[]) session.getAttribute("book0");
		book[1] = (String[]) session.getAttribute("book1");
		book[2] = (String[]) session.getAttribute("book2");
		book[3] = (String[]) session.getAttribute("book3");
	
		String s[]=new String[4];
		s[0]=request.getParameter("PName");
		s[1]=request.getParameter("PRice");
		s[2]=request.getParameter("PNum");
		s[3]="1";
		if(s[0].equals("网管员必备宝典")){
			if(book[0]!=null){
				s[3]=Integer.toString(Integer.parseInt(book[0][3])+1);
			}
			session.setAttribute("book0", s);
		}
		else if(s[0].equals("Java基础入门")){
			if(book[1]!=null){
				s[3]=Integer.toString(Integer.parseInt(book[1][3])+1);
			}
			session.setAttribute("book1", s);
		}
		else if(s[0].equals("学会宽容")){
			if(book[2]!=null){
				s[3]=Integer.toString(Integer.parseInt(book[2][3])+1);
			}
			session.setAttribute("book2", s);
		}
		else if(s[0].equals("杜拉拉升职记")){
			if(book[3]!=null){
				s[3]=Integer.toString(Integer.parseInt(book[3][3])+1);
			}
			session.setAttribute("book3", s);
		}
			 // 重定向到新地址
		   String site = new String("Cart.jsp");
		   response.setStatus(response.SC_MOVED_TEMPORARILY);
		   response.setHeader("Location", site);
	%>
</body>
</html>