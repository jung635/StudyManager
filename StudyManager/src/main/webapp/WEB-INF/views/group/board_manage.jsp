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
	<h2>게시판 관리</h2>
		<table border="1">
			<c:forEach items="${board }" begin="0" end="${length }" step="1" var="boardValues">
				<tr><td>${boardValues }</td><td><input type="button" value="관리"></td></tr>
			</c:forEach>
		</table>
</div>
</body>
</html>