<%@page import="java.util.List"%>
<%@page import="com.project.entity.Bean"%>
<%@page import="com.project.dao.RegDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.project.conn.Connectivity" %>
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
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	%>
	
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h1 class="fs-3 text-center">Vaccine Registration Form</h1>
						<p class="fs-3 text-center">Edit User Info</p>
						
						<%
						int nid = Integer.parseInt(request.getParameter("nid"));
						RegDAO dao = new RegDAO(Connectivity.create());
						Bean b = dao.selectID(nid);
						%>
						
						<form class="row g-3" action="update" method="post">
  <div class="col-md-6">
    <label class="form-label">NID Number</label>
    <input type="text" value="<%=b.getNid() %>" name="nid" class="form-control">
  </div>
  <div class="col-md-6">
    <label class="form-label">Full Name (Mentioned as NID)</label>
    <input type="text" value="<%=b.getName() %>" name="name" class="form-control">
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
    <input type="date" value="<%=b.getDob() %>" name="dob" class="form-control">
  </div>
  <div class="col-md-6">
    <label class="form-label">Contact Number</label>
    <input type="text" value="<%=b.getContact() %>" name="contact" placeholder="+880" class="form-control">
  </div>
  <div class="col-12">
    <label class="form-label">Address</label>
    <input type="text" value="<%=b.getAddress() %>" name="address" class="form-control">
  </div>

  <div class="col-12">
    <label class="form-label">Vaccination Center</label>
    <input type="text" value="<%=b.getCenter() %>" name="center" class="form-control">
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary col-md-12" >Update Information</button>
  </div>
</form>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>