<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.listhead {
	text-align: center;
	background-clip: blue;
	background: #79b9ff;
}

tr {
	height: 40px;
}

td.date {
	text-align: center;
	background: #eaf4ff;
	width: 15%;
}

.month {
	height: 25px;
	text-align: center;
}
.btn1{
 	height: 30px; 
 	width: 50px;
 	margin-right: 20px;
}
.btn1{
 	height: 30px; 
 	width: 50px;
 	margin-right: 20px;
}
.btn2{
 	height: 30px; 
 	width: 50px;
 	margin-right: 20px;
 	margin: 0, 5px;
}
</style>
</head>
<body>
	<div class="listhead">
		<p>查询条件</p>
	</div>
	<form action="${pageContext.request.contextPath }/DownloadServlet"
		method="post">
		<table
			style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<tr>
				<td class="date">请输入年份：</td>
				<td><input type="text" name="year"></td>
				<td class="date">请选择月份：</td>
				<td><select name="month" class="month">
						<option value="empty">--选择月份--</option>
						<option value="01">--1月--</option>
						<option value="02">--2月--</option>
						<option value="03">--3月--</option>
						<option value="04">--4月--</option>
						<option value="05">--5月--</option>
						<option value="06">--6月--</option>
						<option value="07">--7月--</option>
						<option value="08">--8月--</option>
						<option value="09">--9月--</option>
						<option value="10">--10月--</option>
						<option value="11">--11月--</option>
						<option value="12">--12月--</option>
				</select></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<button class="btn1" style="margin-right: 20px;">下载</button>
					<button class="btn1" style="margin: 0,5px;">重置</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>