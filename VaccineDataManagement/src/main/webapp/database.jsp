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
<body class="bg-dark">

    <nav class="navbar navbar-expand-lg navbar-light jon-header">
      <div class="container">

        <a class="navbar-brand" href="index.jsp"> <span> <i class="fas fa-mobile-alt"></i> </span> Vaccination System </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse ml-5 justify-content-between" id="navbarSupportedContent">
          <ul class="navbar-nav jon-menu ml-5 mb-2 mb-lg-0">
            
            
          </ul>
          <a class="btn btn-outline-primary btn-lg font-weight-bold" href="logout"><%=session.getAttribute("username") %></a>
          <a class="btn btn-outline-danger btn-lg font-weight-bold" href="logout">LogOUT</a>
        </div>

      </div>
    </nav>
	<%	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		
		if(session.getAttribute("username")==null){
			
			response.sendRedirect("adminLogin.jsp");	
		}	
	%>

<div class="container p-1" >
		<div class="card">
			<div class="card-body">
				<p class="fs-1 text-center">All Registered Users</p>
				
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success }</p>
							<c:remove var="success"/>
						</c:if>
						<c:if test="${not empty error }">
							<p class="text-center text-success">${error }</p>
							<c:remove var="error"/>
						</c:if>

					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">NID</th>
					      <th scope="col">Full Name</th>
					      <th scope="col">Gender</th>
					      <th scope="col">Date Of Birth</th>
					      <th scope="col">Contact Number</th>
					      <th scope="col">Address</th>
					      <th scope="col">Center</th>
					      <th scope="col">Action</th>
					    </tr>
					  </thead>
					  <tbody>
					  
					  		<%
					  			
					  		RegDAO dao = new RegDAO(Connectivity.create());
					  		List<Bean> list = dao.showingFullList();
					  		for(Bean e: list){
					  		%>
					  	<tr>
					      <th scope="row"><%=e.getNid() %></th>
					      <td><%=e.getName() %></td>
					      <td><%=e.getGender() %></td>
					      <td><%=e.getDob() %></td>
					      <td><%=e.getContact() %></td>
					      <td><%=e.getAddress() %></td>
					      <td><%=e.getCenter() %></td>
					      <td><a href="edit.jsp?nid=<%=e.getNid() %>" 
					      class="btn btn-sm btn-primary">Edit</a>
					      <a href="delete?nid=<%= e.getNid() %>" 
					      class="btn btn-sm btn-danger ms-1">Delete</a>
					      </td>
					    </tr>
					    
					    <%} %>
					  
					  </tbody>
					</table>

				</div>
		</div>
</div>

</body>
</html>