<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="css/sample.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet"> 

<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		<button type="button" class="navbar-toggle collapsed" 
   data-toggle="collapse" data-target="#collapse-example" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
			<div class="navbar-header">
				<a class="navbar-brand" href=""><img src="resources/images/download.jpg"
					alt="NIIT" height="30px" width="120px"></a>
			</div>
			<div class="collapse navbar-collapse" id="collapse-example">
			<ul class="nav navbar-nav">
				<li class="active"><a href='<c:url value="/home"></c:url>'>Home</a></li>
				
				<li><a href='<c:url value="/all/getproducts"></c:url>'>Browse All Products</a></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href='<c:url value="/admin/getproductform"></c:url>'>Add Product</a></li>
				</security:authorize>
				<li class="dropdown">
			<a href="" class="dropdown-toggle" data-toggle="dropdown">
                     Select by Category<b class="caret"></b></a>
			<ul class="dropdown-menu">
					<li >
					<!-- Request parameter
					parameter name is 'searchCondition' -->
					   <a href='<c:url value="/all/searchbycategory?searchCondition=Kitchen and Dining"></c:url>'>Kitchen and Dining</a>
					   <a href='<c:url value="/all/searchbycategory?searchCondition=Furniture"></c:url>'>Furniture</a>
					   <a href='<c:url value="/all/searchbycategory?searchCondition=Education"></c:url>'>Education</a>
					   <a href='<c:url value="/all/searchbycategory?searchCondition=Toys"></c:url>'>Toys</a>
					   <a href='<c:url value="/all/searchbycategory?searchCondition=All"></c:url>'>All</a>
                    </li>
			</ul>
			</li>
				
				<c:if test="${pageContext.request.userPrincipal.name==null }">
				<li><a href="<c:url value="/login"></c:url>">sign in</a></li>
				<li><a href="<c:url value="/all/registrationform"></c:url>">sign up</a></li>
				</c:if>
				<li><a href="<c:url value='/cart/purchasedetails'></c:url>"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
			<li><a href='<c:url value="/j_spring_security_logout"></c:url>'>logout</a></li>
			</c:if>
				
			</ul>
			</div>
		</div>
	</nav>

</body>
</html>