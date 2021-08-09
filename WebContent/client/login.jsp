<%@include file="head.jsp"%>
<%@ include file="menu_search.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>网上书城登陆</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<style>
@charset "UTF-8";

.regsucdiv {
	margin: 0 auto;
	height: 500px;
	width: 900px;
	background-color: #fcfdef;
}

.sucdiv {
	margin: 0 auto;
}

.title {
	padding-left: 50px;
	padding-top: 20px;
	height: 50px;
	width: 900px;
	font-weight: bold;
}

.login {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 900spx;
	height: 450px;
	margin: 0 auto;
}

.loginleft {
	text-align: center;
	display: inline-block;
	width: 400px;
	height: 450px;
	position: relative;
}

.loginright {
	display: inline-block;
	width: 400px;
	height: 450px
}

.loginlog {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	background: #e8e8e8;
	height: 350px;
	width: 300px;
	border-style: ridge;
}

td.loginlogtd {
	width: 100px;
	height: 40px;
}

table.loginlog {
	
}

.logbut {
	background-color: #ff9e3e; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
}

.regbut {
	background-color: #73e600; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
}
</style>
</head>
<body>
	<div class="regsucdiv">
		<div class="title">
			<p>首页>>个人登陆</p>
		</div>
		<div class="login">
			<div align="center" class="loginleft">
				<div class="loginlog" align="center">
					<form id="form" action="${pageContext.request.contextPath}/user?method=login" method="post"
						onsubmit="return checklogUsernameandPassword()">
						<table class="loginlog">
							<tr>
								
								<td colspan="3" class="loginlogtd"><h2>个人用户登陆</h2></td>
							</tr>
							<tr>
								<td colspan="3"><span id="log_span"></span></td>
							<tr>
							<tr>
								<td colspan="1" align="right" class="loginlogtd">用户名：</td>
								<td colspan="2" class="loginlogtd"><input type="text"
									name="username" size="16" style="width: 130px;"
									id="logusername" " /></td>
							</tr>
							<tr>
								<td colspan="1" align="right" class="loginlogtd">密&nbsp&nbsp&nbsp&nbsp码：</td>
								<td colspan="2" class="loginlogtd"><input type="password"
									name="password" size="16" style="width: 130px;"
									id="logpassword" /></td>
							</tr>
							<tr>
								<td colspan="2" class="loginlogtd"><input type="checkbox"
									name="pass" id="pass" value="" onclick="return checkGender()" />记住用户名
									<input type="checkbox" name="log" id="log" value=""
									onclick="return checkGender()" />自动登陆</td>
							</tr>
							<tr>
								<td class="loginlogtd" align="center" colspan="3"><input
									type="submit" value="登陆" class="logbut" name="submit" /><br><p style="color:red;">${msg}</p>
								</td>
								
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="loginright">
				<br>
				<br>
				<br>
				<div>
					<p style="font-weight: bold;">您还没有注册？</p>
					<br>
					<p>注册新用户，享受更优惠价格</p>
					<br>
					<p>千万种图书，供您挑选！注册即可享受丰富折扣优惠，便宜有好货！超过万本图书任您选。</p>
					<br>
					<p>超人气社区！精彩活动每一天。买卖更安心！支付宝交易超安全。</p>
					<br>
				</div>
				<a href="Register.jsp"><button class="regbut">注册新会员</button></a>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="foot.jsp"%>