<%@page import="java.util.List"%>
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
<div class="title"><h1>게시판</h1></div>
	<table class="table_center default_thTable">
	<th>글번호</th><th>제목</th><th>이름</th><th>조회수</th><th>작성일</th>
	<c:forEach var="bb" items="${boardList}">
		<tr><td>${bb.num }</td>
			<td><a href="<c:url value="/board/content?num=${bb.num }&pageNum=${pageMaker.pageNum}"/>">${bb.subject }</a></td>
			<td>${bb.name }</td>
			<td>${bb.readcount }</td>
			<td>${bb.date }</td>
		</tr>
	</c:forEach>
	</table>
	<div class="text_center" style="margin-top: 20px">
	<c:if test="${pageMaker.startPage }>${pageMaker.pageBlock }">
		<a href="<c:url value="/board/list?pageNum=${pageMaker.startPage }-${pageMaker.pageBlock}&board_num=${bt.board_num }"/>">[이전]</a>&nbsp;
	</c:if>
	<c:forEach var="i" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
		<a href='<c:url value="/board/list?pageNum=${i }&board_num=${bt.board_num }"/>'>[${i }]</a>
	</c:forEach>
	<c:if test="${pageMaker.endPage }<${pageMaker.pageCount }">
		<a href="<c:url value="/board/list?pageNum=${pageMaker.startPage }+${pageMaker.pageBlock}&board_num=${bt.board_num }"/>">[다음]</a>&nbsp;
	</c:if>
	<c:if test="${bt.write_auth eq 'all' }">
		<input type="button" value="글쓰기" onclick="location.href='<c:url value="/board/write?board_num=${bt.board_num }"/>'">
	</c:if>
	</div>
</div>
</body>
</html>