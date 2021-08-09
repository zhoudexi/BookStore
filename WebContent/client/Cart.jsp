<%@include file="head.jsp"%>
<%@ include file="menu_search.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
@charset "UTF-8";
body.goods-list {
	width: 100%;
    background:snow;  
    text-align:center;  
}  

.books{
	width: 65%;
	height: 470px;
	margin: 10px auto 0px auto;
	background: #fcfdef;
	border-style: solid;
	border-color:#cccccc;
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
<meta charset="UTF-8">
<title>购物车</title>
</head>
<body>
	<div class="p3">
		<a href="index.jsp">首页</a>&nbsp;>&nbsp;购物车
	</div>
	<div class="Cart">
		<div class="goods-info">
			<table width='100%' border='0' cellspacing='0'>
				<tr height="30">
					<td width='13%'>序号</td>
					<td width='21%'>商品名称</td>
					<td width='13%'>价格</td>
					<td width='10%'>库存</td>
					<td width='10%'>数量</td>
					<td width="10%">小计</td>
					<td width='20%'>删除</td>
				</tr>
			
		</div>
	<c:forEach items="${cart.getCartitems()}" var="ci" varStatus="count">
					<c:set var="totalMoney" scope="page" value="${ci.getNum()*ci.getProduct().getPrice()}" />
					<tr>
						<td>${count.count}</td>
						<td>${ci.getProduct().getName()}</td>
						<td>${ci.getProduct().getPrice()}</td>
						<td>${ci.getProduct().getPnum()}</td>
						<td>${ci.getNum()}</td>
						<td>${totalMoney}</td>
						<td>
							<a href="${pageContext.request.contextPath}
							/CartServlet?op=delete&money=${totalMoney}&product_id=${ci.getProduct().getId()}">
								<button style="color: #FF0000;" onclick='return deleConfirm()'>X</button></a>
						</td>
					</tr>
				</c:forEach>
	</table>
	<c:if test="${cart.getCartitems()!=null&&cart.getCartitems().isEmpty()||cart==null}">
				<div style='text-align: center; color:#ADADAD;padding-top:10px;'> 购物车里空空如也</div>
			</c:if>
		<table cellspacing="0" style="margin-top: 30px;margin-bottom: 10px;">
			<tr style="background-color:#CAFFE3;">
				<td style="text-align: right; color: #FF0000; font-weight: bold;
				 padding-right: 30px;">合计： ¥  ${cart.getMoney()}</td>
			</tr>
		</table>
		<div style="text-align: right;">
			<c:if test="${cart.getCartitems()!=null&&cart.getCartitems().isEmpty()||cart==null}">
				<a href="${pageContext.request.contextPath}/product?method=findByPage&currPage=1">
					<button class="btn2">去购物</button></a>
			</c:if>
			<c:if test="${!cart.getCartitems().isEmpty()&&cart!=null}">
				<a href="${pageContext.request.contextPath}/product?method=findByPage&currPage=1">
					<button class="btn2">继续购物</button></a>
				<a href="${pageContext.request.contextPath}/OrderServlet?op=prepare">
					<button class="btn2">下单</button></a>
			</c:if>
			
		</div>
	
	</div>
	
</body>
</html>
