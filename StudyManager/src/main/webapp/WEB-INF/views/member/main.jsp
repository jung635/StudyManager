<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

${id }님이 로그인 하셨습니다!<br>
 <form action="${pageContext.request.contextPath}/perform_logout" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type = "submit" value="로그아웃">
</form>
<%-- <a href="<c:url value="/member/logout"/>">로그아웃</a><br> --%>
<a href="<c:url value="/member/info"/>">회원정보조회</a><br>
<a href="<c:url value="/member/update"/>">회원정보수정</a><br>
<a href="<c:url value="/member/delete"/>">회원정보삭제</a><br>
<a href="<c:url value="/board/list"/>">게시판 가기</a><br>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="<c:url value="/member/list"/>">회원리스트</a><br>
</sec:authorize>


</body>
</html>