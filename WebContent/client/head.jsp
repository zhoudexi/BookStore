<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/head.css">
<style>

*{
	margin: 0 auto;
}
li{
    padding: 2px;
    display: inline;
}
a{
	color: blue;
    text-align: center;
    padding: 2px;
    text-decoration: none;
}
.head{
	
	height: 120px;
	text-align: center;
	margin: 0 auto;
	background-color: snow;
}
.headlead{
	display: inline-block;
	 position: relative;
	 left: 167px;
	 bottom: 50px;
}
.logo{
    display: inline-block;
	position: relative;
	right: 167px;
}

</style>
</head>
<body>
	 <div class="head">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/client/index.jsp"><img src="${pageContext.request.contextPath}/client/images/logo.jpg" style="width: 300px;height: 120px;"></a>
        </div>
        <div class="headlead" >
          <ul>
            <li><img src="${pageContext.request.contextPath}/client/images/cart.gif"  align="center" style="width: 25px;height: 25px;"></li>
            <li><a href="${pageContext.request.contextPath}/CartServlet?op=show"  class="heada">购物车</a></li><li>|</li>
            <li><a href="#"  class="heada">购物中心</a></li><li>|</li>
            <c:if test="${empty user }">
            <li><a href="${pageContext.request.contextPath}/user?method=loginUI"  class="heada">登录</a></li><li>|</li>
            <li><a href="${pageContext.request.contextPath}/user?method=registUI"  class="heada">注册</a></li>            
          	</c:if>
          	<c:if test="${not empty user }">
          	欢迎您：${user.username } |
            <li><a href="${pageContext.request.contextPath }/MyOrderList"  class="heada">我的订单</a></li><li>|</li>
            <li><a href="${pageContext.request.contextPath}/user?method=logOut"  class="heada">退出</a></li>            
          	</c:if>
          </ul>
        </div>
    </div>
</body>
</html>