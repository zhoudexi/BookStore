<%@include file="head.jsp"%>
<%@ include file="menu_search.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/ctr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/Popt.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/cityJson.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/citySet.js"></script>
<style>
@charset "UTF-8";
* { -ms-word-wrap: break-word; word-wrap: break-word; }
html { -webkit-text-size-adjust: none; text-size-adjust: none; }
html, body, h1, h2, h3, h4, h5, h6, div, ul, ol, li, dl, dt, dd, iframe, textarea, input, button, p, strong, b, i, a, span, del, pre, table, tr, th, td, form, fieldset, .pr, .pc { margin: 0; padding: 0; word-wrap: break-word; font-family: verdana,Microsoft YaHei,Tahoma,sans-serif; *font-family: Microsoft YaHei,verdana,Tahoma,sans-serif; }
body, ul, ol, li, dl, dd, p, h1, h2, h3, h4, h5, h6, form, fieldset, .pr, .pc, em, del { font-style: normal; font-size: 100%; }
ul, ol, dl { list-style: none; }
._citys { width: 450px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative; }
._citys span { color: #56b4f8; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #56b4f8; cursor: pointer; }
._citys0 { width: 100%; height: 34px; display: inline-block; border-bottom: 2px solid #56b4f8; padding: 0; margin: 0; }
._citys0 li { display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer; }
.citySel { background-color: #56b4f8; color: #fff !important; }
._citys1 { width: 100%; display: inline-block; padding: 10px 0; }
._citys1 a { width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden; }
._citys1 a:hover { color: #fff; background-color: #56b4f8; }
.AreaS { background-color: #56b4f8 !important; color: #fff !important; }
body.goods-list {
	width: 100%;
	background: snow;
	text-align: center;
}

.books {
	width: 65%;
	height: 470px;
	margin: 10px auto 0px auto;
	background: #fcfdef;
	border-style: solid;
	border-color: #cccccc;
}

.p2 {
	padding: 5px 5px;
	text-align: left;
	font-size: 16px;
	border-bottom: solid 2px #c0c0c0;
}

.p1 {
	font-weight: bold;
	font-size: 18px;
}

.books-td {
	width: 300px;
}

.books-td img {
	width: 115px;
	height: 155px;
	background-color: white;
	border-style: solid;
	border-color: #cccccc;
	border-width: 1px;
	padding: 6px;
}

.PLtable {
	text-align: center;
}

.Cart {
	position: relative;
	width: 65%;
	margin: 0 auto;
	padding: 10px;
	background: #fcfdef;
	border: 2px solid;
	border-color: #cccccc;
}

.p3 {
	font-weight: bold;
	padding: 10px 0;
	width: 65%;
	margin: 0 auto;
	text-align: right;
}

.goods-info {
	background: #e1ffe1;
	border: solid 2px #cccccc;
	width: 100%;
}

.goods-price {
	background: #e1ffe1;
	border: solid 2px #cccccc;
	width: 100%;
	margin-top: 20px;
}

#buy0, #buy1, #buy2, #buy3 {
	padding: 8px 8px;
}
</style>
<meta charset="UTF-8">
<title>购物车</title>
</head>
<body>
	<div class="p3">
		<a href="index.jsp">首页</a>&nbsp;>&nbsp;确认定单
	</div>
	<div class="Cart">
		<div class="goods-info">
			<table width='100%' border='0' cellspacing='0'>
				<tr height="30">
					<td width='13%'>序号</td>
					<td width='21%'>商品名称</td>
					<td width='13%'>价格</td>
					<td width='10%'>库存</td>
					<td width='10%'>数量</td>
					<td width="10%">小计</td>
					<td width='20%'>删除</td>
				</tr>

				</div>
				<c:forEach items="${cart.getCartitems()}" var="ci" varStatus="count">
					<c:set var="totalMoney" scope="page"
						value="${ci.getNum()*ci.getProduct().getPrice()}" />
					<tr>
						<td>${count.count}</td>
						<td>${ci.getProduct().getName()}</td>
						<td>${ci.getProduct().getPrice()}</td>
						<td>${ci.getProduct().getPnum()}</td>
						<td>${ci.getNum()}</td>
						<td>${totalMoney}</td>
						<td><a
							href="${pageContext.request.contextPath}
							/CartServlet?op=delete&money=${totalMoney}&product_id=${ci.getProduct().getId()}">
								<button style="color: #FF0000;" onclick='return deleConfirm()'>X</button>
						</a></td>
					</tr>
				</c:forEach>
			</table>
			<c:if
				test="${cart.getCartitems()!=null&&cart.getCartitems().isEmpty()||cart==null}">
				<div style='text-align: center; color: #ADADAD; padding-top: 10px;'>
					😫购物车里空空如也～</div>
			</c:if>
			<table cellspacing="0" style="margin-top: 30px; margin-bottom: 10px;">
				<tr style="background-color: #CAFFE3;">
					<td
						style="text-align: right; color: #FF0000; font-weight: bold; padding-right: 30px;">合计：
						¥ ${cart.getMoney()}</td>
				</tr>
			</table>
			<div class="box2" style="background-color: #FFF8E1;padding: 30px; box-shadow:0px 0px 20px 16px #FFFFF3 inset;">
				<form action="${pageContext.request.contextPath}/OrderServlet?op=create&money=${cart.getMoney()}" method="post">
					<div>
							收 货 人 ：<input name="receiverName" type="text"
							style="width:20%;border-style: none;border: gray thin solid; margin-right: 5%;" />
							联系方式：<input type="text" name="receiverPhone"
							style="width:30%;border-style: none;border: gray thin solid;" />
						<br /> 
							收货地址：<input id="city" name="receiverAddress" type="text" 
							style="width:62.5%; border-style: none;border: gray thin solid;" />
							
					</div>
					<script type="text/javascript">
								$("#city").click(function (e) {
									SelCity(this,e);
								});
								</script>
					<div style="text-align: center;margin-top: 10px;">
						<a href="${pageContext.request.contextPath}/product?method=findByPage&currPage=1">
							<button type="button" class="btn2">继续购物</button>
						</a>
						<button class="btn2">下单</button>
					</div>
				</form>
			</div>
		</div>

		</div>
</body>
</html>
