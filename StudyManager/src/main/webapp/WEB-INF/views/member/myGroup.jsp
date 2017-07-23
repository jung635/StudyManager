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
	<div class="container">
		<div class="title"><h1>나의 그룹 리스트</h1></div>
		<table  class="table_center default_thTable" style="width: 100%">
		<th>그룹 이름</th><th>만나는 요일</th><th>만나는 시간</th><th>도시</th><th>목적</th><th>카테고리</th><th>해시태그</th>
		<c:forEach items="${group_map }" var="key" >
			<tr>
				<td><a href="<c:url value="/group/main?group_num=${key.value.num }"/>">${key.value.name }</a>
					<c:if test="${key.value.admin eq id }"><b> (관리자입니다)</b></c:if>
					<a href="<c:url value="/group/main?group_num=${key.value.num }"/>" class="btn btn-default btn-lg" style="padding: 3px; font-size: 15px; margin-left: 20px;">
						Go <span class="glyphicon glyphicon-hand-right"></span>
	       			</a>
	       		</td>
				<td>${key.value.week }</td>
				<td>${key.value.late_start }</td>
				<td>${key.value.city }</td>
				<td>${key.value.goal }</td>
				<td>${key.value.category }</td>
				<td>${key.value.hashTag }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
<c:import url="/member/bottom" />
</body>
</html>