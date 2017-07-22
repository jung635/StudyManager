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
<div class="title"><h1>검색 결과</h1></div>
<table border="1" class="table_center">
	<th>그룹 이름</th><th>만나는 요일</th><th>만나는 시간</th><th>도시</th><th>목적</th><th>카테고리</th><th>해시태그</th>
	<c:forEach items="${list }" var="gb">
		<tr><td>${gb.name }</td><td>${gb.week }</td><td>${gb.late_start }</td><td>${gb.city }</td>
		<td>${gb.goal }</td><td>${gb.category }</td><td>${gb.hashTag }</td></tr>
	</c:forEach>
</table>
</body>
</html>