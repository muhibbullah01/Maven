<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file = "allcss.jsp" %>

</head>
<body>
<%@include file="navbar.jsp" %>
<section class="slider-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="slider-caption w-50 mx-auto text-white text-center">
                        <h4>It is created to watch your health</h4>
                        <h2>Welcome To Vaccination System</h2>
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success }</p>
							<c:remove var="success"/>
						</c:if>
						<c:if test="${not empty error }">
							<p class="text-center text-success">${error }</p>
							<c:remove var="error"/>
						</c:if>
                        <form action="edit.jsp">
                            <div class="row">
                                <div class="col-lg-7">
                                    <input type="text" name="nid" class="form-control form-control-lg" placeholder="Type your NID Number">
                                </div>
                                <div class="col-lg-5">
                                    <button type="submit" class="btn btn-info btn-lg btn-block"> Get your Info. </button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </section>
     <section class="about-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="about-text-left">
                        <h1 class="mb-4">Activity Goals To Improve Health</h1>
                        <p class="lead">Being active is important to our health, but how much or what kind of activity do you need? Health Tracker App worked with the World Health Organisation to develop two activity goals based on WHO's physical activity recommendations shown to impact health - Move Minutes and Heart Points</p>
                    </div>
                </div>
                <div class="col-lg-4"> 
                    <img class="mw-100 rounded" src="https://i.ibb.co/yWnvztH/015.jpg" alt="">
                </div>
            </div>
        </div>
    </section>
</body>
</html>