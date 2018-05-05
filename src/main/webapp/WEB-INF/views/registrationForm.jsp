<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript">
function fillShippingAddress(form){
	if(form.shippingsame.checked==true){
		form["shippingaddress.apartmentnumber"].value=form["billingaddress.apartmentnumber"].value;
		form["shippingaddress.streetname"].value=form["billingaddress.streetname"].value;
		form["shippingaddress.city"].value=form["billingaddress.city"].value;
		form["shippingaddress.state"].value=form["billingaddress.state"].value;
		form["shippingaddress.country"].value=form["billingaddress.country"].value;
		form["shippingaddress.zipcode"].value=form["billingaddress.zipcode"].value;
	}
	if(form.shippingsame.checked==false){
		form["shippingaddress.apartmentnumber"].value=""
		form["shippingaddress.streetname"].value=""
		form["shippingaddress.city"].value=""
		form["shippingaddress.state"].value=""
		form["shippingaddress.country"].value=""
		form["shippingaddress.zipcode"].value=""
	}
}

$(document).ready(function(){
	$('#form').validate({
		rules:{
			firstname:{required:true},
			lastname:{required:true},
			phonenumber:{required:true,number:true,minlength:10,maxlength:10},
			"user.email":{required:true,email:true},
			"user.password":{required:true,minlength:5,maxlength:10},
			"billingaddress.apartmentnumber":{required:true},
			"billingaddress.streetname":{required:true},
			"billingaddress.state":{required:true},
			"billingaddress.city":{required:true},
			"billingaddress.country":{required:true},
			"billingaddress.zipcode":{required:true,number:true}
		},
		messages:{
			firstname:{required:"Firstname is mandatory"},
			phonenumber:{required:"Phonenumber is required"},
			"user.email":{required:"Email is required",email:"Please enter valid email address"}
		}
	})
})

</script>


</head>
<body>
<div class="container">
<c:url var="url" value="/all/registercustomer"></c:url>
<form:form modelAttribute="customer" action="${url }">
<p align="center"><b>Customer Details</b></p>
<form:label path="id"></form:label>
<form:hidden path="id"/>


<form:label path="firstname">Enter Firstname</form:label>
<form:input path="firstname" id="firstname" />


<form:label path="lastname">Enter lastname</form:label>
<form:input path="lastname" id="lastname"/>


<form:label path="phonenumber">Enter phonenumber</form:label>
<form:input path="phonenumber" id="phonenumber"/>

<hr>
<p align="center"><b>Login credentials</b><br></p>
<form:label path="user.email">Enter Email </form:label>
<form:input path="user.email" id="user.email"/>

<form:label path="user.password">Enter password</form:label>
<form:input path="user.password" id="user.password"/>
<hr>
<p align="center"><b>Billing Address</b><br></p>
<form:label path="billingaddress.apartmentnumber">Enter Apartmentnumber</form:label>
<form:input path="billingaddress.apartmentnumber" id="billingaddress.apartmentnumber"/>

<form:label path="billingaddress.streetname">Enter Streetname</form:label>
<form:input path="billingaddress.streetname" id="billingaddress.streetname"/>

<form:label path="billingaddress.city">Enter city</form:label>
<form:input path="billingaddress.city" id="billingaddress.city"/>

<form:label path="billingaddress.state">Enter State</form:label>
<form:input path="billingaddress.state" id="billingaddress.state"/>

<form:label path="billingaddress.country">Enter country</form:label>
<form:input path="billingaddress.country" id="billingaddress.country"/>

<form:label path="billingaddress.zipcode">Enter zipcode</form:label>
<form:input path="billingaddress.zipcode" id="billingaddress.zipcode"/>

<hr>
<p align="center"><b>Shipping Address</b></p>	

<form:label path="shippingaddress.apartmentnumber">Enter Apartmentnumber</form:label>
<form:input path="shippingaddress.apartmentnumber" id="shippingaddress.apartmentnumber"/>


<form:label path="shippingaddress.streetname">Enter Streetname</form:label>
<form:input path="shippingaddress.streetname" id="shippingaddress.streetname"/>


<form:label path="shippingaddress.city">Enter city</form:label>
<form:input path="shippingaddress.city" id="shippingaddress.city"/>


<form:label path="shippingaddress.state">Enter State</form:label>
<form:input path="shippingaddress.state" id="shippingaddress.state"/>


<form:label path="shippingaddress.country">Enter country</form:label>
<form:input path="shippingaddress.country" id="shippingaddress.country"/>


<form:label path="shippingaddress.zipcode">Enter zipcode</form:label>
<form:input path="shippingaddress.zipcode" id="shippingaddress.zipcode"/>


<button type="submit" >Register</button>
</form:form>
</div>

</body>
</html>