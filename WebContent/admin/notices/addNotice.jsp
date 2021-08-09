<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="listhead">
		<p>添加公告</p>
	</div>
	<form action="${pageContext.request.contextPath }/NoticeAddServlet"
		method="post">
		<table border="1"
			style="width: 100%; border-color: #eaf4ff; border-collapse: collapse; border-spacing: 0;">
			<tr height="40px">
				<td class="inquiretd">公告标题：</td>
				<td width="35%"><input type="text" name="title"></td>
			</tr>
			<tr height="40px">
				<td class="inquiretd">公告内容：</td>
				<td colspan="3"><textarea rows="7" cols="120" name="details"></textarea></td>
			</tr>
			<tr height="40px">
				<td style="text-align: center; background: #eaf4ff;" colspan="4">
					<button type="submit"
						style="margin-right: 20px; height: 30px; width: 50px;">确定</button>
					<button type="reset"
						style="margin-right: 20px; height: 30px; width: 50px;">重置</button>
					<button style="margin-right: 20px; height: 30px; width: 50px;">返回</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>