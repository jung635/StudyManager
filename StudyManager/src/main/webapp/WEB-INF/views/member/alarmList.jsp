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
function move(url){
	window.open(url, "invited_view" , "width=600,height=500");
}
</script>
<body>
<c:import url="/member/header" />
<div class="container">
	<div class="title"><h1>메시지</h1></div>
	<table class="table_center default_thTable">
		<th>아이디</th><th>내용</th><th>날짜</th>
		<c:choose>
			<c:when test="${alarmList eq null }">
				내용이 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach items="${alarmList }" var="ab">
		 		<tr><td>${ab.id }</td><td onclick="move('${ab.move}')" style="cursor:pointer;">${ab.content }</td><td>${ab.date }</td></tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</body>
</html>