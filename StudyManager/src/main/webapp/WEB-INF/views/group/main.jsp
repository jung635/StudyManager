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
<div class="title"><h1>Rule</h1></div>
	<div class="title"><h4><b>&lt;기본Rule&gt;</b></h4></div>
	<table class="table_center default_table">
		<tr><td>요일</td><td>${gb.week }</td></tr>
		<tr><td>시작 시간</td><td>${gb.start_time }</td></tr>
	</table>
	
	<div class="title"><h4><b>&lt;지각Rule&gt;</b></h4></div>
	<table class="table_center default_table">
		<tr><td>지각 시작 시간</td><td>${gb.late_start }</td></tr>
		<tr><td>시간 간격</td><td>${gb.late_interval }</td></tr>
		<tr><td>지각비</td><td>${gb.late_fee }</td></tr>
		<tr><td>최대 지각 시간</td><td>${gb.late_max }</td></tr>
		<tr><td>최대 지각비</td><td>${gb.late_maxFee }</td></tr>
		<tr><td>결석비</td><td>${gb.absent_fee }</td></tr>
		<tr><td>기타 벌금</td><td>${gb.fee }</td></tr>
		<tr><td>기타 rule</td><td>${gb.rule }</td></tr>
	</table>
	
	<div class="title"><h4><b>&lt;그룹 정보&gt;</b></h4></div>
	<table class="table_center default_table">
		<tr><td>모임 도시</td><td>${gb.city }</td></tr>
		<tr><td>목적</td><td>${gb.goal }</td></tr>
		<tr><td>카테고리</td><td>${gb.category }</td></tr>
		<tr><td>해시태그</td><td>${gb.hashTag }</td></tr>
		<tr><td>공개여부</td><td><c:if test="${gb.secret eq false }">공개</c:if><c:if test="${gb.secret eq ture }">비공개</c:if></td></tr>
	</table>

<div class="title"><h1>회원 목록</h1></div>
	<table class="table_center default_thTable">
		<th>아이디</th><th>이름</th><th>이메일</th><th>가입날짜</th>
			<c:forEach items="${group_map }" var="map">
				<tr><td>${map.key.id }</td><td>${map.key.name }</td>
					<td>${map.key.email }</td>
					<td>${map.value }</td>
				</tr>
			</c:forEach>
	</table>
</div>
<c:import url="/member/bottom" />
</body>
</html>