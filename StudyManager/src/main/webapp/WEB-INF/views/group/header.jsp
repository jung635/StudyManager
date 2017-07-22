<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}

#group_name{
	float:right;
}
</style>
</head>
<body>
<ul>
	<c:forEach items="${board }" begin="0" end="${length }" step="1" var="boardValues">
		<li><a href="<c:url value="/board/list?board_name=${fn:trim(boardValues) }"/>">${boardValues }</a></li>
	</c:forEach>
	<c:if test="${gb.admin eq id }">
		<li><a href="<c:url value="/group/attendence"/>">출석 관리</a></li>
		<li><a href="<c:url value="/group/manageMember"/>">그룹 관리</a>
	</c:if>
	<li><a href="<c:url value="/group/myChart"/>">내 정보</a></li>
	<li id="group_name"><a href="<c:url value="/group/attendence"/>">그룹이름: "${gb.name }"</a></li>
	<li id="group_name"><a href="<c:url value="/member/main"/>">내 메인가기</a></li>
</ul>
</body>
</html>