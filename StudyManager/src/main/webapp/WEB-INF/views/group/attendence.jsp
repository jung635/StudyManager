<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function attend(id){
	document.getElementById("status").value = "attend";
	document.getElementById("member_id").value = id;
	document.fr.action = "/web/group/attendence";
	document.fr.method = "post";
	document.fr.submit();
}
function absence(id){
	document.getElementById("status").value = "absent";
	document.getElementById("member_id").value = id;
	document.fr.action = "/web/group/attendence";
	document.fr.method = "post";
	document.fr.submit();
}
</script>
<body>
<c:import url="/member/header" />
<c:import url="/group/header" />
<div class="container">
<div class="title"><h1>출석 체크</h1></div>
	<form action="" name="fr" method="post">
		<div id="attend_check">
			<h2>기준 시간</h2>
			지각 시작 시간 : <input type="time" name="late_start" value="${gb.late_start }"><br>
			시간 간격 : <input type="number" name="late_interval" value="${gb.late_interval }">분<br>
		 	지각비 : <input type="number" name="late_fee" value="${gb.late_fee }" }><br>
			최대 지각 시간 : <input type="time" name="late_max" value="${gb.late_max }"><br>
			최대 지각비 : <input type="number" name="late_maxFee" value="${gb.late_maxFee }"><br>
			결석비 : <input type="number" name="absent_fee" value="${gb.absent_fee }"><br>
			<input type="hidden" id="status" name="status" value="">
			<input type="hidden" id ="member_id" name="member_id" value="">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</div>
		<table class="table_center default_thTable"> 
			<th>아이디</th><th>이름</th><th>이메일</th><th>출결 결과</th><th>출석 시간</th><th>지각비</th><th>결석비</th><th>지불 상태</th><th>출결 처리</th><th>상태변경</th>
				<c:forEach items="${group_map }" var="map">
					<tr><td>${map.key.id }</td><td>${map.key.name }</td>
						<td>${map.key.email }</td>
						<td>${map.value.status}</td>
						<td>${map.value.attend_time}</td>
						<td>${map.value.late_fee}</td>
						<td>${map.value.absent_fee}</td>
						<td><c:if test="${map.value.payed eq false}">미지불</c:if><c:if test="${map.value.payed eq true}">지불 완료</c:if></td>
						<td><input type="button" value="출석" onclick="attend('${map.key.id }')"/><input type="button" value="결석" onclick="absence('${map.key.id }')"/></td>
						<td><input type="button" value="지불완료" onclick="location.href='<c:url value="/group/payDone?attend_num=${map.value.num }"/>'"></td>
					</tr>
				</c:forEach>
		</table>
	</form>
</div>
<c:import url="/member/bottom" />
</body>
</html>