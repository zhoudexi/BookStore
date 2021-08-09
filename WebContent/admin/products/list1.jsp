<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="domain.Product"%> 
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/confirm.js"></script>
<style type="text/css">
@charset "UTF-8";

.bb{
	height:100%;
	width:100%;
	overflow: hidden;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
    color:#000;
    margin: 0;
    padding: 0;
    overflow:scroll;
	overflow-x:hidden;
}

	.container{
		width:100%;
		height:100%;
		min-width: 700px;
	}
	.tittlebar{
		width:100%;
		height: 30px;
		margin:0;
		padding:0;
		line-height:30px;
		text-align:center;
		font-weight:bolder;
		background-color: #79b9ff;
	}
	.item{
		background-color: #e0f2f1;
		text-align: center;
	}
	.welcontent{
		width:100%;
		margin:0;
		padding:0;
		text-align:center;
	}
	
	select{
		text-align:center;
		text-align-last: center;
	}

	option {
		text-align-last:center; 
	}
.gao{
	
	line-height: 50px;
}

</style>

</head>
<body class="bb">
	<div class="container">
		<div class="tittlebar">查询条件</div>
			<div >
				<form action="${pageContext.request.contextPath}/ProductListServlet?" method="post">
				<table cellspacing="0" style="line-height: 30px; width: 100%;">
					<tr>
						<td class="item" width="15%">商品编号：</td>
						<td width="35%"><input name="pnum" type="text" style="border:none; border-bottom: solid thin black;"> </td>
						<td class="item" width="15%">类别：</td>
						<td width="35%">
							<select name="category">
								<option value="" selected="selected">--选择商品类加--</option>
								<option value="文学">文学</option><option value="生活">生活</option>
								<option value="计算机">计算机</option><option value="外语">外语</option>
								<option value="经营">经营</option><option value="励志">励志</option>
								<option value="社科">社科</option><option value="学术">学术</option>
								<option value="少儿">少儿</option><option value="艺术">艺术</option>
								<option value="原版">原版</option><option value="科技">科技</option>
								<option value="考试">考试</option><option value="生活百科">生活百科</option>
					    	</select>
						</td>
					</tr>
					<tr>
						<td class="item">商品名称：</td>
						<td><input name="name" type="text" style="border:none; border-bottom: solid thin black;"> </td>
						<td class="item">价格区间(元)：</td>
						<td><input name="minprice" type="number" style="width: 80px;"> - 
							<input name="maxprice" type="number" style="width: 80px;"></td>
					</tr>
					<tr>
						<td class="item" colspan="4" style="text-align: right; padding-right: 40px;">
							<input type="submit" name="search" value="查询" style="margin-right: 20px;" >
							<input type="reset" value="重置">
						</td>
					</tr>
				</table>
				</form>
			</div>
		<div class="tittlebar">商品列表</div>
		<div style="text-align: right; margin: 5px; padding-right: 90px;">
			<input type="button" name="add" value="添加" onclick=
			"window.location.href='${pageContext.request.contextPath}/admin/login/home.jsp?item=<%="product_add"%>'">
		</div>
		<div>
			<table cellspacing="0" border="1" style="text-align: center;width: 100%;">
				<tr style="background-color: #79b9ff;">
					<th width="20%">商品编号</th>
					<th width="15%">商品名称</th>
					<th width="10%">商品价格</th>
					<th width="10%">商品数量</th>
					<th width="10%">商品类别</th>
					
					<th width="10%">删除	</th>
				</tr>
				<c:forEach items="${productList}" var="p">
					<tr class="gao">
						<td width='20%'>${p.getId()}</td>
						<td width='15%'>${p.getName()}</td>
						<td width='10%'>${p.getPrice()}</td>
						<td width='10%'>${p.getPnum()}</td>
						<td width='10%'>${p.getCategory()}</td>
						
						<td width='10%'>
							<a href="${pageContext.request.contextPath}/DeleteProductServlet?id=${p.getId()}">
							<button style='color: #FF0000;font-weight: bold;' onclick='return deleConfirm()'>X</button></a>
					</tr>
				</c:forEach>
			</table>
		</div>		
	</div>
</body>
</html>