<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="domain.Product,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<jsp:useBean id="Product" class="domain.Product"></jsp:useBean>
		<jsp:setProperty property="*" name="Product" />
		 <%
		 Product p = new Product();
		 if(Product.getName()!=null)p.add(Product);
		 response.sendRedirect(request.getContextPath()+"/admin/login/home.jsp");
		 %>
</body>
</html>