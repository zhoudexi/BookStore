<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<style>
@charset "UTF-8";
*{
	padding: 0;
	margin: 0;
}
.toptext{
	text-align: center;
	line-height: 100px;
	height: 100px;
	background: orange;
}
.topdh{
	height: 30px;
	background-color: #dadada;
}
.topblack{
	width: 100%;
	height: 8px;
	background: black;
}
.topdate{
	display: inline-block;
	position:relative;
	left:30px;
	line-height: 25px;
}
.top_btn{
	position:absolute;
	right: 0;
	line-height:22px;
	display: inline-block;
	text-align: center;
}
.top_btn button{
	margin-right:25px;
	margin-top:2px;
	width: 100px;
	height: 25px;
	line-height:22px;
	text-align: center;
	font-size: 15px;
}
.left{
	display: inline-block;
	width: 12%;
	height: 550px;
	background: #e7e7e7;	
}
.lef_top{
	height: 30px;
}

.ul{
	text-align: center;
}
.ul li{
	line-height: 50px;
	border-bottom: dotted 2px #dadada;
}

a.menu:link,a.menu{
    text-align: center;
    color: black;
    text-decoration: none;
}

.welcome{
	display: inline-block;
	position:absolute;
	width: 88%;
	height: 550px;
}
.welcome_head{
	background-color: #f49f00;
	text-align: center;
	line-height: 27px;
	font-weight: bold;
}
.welcome_text{
	width: 100%;
	height: 200px;
	text-align: center;
}

.bottom{
	width: 100%;
	height: 81px;
	background: #9cd625;
	text-align: center;
	line-height: 50px;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<div class="toptext">
		<h1>网上书城后台管理系统</h1>
	</div>
	<div class="topblack"></div>
	<div class="topdh">
		<div class=topdate>
			<%
				Date date=new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				String date_cn = "";
				String dateStr = "";
				switch(cal.get(Calendar.DAY_OF_WEEK)){
					case 1:date_cn = "日";break;
					case 2:date_cn = "一";break;
					case 3:date_cn = "二";break;
					case 4:date_cn = "三";break;
					case 5:date_cn = "四";break;
					case 6:date_cn = "五";break;
					case 7:date_cn = "六";break;
				}
				dateStr = cal.get(Calendar.YEAR)+"年"+
				(cal.get(Calendar.MONTH)+1)+"月"+
				cal.get(Calendar.DAY_OF_MONTH)+"日 星期"+date_cn;
				out.print(dateStr);
			%>
		</div>
		<div class="top_btn">
			<button type="button">退出系统</button>
		</div>
	</div>

</body>
</html>