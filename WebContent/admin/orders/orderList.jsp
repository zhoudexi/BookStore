<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.listhead {
	text-align: center;
	background-clip: blue;
	background: #79b9ff;
}
.list-Title td{
	text-align: center;
    width:10%;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="listhead">
		<p>查询条件</p>
	</div>
	<form
		action="${pageContext.request.contextPath }/FindOrdersByIdServlet"
		method="post">
		<table
			style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<tr height="40px">
				<td class="inquiretd">订单编号：</td>
				<td><input type="text" name="id"></td>
				<td class="inquiretd">收件人：</td>
				<td><input type="text" name="receiverName"></td>
			</tr>
			<tr height="40px">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td class="inquiretable"><button
						style="margin-right: 20px; height: 30px; width: 50px;">查询</button>
					<button style="margin: 0, 5px; height: 30px; width: 50px;">重置</button></td>
			</tr>
		</table>
	</form>
	<div class="listhead">
		<p>订单列表</p>
	</div>
	<div class="listdiv">
		<table border="1"
			style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<tr height="30px" class="list-Title">
				<td>订单编号</td>
				<td>收件人</td>
				<td style=" width: 20%;">地址</td>
				<td>联系电话</td>
				<td>总价</td>
				<td>所属用户</td>
				<td>支付状态</td>
				<td>查看</td>
				<td>删除</td>
			</tr>
		</table>

		<c:forEach items="${orders}" var="order">
			<form action=''>
				<table border='1'
					style='width: 100%; border-collapse: collapse; border-top: 0px'>
					<tr>
						<td style='text-align: center; width: 10%;'>${order.id}</td>
						<td style='text-align: center; width: 10%;'>${order.receiverName}</td>
						<td style='text-align: center; width: 20%;'>${order.receiverAddress}</td>
						<td style='text-align: center; width: 10%;'>${order.receiverPhone}</td>
						<td style='text-align: center; width: 10%;'>${order.money}</td>
						<td style='text-align: center; width: 10%;'>${order.user.username}</td>
						<td style='text-align: center; width: 10%;'>${order.paystate == 0 ? "支付":"未支付"}</td>
						<td style='text-align: center; width: 10%;'><a
							href="${pageContext.request.contextPath}/FindOrderByIdServlet?id=${order.id}"><img
								src='${pageContext.request.contextPath}/admin/images/bianji.png'
								width='20' height='20' name='submit' /></a></td>
						<td style='text-align: center; width: 10%;'><a
							href="${pageContext.request.contextPath}/DelOrderByIdServlet?id=${order.id}"><img
								src='${pageContext.request.contextPath}/admin/images/delete.png'
								width='20' height='20' name='submit' /></a></td>
					</tr>
				</table>
			</form>
		</c:forEach>
	</div>
</body>
</html>