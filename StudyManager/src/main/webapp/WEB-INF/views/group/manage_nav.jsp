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
<ul class="manage_nav">
  <li class="manage_nav_li"><a href="<c:url value="/group/manageMember"/>">멤버 관리</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/group/manageBoard"/>">게시판 관리</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/group/manageFee"/>">벌금 관리</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/group/manageGroup"/>">그룹 관리</a></li>
</ul>
</body>
</html>