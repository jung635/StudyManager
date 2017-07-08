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
	document.getElementById("stauts").value = "absence";
	document.getElementById("member_id").value = id;
	document.fr.action = "/web/group/attendence";
	document.fr.method = "post";
	document.fr.submit();
}
</script>
<body>
<c:import url="/group/header" />
<form action="" name="fr" method="post">
<h2>기준 시간</h2>
지각 시작 시간 : <input type="time" name="late_start" value="${gb.late_start }"><br>
	시간 간격 : <input type="number" name="late_interval" value="${gb.late_interval }">분<br>
 	지각비 : <input type="number" name="late_fee" value="${gb.late_fee }" }><br>
	최대 지각 시간 : <input type="time" name="late_max" value="${gb.late_max }"><br>
	최대 지각비 : <input type="number" name="late_maxFee" value="${gb.late_maxFee }"><br>
	<input type="hidden" id="status" name="status" value="">
	<input type="hidden" id ="member_id" name="member_id" value="">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table border="1">
		<th>아이디</th><th>이름</th><th>나이</th><th>성별</th><th>이메일</th><th>출결 처리</th><th>출결 결과</th><th>출석 시간</th><th>지각비</th><th>결석비</th>
			<c:forEach items="${group_map }" var="map">
				<tr><td>${map.key.id }</td><td>${map.key.name }</td>
					<td>${map.key.age }</td><td>${map.key.gender }</td>
					<td>${map.key.email }</td>
					<td><input type="button" value="출석" onclick="attend('${map.key.id }')"><input type="button" value="결석" onclick="absence('${map.key.id }')"></td>
					<td>${map.value.status}</td>
					<td>${map.value.attend_time}</td>
					<td>${map.value.late_fee}</td>
					<td>${map.value.absent_fee}</td>
				</tr>
			</c:forEach>
	</table>
</form>
</body>
</html>