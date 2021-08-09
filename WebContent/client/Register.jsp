<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<%@ include file="menu_search.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>新用户注册</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css">
  <script src="js/form.js"></script>
  <style>
  @charset "UTF-8";
body{
	/*背景颜色*/
    background-color: papayawhip;
}

table{
	width:700px;
	margin-top: 10px;
}
#Email,#Username,#Password,#RePassword,#Phonemunber{
    width: 220px;
    height: 30px;
    border: 1px solid #A4A4A4;
    /* 设置边框为圆角 */
    border-radius: 8px;
    padding-left: 10px;
}

/*提示错误信息*/
.error{
    color:gray;
}

#btn-submit{
    width: 140px;
    height: 40px;
}
  </style>
</head>
<body>
	 <form action="${pageContext.request.contextPath}/user?method=registe" method="post" id="form">      
        <table align="center">
            <tr>
                <td align="right">邮箱：</td>
                <td><input type="email" name="email" id="Email" placeholder="请输入邮箱地址">
                    <span id="s_email" class="error"></span>
                </td>
            </tr>
            <tr>
                <td  align="right">用户名：</td>
                <td><input type="text" name="username" id="Username" placeholder="请输入用户名">
                    <span id="s_username" class="error"></span>
                </td>
            </tr>
            <tr>
                <td  align="right">密码：</td>
                <td><input type="password" name="password" id="Password" placeholder="请输入密码">
                <span id="s_password" class="error"></span>
            </td>
            </tr>
            <tr>
                <td  align="right">确认密码：</td>
                <td><input type="password" name="repassword" id="RePassword" placeholder="请确认密码">
                    <span id="s_repassword" class="error"></span></td>
            </tr>
            <tr>
                <td  align="right">性别：</td>
                <td>
                    <input type="radio" name="gender" value="male">男
                    <input type="radio" name="gender" value="female">女
                </td>
            </tr>
            <tr>
                <td  align="right">联系电话：</td>
                <td><input type="text" name="telephone" id="Phonemunber" placeholder="请输入联系电话">
                    <span id="s_phonemunber" class="error"></span></td>
            </tr>
            <tr>
                <td  align="right">个人介绍：</td>
                <td colspan="2"><textarea name="introduce"  cols="60" rows="5"></textarea></td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" value="提交" name="submit" id="btn-submit"></td>
             
            </tr>
        </table>
    </form>

</body>
</html>
