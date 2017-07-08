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
<table border="1">
	<th>아이디</th><th>이름</th><th>나이</th><th>성별</th><th>이메일</th><th>가입날짜</th>
		<c:forEach items="${group_map }" var="map">
			<tr><td>${map.key.id }</td><td>${map.key.name }</td>
				<td>${map.key.age }</td><td>${map.key.gender }</td>
				<td>${map.key.email }</td>
				<td>${map.value }</td>
			</tr>
		</c:forEach>
</table>
</body>
</html>