<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
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
<c:import url="/member/header" />
<div class="container">
<c:import url="/member/member_nav" />
	<div id="right_nav_content">
		<h2>회원 정보</h2>
		<table class="default_table">
			<tr><td>아이디</td><td>${mb.id}</td></tr>
			<tr><td>비밀번호</td><td>${mb.pass }</td></tr>
			<tr><td>이름</td><td>${mb.name }</td></tr>
			<tr><td>가입날짜</td><td>${mb.reg_date }</td></tr>
			<tr><td>email</td><td>${mb.email}</td></tr>
		</table>
	</div>
</div>
</body>
</html>