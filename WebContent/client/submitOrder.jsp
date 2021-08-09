<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@include file="head.jsp"%>
<%@ include file="menu_search.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" >
<!-- http-equiv="Refresh" content="5,url=index.jsp" -->
<title>订单提交成功</title>
<script type="text/javascript" >
var interval;

function startSecond() {
	interval = window.setInterval("changeSecond()", 1000);
};
function changeSecond() {
	var second = document.getElementById("second");
	var svalue = second.innerHTML;
	svalue = svalue - 1;
	if (svalue == 0) {
		window.clearInterval(interval);
		location.href = "../MyOrderList";
		return;
	}
	second.innerHTML = svalue;
}

</script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css"/>

</head>
<body style="overflow:scroll;overflow-x:hidden;"  onload="startSecond()">
	
	
	<div  class="bgc">
		<div style="text-align: center; padding-top: 50px;">
			
			<p style="color:#558B2F	; font-weight: bold;font-size: 30px;margin: 0 0 20px 0;">订单提交成功！</p>
			<a href="${pageContext.request.contextPath }/MyOrderList" style="color: grey;">
				<span id="second" >3</span>秒后自动为您跳转到订单列表
			</a>
		</div>	
	</div>
	
</body>
</html>