<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="domain.Product,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table {
	    width: 100%;
	    border-collapse: collapse;
	    border-spacing: 0;
	}
	tr{
		height:40px;
	}
	.listhead {
		text-align: center;
		background-clip: blue;
		background: #79b9ff;
	}
	.tianjia {
	    text-align: right;
	    padding: 5px;
	}
	.tianjia Button{
		margin-right: 20px;
		height: 30px; 
		width: 50px;
	}
	tr.title {
	    text-align: center;
	    background: #79b9ff;
	}
	.title2{
		text-align: center;
	}
</style>
<meta charset="UTF-8">
</head>
<body>
	<div class="listhead">
		<p>查询条件</p>
	</div>
	<form>
		<table>
			<tr>
				<td>商品编号：</td>
				<td><input type="text"></td>
				<td>类别：</td>
				<td><select style="height: 25px;">
						<option value="volvo">--选择商品类别--</option>
				</select></td>
			</tr>
			<tr>
				<td>商品名称：</td>
				<td><input type="text"></td>
				<td>价格区间(元)：</td>
				<td><input type="text">-<input type="text"></td>
			</tr>
			<tr>
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
		<p>商品列表</p>
	</div>
	<div class="tianjia">
		<a href="${pageContext.request.contextPath}/admin/login/home.jsp?item=<%="product_add"%>">
		<button>添加</button></a>
	</div>
	<div class="listdiv">
		<table border="1">
			<tr height="30px" class="title">
				<td style=" width: 30%;">商品编号</td>
				<td style=" width: 20%;">商品名称</td>
				<td style=" width: 10%;">商品价格</td>
				<td style=" width: 10%;">商品数量</td>
				<td style=" width: 10%;">商品类别</td>
				<td style=" width: 10%;">编辑</td>
				<td style=" width: 10%;">删除</td>
			</tr>
		</table>
		<jsp:useBean id="products" class="domain.Product"></jsp:useBean>
		<%List<Product> ps = products.searchAll();
			for (Product p : ps) {
				out.println("<form action=''>");
				out.println("<table border='1'>");
				out.println("<tr >");
				out.println("<td style='text-align: center; width: 30%;'>" + p.getId() + "</td>");
				out.println("<td style='text-align: center; width: 20%;'>" + p.getName() + "</td>");
				out.println("<td style='text-align: center; width: 10%;'>" + p.getPrice() + "</td>");
				out.println("<td style='text-align: center; width: 10%;'>" + p.getPnum() + "</td>");
				out.println("<td style='text-align: center; width: 10%;'>" + p.getCategory() + "</td>");
				out.println(
						"<td style='text-align: center; width: 10%;'><input type='image' src='../images/bianji.png' width='20' height='20' name='submit'/></td>");
				out.println(
						"<td style='text-align: center; width: 10%;'><input type='image' src='../images/delete.png' width='20' height='20' name='submit'/></td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</form>");}%>
	</div>
</body>
</html>