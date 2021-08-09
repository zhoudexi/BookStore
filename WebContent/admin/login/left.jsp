<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="left">
		<div class="lef_top"></div>
		<div>
			<ul class="ul">
				<li><a  href="${pageContext.request.contextPath}/ProductListServlet"
					 target="_self" class="left_list">商品管理</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/login/home.jsp?item=<%="download"%>" 
					target="_self" class="menu">
					销售榜单</a></li>
				<li><a href="${pageContext.request.contextPath}/FindOrdersServlet"
					target="_self" class="menua">订单管理</a></li>
				<li><a href="${pageContext.request.contextPath}/NoticeListServlet" 
					target="_self" class="menua" class="menua">公告管理</a></li>
				<li><a href="${pageContext.request.contextPath}/UersListServlet"
					target="_self" class="menua">用户管理</a></li>	
			</ul>
		</div>
	</div>
</body>
</html>