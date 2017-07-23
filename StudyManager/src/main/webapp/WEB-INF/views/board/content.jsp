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
	<div class="title"><h1>글내용</h1></div>
	<table class="table_center default_table">
		<tr><td>이름</td><td>${bb.name }</td></tr>
		<tr><td>제목</td><td>${bb.subject }</td></tr>
		<tr><td>내용</td><td>${bb.content }</td></tr>
		<tr><td>첨부파일</td><td><a href="<c:url value='/board/fileDownload?file=${bb.file }&fileName=${bb.fileName }'/>">${bb.fileName }</a></td></tr>
	</table>
	
	<div id="reply_form">
		<form action="rewritePro.jsp">
		<textarea name="content" cols="60" rows="2"></textarea>
		<input type="hidden" name="num" value="${bb.num }">
		<input type="hidden" name="group_num" value="${bb.group_num }">
		<input type="hidden" name="board_num" value="${bb.board_num }">
		<input type="hidden" name="num" value="${bb.num }">
		<input type="submit" value="댓글등록">
		</form>
	</div>
	<div class="text_center" style="margin-top: 20px">
		<input type="button" value="수정하기" onclick="location.href='<c:url value="/board/update?num=${bb.num }&pageNum=${pageNum }"/>'">
		<input type="button" value="삭제하기" onclick="location.href='<c:url value="/board/delete?num=${bb.num }&board_num=${bb.board_num }"/>'">
		<input type="button" value="목록돌아가기" onclick="location.href='<c:url value="/board/list?pageNum=${pageNum }&board_num=${bb.board_num }"/>'">
	</div>
</div>
</body>
</html>