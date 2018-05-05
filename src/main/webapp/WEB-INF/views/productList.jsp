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
List of Products
<table class="table table-striped">
<thead><tr>
<th>Images</th>
<th>Product Name</th>
<th>Price</th>
<th>Action</th></thead>
<tbody>
<c:forEach items="${productAttr} var="p">
<tr>
<td><img src='<c:url value="/resources/images/${p.id }.png" ></c:url>' alt="Image NA" height="50px" width="50px"></td>
<td>${p.product_item }</td>
<td>${p.price}</td>
<td><a href='<c:url value="/all/getproduct/${p.id }">
</c:url>'><span class="glyphicon glyphicon-info-sign"></span>
</a>
<a href='<c:url value="/admin/deleteproduct/${p.id }">
</c:url>'><span class="glyphicon glyphicon-trash"></span>
</a>
<a href='<c:url value="/admin/updateproductform/${p.id }">
</c:url>'><span class="glyphicon glyphicon-pencil"></span>
</a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>