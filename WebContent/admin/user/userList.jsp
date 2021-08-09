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
				<td class="inquiretd">用户id：</td>
				<td><input type="text" name="id"></td>
				<td class="inquiretd">用户名：</td>
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
		<p>用户列表</p>
	</div>
	<div class="listdiv">
		<table border="1"
			style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<tr height="30px" class="list-Title">
				<td style='text-align: center; width: 10%;'>用户名</td>
				<td style='text-align: center; width: 10%;'>密码</td>
				<td style='text-align: center; width: 10%;'>性别</td>
				<td style='text-align: center; width: 20%;'>邮箱</td>
				<td style='text-align: center; width: 10%;'>联系电话</td>
				<td style='text-align: center; width: 10%;'>介绍</td>
				<td style='text-align: center; width: 10%;'>用户角色</td>
				<td style='text-align: center; width: 10%;'>注册时间</td>
				<td style='text-align: center; width: 10%;'>删除</td>
			</tr>
		</table>
		<c:forEach items="${users}" var="user">
			<form action=''>
				<table border='1'
					style='width: 100%; border-collapse: collapse; border-top: 0px'>
					<tr>
						<td style='text-align: center; width: 10%;'>${user.username}</td>
						<td style='text-align: center; width: 10%;'>${user.password}</td>
						<td style='text-align: center; width: 10%;'>${user.gender}</td>
						<td style='text-align: center; width: 20%;'>${user.email}</td>
						<td style='text-align: center; width: 10%;'>${user.telephone}</td>
						<td style='text-align: center; width: 10%;'>${user.introduce}</td>
						<td style='text-align: center; width: 10%;'>${user.role}</td>
						<td style='text-align: center; width: 10%;'>${user.registtime}</td>
						<td style='text-align: center; width: 10%;'><a
							href="${pageContext.request.contextPath}/DelOrderByIdServlet?id=${user.id}"><img
								src='${pageContext.request.contextPath}/admin/images/delete.png'
								width='20' height='20' name='submit' /></a></td>
					</tr>
				</table>
			</form>
		</c:forEach>
	</div>
</body>
</html>