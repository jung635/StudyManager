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
<c:import url="/group/header" />
<div class="container">
<c:import url="/group/manage_nav" />
	<div id="right_nav_content">
		<div class="title"><h1>게시판관리</h1></div>
		<table class="default_topbotTable">
			<c:forEach items="${board }" var="board">
				<tr>
					<td>${board.name }</td>
					<td><input type="button" value="관리" style="margin-right: 10px" onclick="location.href='<c:url value="/group/boardDetail?board_num=${board.board_num }"/>'">
						<input type="button" value="삭제"></td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="게시판 추가" style="margin-right: 10px" onclick="location.href='<c:url value=""/>'">
	</div>
</div>
<c:import url="/member/bottom" />
</body>
</html>