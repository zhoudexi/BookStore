<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="head.jsp"%>
<%@ include file="menu_search.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/form.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/ctr.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css"/>
<style type="text/css">
	.box{
		display: flex;
		flex-flow: row;
		align-items: top;
		align-content: top;
	}
	.box2{
/* 		background-color: #66ccff;  */
		padding:20px 0 20px 0; 
 		flex: auto; 
	}


</style>

</head>
<body>
<!-- 网上顶部菜单 -->
	
	<div  class="bgc" style="min-width: 800px;">
		<div style="width:100%;">
			<ul>
				<li><a  href="${pageContext.request.contextPath}/client/index.jsp" >首页</a></li>
				<li> > </li>
				<li><a  href="${pageContext.request.contextPath}/client/myAccount.jsp" >我的账户</a></li>
				<li> > </li>
				<li>我的订单</li>
			</ul>
		</div>	
		<br>
		<div class="box" >
			
			<div class="box2">
				<div style="margin-top: 15px;">
					<table cellspacing="0" border="1" style="text-align: center;width: 100%;">
						<tr>
							<th bgcolor="#CAFFE3" width="15%">订单编号</th>
							<th bgcolor="#CAFFE3" width="10%">收件人</th>
							<th bgcolor="#CAFFE3" width="10%">联系电话</th>
							<th bgcolor="#CAFFE3" width="10%">时间</th>
							<th bgcolor="#CAFFE3" width="25%">收货地址</th>
							<th bgcolor="#CAFFE3" width="10%">订单状态</th>
							
							<th bgcolor="#CAFFE3" width="7%">删除</th>
						</tr>
						
					<c:forEach items="${orderList}" var="o">
						<tr>
						
							<td>${fn:substring(o.getId(),0,30) }</td>
							<td>${o.getReceiverName()}</td>
							<td>${o.getReceiverPhone()}</td>
							<td>${o.getOrdertime()}</td>
							<td>${o.getReceiverAddress()}</td>							
							<td><b>${o.getPaystate()==1?"未支付":"已支付"}</b> </td>
							
							<td>
								<a href="${pageContext.request.contextPath}/DeleteServlet?id=${o.getId()}&role=user">
									<button style="color: #FF0000;" onclick='return deleConfirm()'>X</button></a>
							</td>
						 </tr>
						
					</c:forEach>
					</table>
					 <c:if test="${orderList!=null&&orderList.isEmpty()}">
							<div style="text-align: center; color:#ADADAD;padding-top:10px;"> 😫你的订单空空如也～</div>
						</c:if>
				</div>		
			</div>
		</div>
	</div>
</body>
</html>