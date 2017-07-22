<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Study Manager</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <style>
  .table_center{
  	margin: auto;
  }
  
  .navbar {
      padding-top: 15px;
      padding-bottom: 15px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
  }
  .navbar-nav  li a:hover {
      color: #1abc9c !important;
  }
  
  .clear{
	clear: both;
  }
  
  .center{
	margin: auto;
  }
  
  .title{
  	text-align: center;
  }
  
  /* dropDown */
  .dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 12px 16px 12px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<c:url value="/member/main"/>">Study Manager</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<c:url value="/group/make"/>">Create Group</a></li>
        <li><a href="#">My Groups</a></li>
        <li><a href="#">Search Group</a></li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="<c:url value="/member/list"/>">Admin</a></li>
		</sec:authorize>
		<li>
			<div class="dropdown">
			  <button class="dropbtn"><span class="glyphicon glyphicon-user"></span><span class="glyphicon glyphicon-triangle-bottom"></span></button>
			  <div class="dropdown-content">
				<form action="${pageContext.request.contextPath}/perform_logout" method="post" name="logoutFr">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			    	<a href="#" onclick="document.logoutFr.submit();">Logout</a>
			 	</form>
			    <a href="<c:url value="/member/info"/>">My Info</a>
			    <a href="<c:url value="/member/alarmList"/>">Message</a>
			  </div>
			</div>
		</li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>