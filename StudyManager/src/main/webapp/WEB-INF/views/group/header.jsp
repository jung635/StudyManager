<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="container">
	<ul class="group_ul">
		<c:forEach items="${board }" var="board">
			<li><a href="<c:url value="/board/list?board_num=${board.board_num }"/>">${board.name }</a></li>
		</c:forEach>
		<c:if test="${gb.admin eq id }">
			<li><a href="<c:url value="/group/attendence"/>">출석 관리</a></li>
			<li><a href="<c:url value="/group/manageMember"/>">그룹 관리</a>
		</c:if>
		<li><a href="<c:url value="/group/myChart"/>">내 정보</a></li>
		<li id="group_name"><a href="<c:url value="/group/main?group_num=${gb.num }"/>">"${gb.name }"</a></li>
	</ul>
</div>
</body>
</html>