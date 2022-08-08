<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file = "allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h1 class="fs-3 text-center">Admin Login Form</h1>
						<p class="fs-3 text-center">ONLY FOR ADMINS!</p>
						
						
<form class="row g-3" action="AdminLogin" method="post">
  <div class="col-md-6">
    <label class="form-label">Admin User Name</label>
    <input type="text" name="username" class="form-control" placeholder="@UserName">
  </div>
  <div class="col-md-6">
    <label class="form-label">Password</label>
    <input type="password" name="upassword" class="form-control" placeholder="Password">
  </div>
  <div class="col-12">
    <button type="submit"  value="AdminLogin" class="btn btn-primary col-md-12" >Confirm Identity</button>
  </div>
</form>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>