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
<h1>회원정보</h1>
<table border="1">
<tr><td>아이디</td><td>${mb.id}</td></tr>
<tr><td>비밀번호</td><td>${mb.pass }</td></tr>
<tr><td>이름</td><td>${mb.name }</td></tr>
<tr><td>가입날짜</td><td>${mb.reg_date }</td></tr>
<tr><td>나이</td><td>${mb.age }</td></tr>
<tr><td>성별</td><td>${mb.gender }</td></tr>
<tr><td>email</td><td>${mb.email}</td></tr>
</table>
<a href = "<c:url value="/member/main"/>">메인으로 이동</a>
</body>
</html>