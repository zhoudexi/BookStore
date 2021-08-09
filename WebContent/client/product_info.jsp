<%@include file="head.jsp"%>
<%@ include file="menu_search.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全部商品目录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/productList.css">

<style>
	body {
		margin-top: 20px;
		margin: 0 auto;
	}
			
	.carousel-inner .item img {
		width: 100%;
		height: 300px;
	}
	.breadcrumb{padding:8px 15px;margin-bottom:20px;list-style:none;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block}.breadcrumb>li+li:before{padding:0 5px;color:#ccc;content:"/\00a0"}.breadcrumb>.active{color:#777}.pagination{display:inline-block;padding-left:0;margin:20px 0;border-radius:4px}
	.btn-group-vertical>.btn-group:after, .btn-toolbar:after, .clearfix:after,
	.container-fluid:after, .container:after, .dl-horizontal dd:after,
	.form-horizontal .form-group:after, .modal-footer:after, .nav:after,
	.navbar-collapse:after, .navbar-header:after, .navbar:after, .pager:after,
	.panel-body:after, .row:after {
	clear: both
}
	.row p{margin:0;}
	
	.myrow .yes-right-border{
		border-right:1px solid #E7E7E7;
	}
	.myrow .no-left-border{
		border-left:0px;
	}
	.col-md-6,.col-md-7,.col-md-8,.col-md-9{float:left}.col-md-12{width:100%}.col-md-11{width:91.66666667%}.col-md-10{width:83.33333333%}.col-md-9{width:75%}.col-md-8{width:66.66666667%}.col-md-7{width:58.33333333%}.col-md-6{width:50%}
</style>

</head>
<body>
	<div class="container">
			<div class="row">
				<div style="border: 1px solid #FFFFFF;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">
					
					<ol class="breadcrumb">
						<strong>首页->商品列表</strong>
					</ol>
				</div>

				<div style="margin:0 auto;width:950px;">
					<div class="col-md-6">
						<img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/client/productImg/${bean.imgurl}">
					</div>

					<div class="col-md-6">
					<form action="${pageContext.request.contextPath}/CartServlet?op=add&product_id=${bean.id}" method="post">
						<input type="hidden" name="pid" value="${bean.id }">
						<div><strong>书名：</strong>${bean.name }</div>
						<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
							<div><strong>编号：</strong>${fn:substring(bean.id,0,20) }</div>
						</div>

						<div style="margin:10px 0 10px 0;"><strong>商城价:</strong> <strong style="color:#ef0101;">￥：${bean.price }元</strong> 参 考 价： <del>￥500元</del>
						</div>

						<div style="margin:10px 0 10px 0;"><strong>促销:</strong> <a target="_blank"  style="background-color: #f07373;">限时抢购</a> </div>

						<div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
							

							<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
								<input id="quantity" name="count" value="1" maxlength="4" size="10" type="text"> </div>

							<div style="margin:20px 0 10px 0;;text-align: center;">
								
										<input style="height:36px;width:127px;" value="加入购物车" type="submit">
								 &nbsp;收藏商品
							</div>
						</div>
						</from>
					</div>
				</div>
		</div>
</body>
<script type="text/javascript">
		function addCart(){
			//将表单提交
			document.getElementById("formId").submit();
		}
	</script>
</html>
