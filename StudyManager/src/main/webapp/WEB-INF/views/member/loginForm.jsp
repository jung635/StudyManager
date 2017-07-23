<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<c:url value='/resources/css/anonymous.css'/>" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="login_container">
	<h2>Study Manager Login</h2>
	<form action="<c:url value="/loginProcess"/>" method="post" name="fr">
		<div class="form_container">
			<label><b>ID</b></label>
			<input type="text" name="id" placeholder="Enter Username">
			<label><b>Password</b></label>
			<input type="password" name="pass" placeholder="Enter Password">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<button type="submit">Login</button>
		</div>
		<div class="form_container" style="background-color:#f1f1f1">
		    <button type="button" class="joinbtn" onclick="location.href='<c:url value="/member/insert"/>'">Sign up</button>
		    <span class="psw">Forgot <a href="#">password?</a></span>
	  	</div>
	</form>
	<c:if test="${errorMesg ne null }">
	<script type="text/javascript">
	alert('${errorMesg }');
	</script>
	</c:if>
</div>
</body>
</html>