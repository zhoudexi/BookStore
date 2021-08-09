<%@include file="head.jsp"%>
<%@ include file="menu_search.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>下单</title>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/Popt.js"></script>
<script src="js/cityJson.js"></script>
<script src="js/citySet.js"></script>
<style type="text/css">
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
.bgc {
    width: device-width;
    background-color: #FFFFF3;
    foat: left;
    line-height: 30px;
    padding: 20px;
    margin-bottom: 20px;
    margin: 100px;
    margin-top: 0px;
    margin-bottom: 0px;
    border: solid aliceblue 0.125rem;
    border-top: 0px;
    min-width: 700px;
    margin-bottom: 50px;
}
ul {
    margin: 0px;
    padding: 0px;
    list-style-type: none;
    font-size: 100%;
}
li {
    float: left;
    padding: 0 2px;
    margin: 0px;
    list-style-type: none;
    display: list-item;
}
	.box{
		
		flex-flow: row;
		align-items: top;
		align-content: top;
	}
	.box2{
/* 		background-color: #66ccff;  */
		margin-left:20px;
 		flex: auto; 
 		width: 80%;
 		margin: 0 auto;
	}
	.box2_1{
	margin-left: 300px;
	}
</style>

</head>
<body>
	<div  class="bgc">
		<div style="margin-bottom: 10px;width: 1500px">
			<ul>
				<li><a  href="${pageContext.request.contextPath}/QueryProductByPage" >首页</a></li>
				<li> > </li>
				<li><a  href="${pageContext.request.contextPath}/CartServlet?op=show" >购物车</a></li>
				<li> > </li>
				<li>确认订单</li>
			</ul>
		</div>	<br>
		<div class="box">
			<div style="width: 100%">
				<table cellspacing="0" style="text-align: center;">
					<tr style="background-color:#CAFFE3;">
						<th width="13%" >序号</th>
						<th width="26%">商品名称</th>
						<th width="13%">价格</th>
						<th width="13%">库存</th>
						<th width="10%">数量</th>
						<th width="15%">小计</th>
					</tr>
				
					<c:forEach items="${cart.getCartitems()}" var="ci" varStatus="count">
							<c:set var="totalMoney" scope="page" value="${ci.getNum()*ci.getProduct().getPrice()}" />
							<tr>
								<td>${count.count}</td>
								<td>${ci.getProduct().getName()}</td>
								<td>${ci.getProduct().getPrice()}</td>
								<td>${ci.getProduct().getPnum()}</td>
								<td>${ci.getNum()}</td>
								<td style="text-align: center;">${totalMoney}</td>
							</tr>
						</c:forEach>
				</table>
				<c:if test="${cart.getCartitems()!=null&&cart.getCartitems().isEmpty()}">
					<div style='text-align: center; color:#ADADAD;padding-top:10px;'> 😫购物车里空空如也～</div>
				</c:if>
				<table cellspacing="0">
					<tr style="background-color:#CAFFE3;">
						<td style="text-align: right; color: #FF0000; font-weight: bold;
						 padding-right: 10px;">合计：${cart.getMoney()} 元</td>
					</tr>
				</table>
			</div>	
			
			<div class="box2" style="background-color:#CAFFE3;;padding: 30px; box-shadow:0px 0px 20px 16px #FFFFF3 inset;">
				<form action="${pageContext.request.contextPath}/OrderServlet?op=create&money=${cart.getMoney()}" method="post">
					<div class="box2_1">
							收&nbsp;货 &nbsp;人&nbsp;：<input name="receiverName" type="text"
							style="width:20%;border-style: none;border: gray thin solid; margin-right: 5%;" />
							联系方式：<input type="text" name="receiverPhone"
							style="width:30%;border-style: none;border: gray thin solid;" />
						<br /> 
							收货地址：<input name="receiverAddress" type="text" id="city" 
							style="width:60%; border-style: none;border: gray thin solid;" />
							<script type="text/javascript">
								$("#city").click(function (e) {
									SelCity(this,e);
								});
					</div>
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