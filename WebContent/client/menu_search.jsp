<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/menu_search.css">
<style>
*{
	margin: 0 auto;
}
.green{
	background-color: greenyellow;
	height: 2px;
}
ul{
	margin-left: -40px;
}
li{
    padding: 2px;
    display: inline;
}
.menu_bar{
	background-color: black;
	text-align: center;
	height: 50px;
	line-height: 50px;/*文字内容垂直居中*/
}
a.menua:link,a.menua{
	color: white;
    text-align: center;
    padding: 10px;
    text-decoration: none;
}
.ul li:last-of-type a{
	color: #ADFF2F;
}
.search{
	width: 100%;
	height: 50px;
	background-color: orange;
}
.search_btn{
	border: 1px solid ;
	border-color: green;
	height: 21.5px;
	width: 50px;
	line-height: 19.5px;
	vertical-align: bottom;
	margin-left: 5px;
	color: snow;
	background-color: mediumaquamarine;
}
.form{
	margin-left: 610px;
	padding: 10px;
}



</style>

</head>
<body>
	<div class="green"><br /></div>
    <div class="menu_bar">
        <ul class="menu_ul">
            <li><a href="#" class="menua">文学</a></li>
            <li><a href="#" class="menua">生活</a></li>
            <li><a href="#" class="menua">计算机</a></li>
            <li><a href="#" class="menua">外语</a></li>
            <li><a href="#" class="menua">经管</a></li>
            <li><a href="#" class="menua">励志</a></li>
            <li><a href="#" class="menua">社科</a></li>
            <li><a href="#" class="menua">学术</a></li>
            <li><a href="#" class="menua">少儿</a></li>
            <li><a href="#" class="menua">艺术</a></li>
            <li><a href="#" class="menua">原版</a></li>
            <li><a href="#" class="menua">科技</a></li>
            <li><a href="#" class="menua">考试</a></li>
            <li><a href="#" class="menua">生活百科</a></li>
            <li><a href="${pageContext.request.contextPath}/product?method=findByPage&currPage=1" class="menua">全部商品目录</a></li>
        </ul>
    </div>
    <div class="search">
    	<!--<form class="form" action="${pageContext.request.contextPath}/SearchServlet" method="post" accept-charset="UTF-8">search
    		<input type="text" name="search" placeholder="请输入书名">
    		<button type="submit">搜索</button>		
		</form>-->
    	<form class="form" action="${pageContext.request.contextPath }/MenuSearchServlet?action=search" method="post" accept-charset="UTF-8">search
    		<input type="text" name="search" placeholder="请输入书名">
    		<button type="submit">搜索</button>		
		</form>  
       
    </div>
    </div>
</body>
</html>