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
<ul class="manage_nav" style="height: 110px;">
  <li class="manage_nav_li"><a href="<c:url value="/member/info"/>">회원정보</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/member/update"/>">회원정보수정</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/member/delete"/>">회원탈퇴</a></li>
</ul>
</body>
</html>