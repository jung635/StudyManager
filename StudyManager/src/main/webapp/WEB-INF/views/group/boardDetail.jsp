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
		<form action="<c:url value="/group/boardUpdate"/>" method="post">
			<table class="default_table">
				<tr><td>게시판 이름</td><td><input name="name" type="text" value="${bt.name }"></td></tr>
				<tr><td>글쓰기 권한</td>
					<td>
						<input type="radio" value="all" name="write_auth" <c:if test="${bt.write_auth eq 'all' }">checked</c:if>>전체 허용　
			            <input type="radio" value="admin" name="write_auth" <c:if test="${bt.write_auth eq 'admin' }">checked</c:if>>운영자만 허용
					</td>
				</tr>
				<tr><td>댓글 권한</td>
					<td>
						<input type="radio" value="all" name="comment_auth" <c:if test="${bt.comment_auth eq 'all' }">checked</c:if>>전체 허용　
			            <input type="radio" value="admin" name="comment_auth" <c:if test="${bt.comment_auth eq 'admin' }">checked</c:if>>운영자만 허용
					</td>
				</tr>
			</table>
			<input type="hidden" name="board_num" value="${bt.board_num }">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="text_center" style="margin-top: 20px">
				<input type="submit" value="수정완료">
				<input type="button" value="취소" onclick="history.back()">
			</div>
		</form>
	</div>
</div>
<c:import url="/member/bottom" />
</body>
