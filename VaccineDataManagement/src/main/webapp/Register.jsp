<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file = "allcss.jsp" %>
</head>
<body class="bg-light">

	<%@include file="navbar.jsp" %>
	
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h1 class="fs-3 text-center">Vaccine Registration Form</h1>
						<p class="fs-3 text-center">New Registration</p>
						
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success }</p>
							<c:remove var="success"/>
						</c:if>
						<c:if test="${not empty error }">
							<p class="text-center text-success">${error }</p>
							<c:remove var="error"/>
						</c:if>
						
						<form class="row g-3" action="register" method="post">
  <div class="col-md-6">
    <label class="form-label">NID Number</label>
    <input type="text" name="nid" class="form-control">
  </div>
  <div class="col-md-6">
    <label class="form-label">Full Name (Mentioned as NID)</label>
    <input type="text" name="name" class="form-control">
  </div>
    <div class="col-md-6">
    <label class="form-label">Gender</label>
    <select name="gender" class="form-select">
      <option selected>Male</option>
      <option>Female</option>
    </select>
  </div>
  <div class="col-md-6">
    <label class="form-label">Date of Birth</label>
    <input type="date" name="dob" class="form-control">
  </div>
  <div class="col-md-6">
    <label class="form-label">Contact Number</label>
    <input type="text" name="contact" placeholder="+880" class="form-control">
  </div>
  <div class="col-12">
    <label class="form-label">Address</label>
    <input type="text" name="address" class="form-control">
  </div>

  <div class="col-12">
    <label class="form-label">Vaccination Center</label>
    <input type="text" name="center" class="form-control">
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary col-md-12" >Submit Information</button>
  </div>
</form>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>