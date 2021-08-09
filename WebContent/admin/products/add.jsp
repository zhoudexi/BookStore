<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table {
	    width: 100%;
	    border-color: #eaf4ff;
	    border-collapse: collapse;
	    border-spacing: 0;
	}
	tr{
	 	height:40px;
	}
	td.title {
    	text-align: center;
	}
	.width35{
		width：35%;
	}
	.btn {
    margin-right: 20px;
    height: 30px;
    width: 50px;
}
</style>
</head>
<body>
	<div class="listhead">
		<strong>添加商品</strong>
	</div>
	<form action="add-handle.jsp">
		<table border="1">
			<tr>
				<td class="title">商品名称：</td>
				<td class="width35"><input type="text" id="name" name="name"></td>
				<td class="title">商品价格：</td>
				<td class="width35"><input type="text" id="price" name="price"></td>
			</tr>
			<tr>
				<td class="title">商品数量：</td>
				<td class="width35"><input type="text" id="pnum" name="pnum"></td>
				<td class="title">商品类别：</td>
				<td class="width35"><select style="height: 25px;" id="category"
					name="category">
						<option value="">--选择商品类别--</option>
						<option value="计算机">--计算机--</option>
						<option value="电子">--电子--</option>
						<option value="文学">--文学--</option>
						<option value="生活">--生活--</option>
						<option value="外语">--外语--</option>
				</select></td>
			</tr>
			<tr>
				<td class="title">商品图片：</td>
				<td colspan="3"><input id="File1" type="file" id="imgurl"
					name="imgurl" /></td>
			</tr>
			<tr>
				<td class="title">商品描述：</td>
				<td colspan="3"><textarea rows="7" cols="120" id="description"
						name="description"></textarea></td>
			</tr>
			<tr>
				<td style="text-align: center; background: #eaf4ff;" colspan="4">
					<button type="submit" class="btn">确定</button>
					<button type="reset" class="btn">重置</button>
					<button class="btn">返回</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>