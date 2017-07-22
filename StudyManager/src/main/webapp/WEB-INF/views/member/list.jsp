<%@page import="java.util.List"%>
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
<div class="title"><h1>회원 리스트</h1></div>
<table border="1" class="table_center">
	<th>아이디</th><th>비밀번호</th><th>이름</th><th>가입날짜</th><th>나이</th><th>성별</th><th>이메일</th>
		<c:forEach items="${list }" var="mb">
		<tr><td>${mb.id }</td><td>${mb.pass }</td><td>${mb.name }</td>
	<td>${mb.reg_date }</td><td>${mb.age }</td><td>${mb.gender }</td>
	<td>${mb.email }</td></tr>
	</c:forEach>
</table>
</body>
</html>