<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="listhead">
		<p>订单详细信息</p>
	</div>
	<table border="1"
		style="width: 100%; border-color: #eaf4ff; border-collapse: collapse; border-spacing: 0;">
		<tr height="40px">
			<td class="inquiretd">订单编号：</td>
			<td width="35%">${order.id}</td>
			<td class="inquiretd">所属用户：</td>
			<td width="35%">${order.user.username}</td>
		</tr>
		<tr height="40px">
			<td class="inquiretd">收件人：</td>
			<td width="35%">${order.receiverName}</td>
			<td class="inquiretd">联系电话：</td>
			<td width="35%">${order.receiverPhone}</td>
		</tr>
		<tr height="40px">
			<td class="inquiretd">送货地址：</td>
			<td width="35%">${order.receiverAddress}</td>
			<td class="inquiretd">总价：</td>
			<td width="35%">${order.money}</td>
		</tr>
		<tr height="40px">
			<td class="inquiretd">下单时间：</td>
			<td width="35%">${order.ordertime}</td>
		</tr>
	</table>
	<div class="listhead">
		<p>商品信息</p>
	</div>
	<div class="listdiv">
		<table border="1"
			style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<tr height="30px">
				<td style="text-align: center; background: #79b9ff; width: 10%;">序号</td>
				<td style="text-align: center; background: #79b9ff; width: 20%;">商品编号</td>
				<td style="text-align: center; background: #79b9ff; width: 20%;">商品名称</td>
				<td style="text-align: center; background: #79b9ff; width: 10%;">商品价格</td>
				<td style="text-align: center; background: #79b9ff; width: 10%;">购买数量</td>
				<td style="text-align: center; background: #79b9ff; width: 10%;">商品类别</td>
				<td style="text-align: center; background: #79b9ff; width: 20%;">商品描述</td>
			</tr>
		</table>

		<c:forEach items="${order.orderItems}" var="orderItem"
			varStatus="status">
			<form action=''>
				<table border='1'
					style='width: 100%; border-collapse: collapse; border-top: 0px'>
					<tr>
						<td style='text-align: center; width: 10%;'>${status.count}</td>
						<td style='text-align: center; width: 20%;'>${orderItem.p.id}</td>
						<td style='text-align: center; width: 20%;'>${orderItem.p.name}</td>
						<td style='text-align: center; width: 10%;'>${orderItem.p.price}</td>
						<td style='text-align: center; width: 10%;'>${orderItem.p.pnum}</td>
						<td style='text-align: center; width: 10%;'>${orderItem.p.category}</td>
						<td style='text-align: center; width: 20%;'>${orderItem.p.description}</td>
					</tr>
				</table>
			</form>
		</c:forEach>
	</div>
</body>
</html>