%@include file="head.jsp"%>
<%@ include file="menu_search.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部商品目录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/productList.css">
<style>
@charset "UTF-8";
body.goods-list {
	width: 100%;
    background:snow;  
    text-align:center;  
}  

.books{
	
	height: 500px;
	margin: 10px auto 0px auto;
	background: #fcfdef;
	border-style: solid;
	border-color:#cccccc;
	width: 70%;
}
.p2{
	padding: 5px 5px;
	text-align: left;
	font-size: 16px;
	border-bottom: solid  2px #c0c0c0;
}

.p1{
	font-weight: bold;
	font-size: 18px;
}

.books-td{
	width: 300px;
} 
.books-td img {
	width:115px;
	height:155px;
    background-color: white;
    border-style: solid;
    border-color: #cccccc;
    border-width: 1px;
    padding: 6px;
}

.PLtable{
	text-align: center;
}
.Cart{
	position: relative;
    width: 65%;
    height: 500px;
    margin: 0 auto;
    padding: 10px;
    background: #fcfdef;
    border: 2px solid;
    border-color: #cccccc;
}
.p3{
	font-weight: bold;
	padding: 10px 0;
	width: 65%;
	margin: 0 auto;
	text-align: right;
}
.goods-info{
	background: #e1ffe1;
	border: solid 2px #cccccc;
	width: 100%;
}
.goods-price{
	background: #e1ffe1;
	border: solid 2px #cccccc;
	width: 100%;
	margin-top: 20px;
}
#buy0,#buy1,#buy2,#buy3{
	padding: 8px 8px;
}

</style>

</head>
<body class="goods-list">
	<div class="books" align="center">
	<table class="PLtable">
		<tr height="50"></tr>
		<tr >
			<p class="p2 p1">商品目录</p>
		</tr>
		<tr >
			<p class="p2">&nbsp&nbsp共4种商品</p>
		</tr>
		<tr >
		
			<c:forEach items="${products}" var="item" varStatus="status">
			<td class="books-td">
				<img  src="${pageContext.request.contextPath}/client/images/${item.imgurl}"/>	
				<div>
					<form action="${pageContext.request.contextPath}/client/Handle-AddCart.jsp" method="post">
						书名：<input type="text" style="border:none" name="PName" value="${item.name}" readonly="readonly" /><br/>
						售价：<input type="text" style="border:none" name="PRice" value="${item.price}" readonly="readonly" /><br/>
						库存：<input type="text" style="border:none" name="PNum" value="${item.pnum}" readonly="readonly" /><br/>
						<input type="submit" name="book${status.count}" value="购买" />
					</form>
				</div>
			</td>
		</c:forEach>
		</tr>	
	</div>
</body>
</html>
<!--<%@ include file="foot.jsp" %> -->