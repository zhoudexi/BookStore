<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<%@ include file="menu_search.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<title>网上书城首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/autoplay.css">
    <script type="text/javascript" src="js/autoplay.js"></script>
<style>
*{  
    margin:0;  
    padding:0;  
}  
ul.autoplayul{  
    list-style-type:none;  
}  
body.autoplaybody {
	width: 100;
    background:snow;  
    text-align:center;  
}  
#box_autoplay {  
    position:relative;  
    width:885px;  
    height:335px;  
    background:#fff;  
    border-radius:5px;  
    border:8px solid #fff;  
    margin:10px auto;  
    cursor:pointer;  
} 
#box_autoplay .list {  
    position:relative;  
    width:900px;  
    height:335px;  
    overflow:hidden;  
}  
#box_autoplay .list ul {  
    position:absolute;  
    top:0;  
    left:0;  
}  
#box_autoplay .list li {  
    width:900px;  
    height:335px;  
    overflow:hidden;  
}  
#box_autoplay .count {  
    position:absolute;  
    right:0;  
    bottom:5px;  
}  
#box_autoplay .count li {  
    color:#fff;  
    float:left;  
    width:20px;  
    height:20px;  
    cursor:pointer;  
    margin-right:5px;  
    overflow:hidden;  
    background:#F90;  
    opacity:0.7;  
    filter:alpha(opacity=70);  
    border-radius:20px;  
}  
#box_autoplay .count li.current {  
    color:#fff;  
    opacity:1;  
    filter:alpha(opacity=100);  
    font-weight:700;  
    background:#f60;  
}  
#tmp {  
    width:100px;  
    height:100px;  
    background:red;  
    position:absolute;  
}
.info{
	margin: 0 auto;
	height:210px;
	width:900px;
	background-color: #dfffcd;
	text-align: left;
}.infodiv1{
	display: inline-block;
	height:335px;
	width:450px;
}.infodiv2{
	position: relative;
	bottom: 335px;
	left: 525px;
	display: inline-block;
	height:335px;
	width:450px;
}  
.infod1{
	position: relative;
	top: 5px;
	left: 10px;
	width: 30px;
	display: inline-block;
	height: 50px;
}
.infod2{
	position: relative;
	left: 5px;
	bottom: 3px;
	width: 300px;
	display: inline-block;
	height: 5px;
	background-color: green;
}  
.infod3{
	position: relative;
	top: 5px;
	left: 10px;
	width: 30px;
	display: inline-block;
	height: 50px;
}    
    
    
    </style>
</head>
<body class="autoplaybody">
    <div id="box_autoplay">
        <div class="list">
            <ul class="autoplayul">
                <li><img src="images/ad/index_ad1.jpg" width="900" height="335"></li>
                <li><img src="images/ad/index_ad2.jpg" width="900" height="335"></li>
                <li><img src="images/ad/index_ad3.jpg" width="900" height="335"></li>
            </ul>
        </div>
    </div>

    <div class="info">
        <div class="infodiv1">
            <div class="infod1">
                <img src="images/billboard.gif">
            </div>
            <c:forEach items="${notice}" var="notice">
            <br />notice.title<br />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp为了大家有更好的购物体验，3月25日起，当日达业务关小黑屋回炉升级！<br />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp具体开放时间请留意公告，感谢大家的支持与理解，祝大家购物愉快！
            </c:forEach>
        </div>

        <div class="infodiv2">
            <div class="infod3">
                <img src="images/timg.jpg" width="25" height="25"><br />
            </div>
            本周热卖
        </div>
    </div>
    <br/>
</body>
</html>
<%@ include file="foot.jsp" %>

