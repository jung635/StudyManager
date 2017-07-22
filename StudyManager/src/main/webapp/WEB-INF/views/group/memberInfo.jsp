<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/group/header" />
<c:import url="/group/manage_nav" />
<div id="content">
	<h1>회원정보</h1>
	<table border="1">
		<tr><td>아이디</td><td>${mb.id}</td></tr>
		<tr><td>이름</td><td>${mb.name }</td></tr>
		<tr><td>가입날짜</td><td>${reg_date }</td></tr>
		<tr><td>나이</td><td>${mb.age }</td></tr>
		<tr><td>성별</td><td>${mb.gender }</td></tr>
		<tr><td>email</td><td>${mb.email}</td></tr>
	</table>
	<a href = "<c:url value="/group/manageMember"/>">멤버관리로 이동</a>
	<div id="memberList"></div>

</div>
</body>
</html>