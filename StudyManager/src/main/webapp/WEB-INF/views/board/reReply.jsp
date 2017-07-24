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
<form action="<c:url value="/board/reReplyInsert"/>" method="post">
	<textarea name="content" cols="60" rows="2"></textarea>
	<input type="hidden" name="group_num" value="${bb.group_num }">
	<input type="hidden" name="board_num" value="${bb.board_num }">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="submit" value="댓글등록">
</form>
</body>
</html>