<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:forward page="home.jsp">
		<jsp:param value="这是使用jsp：forward从first页面跳转过来的***" name="first"/>
	</jsp:forward>
</body>
</html>