<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
    <%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h3 align="center">Add Product</h3>
	<c:url value="/admin/saveproduct" var="url"></c:url>
	<form:form action='${url }' modelAttribute="product" role="form">
	<form:hidden path="id"/>
	<div class="form-group">
		<form:label path="productname">Enter product Name</form:label>
		<!-- product.setProductname('Pen') -->
		<form:input path="productname" class="form-control" style="width:750px"/>
        <form:errors path="productname" cssStyle="color:red"></form:errors>
        </div>
        
        <div class="form-group">
		<form:label path="productdescription">Enter ProductDescription</form:label>
		<!-- product.setProductDescription('.....') -->
		<form:textarea path="productdescription"  class="form-control" style="width:750px"/>
        <form:errors path="productdescription" cssStyle="color:red"></form:errors>
        </div>
        
        <div class="form-group">
		<form:label path="quantity">Enter Quantity</form:label>
		<!-- product.setQuantity(12) -->
		<form:input path="quantity" class="form-control" style="width:750px"/>
        <form:errors path="quantity" cssStyle="color:red" ></form:errors>
        </div>
        
        <div class="form-group">
		<form:label path="price">Enter Price</form:label>
		<!-- product.setPrice(..) -->
		<form:input path="price" class="form-control" style="width:750px"/>
        <form:errors path="price" cssStyle="color:red"></form:errors>
        </div>
        
        <div class="form-group">
        <form:label path="category.id">Select Category</form:label>
        <form:select path="category.id">
        <c:forEach items=${categories } var="c">
        <form:option value="${c.id }">${c.categoryname}</form:option>
        </c:forEach>
        </form:select>
        </div>
        
        <div class="form-group">
		<form:label path="image">Upload image</form:label>
		<form:input type="file" path="image"></form:input>
 			</div>
		<input type="submit" value="Add Product">
	</form:form>
	</div>
</body>
</html>