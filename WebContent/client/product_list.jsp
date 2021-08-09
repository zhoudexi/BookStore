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
<title>全部商品目录</title>
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.row:after, .row:before {
	display: table;
	content: " "
}
.breadcrumb{padding:8px 15px;margin-bottom:20px;list-style:none;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block}.breadcrumb>li+li:before{padding:0 5px;color:#ccc;content:"/\00a0"}.breadcrumb>.active{color:#777}.pagination{display:inline-block;padding-left:0;margin:20px 0;border-radius:4px}
.btn-group-vertical>.btn-group:after, .btn-toolbar:after, .clearfix:after,
	.container-fluid:after, .container:after, .dl-horizontal dd:after,
	.form-horizontal .form-group:after, .modal-footer:after, .nav:after,
	.navbar-collapse:after, .navbar-header:after, .navbar:after, .pager:after,
	.panel-body:after, .row:after {
	clear: both
}

.col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6,
	.col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11,
	.col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6,
	.col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11,
	.col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6,
	.col-xs-7, .col-xs-8, .col-xs-9 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
	margin-bottom: 15px;
	
}



@media ( min-width :992px) {
	.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3,
		.col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9 {
		float: left
	}
	.col-md-12 {
		width: 100%
	}
	.col-md-11 {
		width: 91.66666667%
	}
	.col-md-10 {
		width: 83.33333333%
	}
	.col-md-9 {
		width: 75%
	}
	.col-md-8 {
		width: 66.66666667%
	}
	.col-md-7 {
		width: 58.33333333%
	}
	.col-md-6 {
		width: 50%
	}
	.col-md-5 {
		width: 41.66666667%
	}
	.col-md-4 {
		width: 33.33333333%
	}
	.col-md-3 {
		width: 25%
	}
	.col-md-2 {
		width: 16.66666667%
	}
	.pagination>li {
		display: inline
	}
	.pagination>li>a, .pagination>li>span {
		position: relative;
		float: left;
		padding: 6px 12px;
		margin-left: -1px;
		line-height: 1.42857143;
		color: #337ab7;
		text-decoration: none;
		background-color: #fff;
		border: 1px solid #ddd
	}
	.pagination>li:first-child>a, .pagination>li:first-child>span {
		margin-left: 0;
		border-top-left-radius: 4px;
		border-bottom-left-radius: 4px
	}
	.pagination>li:last-child>a, .pagination>li:last-child>span {
		border-top-right-radius: 4px;
		border-bottom-right-radius: 4px
	}
	.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus,
		.pagination>li>span:hover {
		z-index: 3;
		color: #23527c;
		background-color: #eee;
		border-color: #ddd
	}
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
		.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
		{
		z-index: 2;
		color: #fff;
		cursor: default;
		background-color: #337ab7;
		border-color: #337ab7
	}
	.pagination>.disabled>a, .pagination>.disabled>a:focus, .pagination>.disabled>a:hover,
		.pagination>.disabled>span, .pagination>.disabled>span:focus,
		.pagination>.disabled>span:hover {
		color: #777;
		cursor: not-allowed;
		background-color: #fff;
		border-color: #ddd
	}
	.pagination-lg>li>a, .pagination-lg>li>span {
		padding: 10px 16px;
		font-size: 18px;
		line-height: 1.3333333
	}
	.pagination-lg>li:first-child>a, .pagination-lg>li:first-child>span {
		border-top-left-radius: 6px;
		border-bottom-left-radius: 6px
	}
	.pagination-lg>li:last-child>a, .pagination-lg>li:last-child>span {
		border-top-right-radius: 6px;
		border-bottom-right-radius: 6px
	}
	.pagination-sm>li>a, .pagination-sm>li>span {
		padding: 5px 10px;
		font-size: 12px;
		line-height: 1.5
	}
	.pagination-sm>li:first-child>a, .pagination-sm>li:first-child>span {
		border-top-left-radius: 3px;
		border-bottom-left-radius: 3px
	}
	.pagination-sm>li:last-child>a, .pagination-sm>li:last-child>span {
		border-top-right-radius: 3px;
		border-bottom-right-radius: 3px
	}
}
</style>

</head>
<body>
	<div class="row" style="width: 1210px; margin: 0 auto;">
		<div class="col-md-11">
			<ol class="breadcrumb">
				<strong>首页->商品列表</strong>
			</ol>
		</div>

	<c:forEach items="${pb.list }" var="p">
		<div class="col-md-2">
			<a href="${pageContext.request.contextPath}/product?method=getById&pid=${p.id}"> 
			<img src="${pageContext.request.contextPath}/client/productImg/${p.imgurl}"
				width="170" height="170" style="display: inline-block;">
			</a>
			<p>
				<a href="product_info.jsp" style='color: green'>${p.name }</a>
			</p>
			<p>
				<font color="#FF0000">商城价：&yen;${p.price }</font>
			</p>
		</div>
	</c:forEach>
		
		
	</div>

	<!--分页 -->
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">
		<!-- 判断当前页是否有首页 -->
		<c:if test="${pb.currPage==1}">
			<li class="disabled">
				<a href="javascript:void(0)" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span></a>
			</li>
		</c:if>
		
		<c:if test="${pb.currPage!=1}">
			<li>
				<a href="${pageContext.request.contextPath}/product?method=findByPage&currPage=${pb.currPage-1}"  aria-label="Previous">
				<span aria-hidden="true">&laquo;</span></a>
			</li>
		</c:if>
			
			<!-- 展示所有页码 -->
			<c:forEach begin="1" end="${pb.totalPage}" var="n">
				<!-- 判断是否当前页 -->
				<c:if test="${pb.currPage==n}">
					<li class="active"><a href="javascript:void(0)">${n }</a></li>
				</c:if>
				
				<c:if test="${pb.currPage!=n}">
					<li><a href="${pageContext.request.contextPath}/product?method=findByPage&currPage=${n}">${n }</a></li>
				</c:if>
				
			</c:forEach>
			
			<!-- 判断是否为最后一页 -->
			<c:if test="${pb.currPage==pb.totalPage}">
				<li class="disabled">
					<a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
				</li>
			</c:if>
			<c:if test="${pb.currPage!=pb.totalPage}">
				<li>
					<a href="${pageContext.request.contextPath}/product?method=findByPage&currPage=${pb.currPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
				</li>
			</c:if>
			
		</ul>
	</div>
</body>
</html>
