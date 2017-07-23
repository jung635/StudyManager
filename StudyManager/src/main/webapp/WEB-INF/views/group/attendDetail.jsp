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
		<div class="title"><h3>벌금 수정</h3></div>
		<form action="<c:url value="/group/attendUpdate"/>" method="post">
			<table class="table_center default_table">
				<tr><td>아이디</td><td>${ab.id }</td></tr>
				<tr><td>지불금액</td><td><input name="pay_fee" type="number" value="${ab.absent_fee + ab.fee + ab.late_fee }"></td></tr>
				<tr><td>이유</td>
					<td>
						<select name="status" >
							<option value="late" <c:if test="${ab.status eq 'late' }">selected</c:if>>지각</option>
							<option value="absent" <c:if test="${ab.status eq 'absent' }">selected</c:if>>결석</option>
							<option value="fee" <c:if test="${ab.status eq 'fee' }">selected</c:if>>벌금</option>
						</select>
					</td>
				</tr>
				<tr><td>지불상태</td>
					<td><input type="radio" value="true" name="payed" <c:if test="${ab.payed eq true }">checked</c:if> >지불 완료　
			            	<input type="radio" value="false" name="payed" <c:if test="${ab.payed eq false }">checked</c:if>>미지불</td></tr>
				<tr><td>날짜</td><td>${ab.date }</td></tr>
				<tr><td>시간</td><td>${ab.attend_time }</td></tr>
			</table>
			<input type="hidden" name="num" value="${ab.num }">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="text_center" style="margin-top: 20px">
				<input type="submit" value="수정완료">
				<input type="button" value="취소" onclick="history.back()">
			</div>
		</form>
	</div>
</div>
</body>
</html>