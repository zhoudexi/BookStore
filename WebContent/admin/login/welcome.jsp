<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="welcome">
		<%if(request.getParameter("item")!=null&&request.getParameter("item").equals("product_list")){%>
			<%@include file="../products/list1.jsp"%>
		<% }
		else if(request.getParameter("item")!=null&&request.getParameter("item").equals("product_add")){ %>
			<%@include file="../products/add.jsp"%>
		<% }else if(request.getParameter("item")!=null&&request.getParameter("item").equals("download")){ %>
			<%@include file="../products/download.jsp"%>	
		<% }else if(request.getParameter("item")!=null&&request.getParameter("item").equals("orders")){ %>
		<%@include file="../orders/orderList.jsp"%>
		<% }else if(request.getParameter("item")!=null&&request.getParameter("item").equals("view")){ %>
		<%@include file="../orders/orderView.jsp"%>		
		<% }else if(request.getParameter("item")!=null&&request.getParameter("item").equals("Notice_List")){ %>
		<%@include file="../notices/noticeList.jsp"%>
	<% }else if(request.getParameter("item")!=null&&request.getParameter("item").equals("Notice_Add")){ %>
		<%@include file="../notices/addNotice.jsp"%>
	<% }else if(request.getParameter("item")!=null&&request.getParameter("item").equals("Notice_Edit")){ %>
		<%@include file="../notices/editNotice.jsp"%>	
	<% }else if(request.getParameter("item")!=null&&request.getParameter("item").equals("user_List")){ %>
		<%@include file="../user/userList.jsp"%>
	<% }else { %>
			<div class="wehead">
				<p>系统首页</p>
			</div>
			<div class="wetext">
				<p>登陆成功!</p>
			</div>
			<div class="wetext2">
			<%
				String str = request.getParameter("first");
				if(str!=null)
					out.println(str);
			%>
			</div>
		<% } %>
	</div>
</body>
</html>