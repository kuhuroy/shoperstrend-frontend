<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="panel panel-info" style="width:450px">
<div class="panel-heading">Product Details</div>
<div class="panel-body">
<table>
<tr>
<td>
<b>Product name:</b>${product.productname }<br>
<b>Category name:</b>${product.catogoryname }<br>
<b>Description:</b>${product.productdescription }<br>
<b>Price:</b>${product.price }<br>
<b>Quantity:</b>${product.quantity}</td>
<td>
<img alt="NA" src='<c:url value="/resources/images/${product.id}.png }"></c:url>' height="250px" width="250px">
</td>
</tr>
</table>
</div>
</div>
</div>
<a href='<c:url value="/all/getproducts"></c:url>'>Back</a>
</body>
</html>