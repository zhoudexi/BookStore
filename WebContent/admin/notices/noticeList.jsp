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
				<p>公告列表</p>
			</div>
			<form action="${pageContext.request.contextPath}/admin/login/home.jsp?item=<%="Notice_Add"%>" method="post">
			<table style="width: 100%;border-collapse: collapse; border-spacing: 0;">
			     <tr height="40px" >
			      	<td ></td>
			        <td ></td>
			        <td ></td>
			        <td ></td>
			        <td class="inquiretable"><button style="margin-right: 20px; height: 30px; width: 50px;">添加</button></td>
			    </tr>
			</table>
			</form>
			<div class="listdiv">
				<table border="1" style="width: 100%;border-collapse: collapse; border-spacing: 0;">
				    <tr height="30px">
				        <td style="text-align: center; background: #79b9ff; width: 10%;">公告编号</td>
				        <td style="text-align: center; background: #79b9ff; width: 20%;">公告标题</td>
				        <td style="text-align: center; background: #79b9ff; width: 30%;">公告内容</td>
				        <td style="text-align: center; background: #79b9ff; width: 20%;">时间</td>
				        <td style="text-align: center; background: #79b9ff; width: 10%;">编辑</td>
				        <td style="text-align: center; background: #79b9ff; width: 10%;">删除</td>
				    </tr >
				</table>
				<c:forEach items="${notices}" var="notice">
				<form action=''>
				<table border='1' style='width: 100%;border-collapse: collapse;border-top:0px'>
				<tr >
				<td style='text-align: center; width: 10%;'>${notice.n_id}</td>
				<td style='text-align: center; width: 20%;'>${notice.title}</td>
				<td style='text-align: center; width: 30%;'>${notice.details}</td>
				<td style='text-align: center; width: 20%;'>${notice.n_time}</td>
				<td style='text-align: center; width: 10%;'><a href="${pageContext.request.contextPath}/NoticeEditServlet?id=${notice.n_id}&method=findById"><img  src='${pageContext.request.contextPath}/admin/images/bianji.png' width='20' height='20' name='submit'/></a></td>
				<td style='text-align: center; width: 10%;'><a href="${pageContext.request.contextPath}/NoticeDelServlet?id=${notice.n_id}"><img  src='${pageContext.request.contextPath}/admin/images/delete.png' width='20' height='20' name='submit'/></a></td>
				</tr>
				</table>
				</form>
				</c:forEach>
			</div>
</body>
</html>