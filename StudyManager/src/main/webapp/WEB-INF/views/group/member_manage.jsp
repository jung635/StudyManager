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
function searchMember(){  
	search_id = document.getElementById("search_input").value;
	var xhttp;    
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("memberList").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "/web/group/memberSearchList?search_id="+search_id, true);
	xhttp.send();	
}
</script>
<body>
<c:import url="/group/header" />
<c:import url="/group/manage_nav" />
<div id="content">
	<h2>멤버 관리</h2>
		<h4>그룹 멤버</h4>
			<table border="1">
				<c:forEach items="${member }" var="member">
					<tr><td>${member }</td>
						<td><input type="button" value="강제 탈퇴" onclick="location.href='<c:url value="/group/memberDelete?member_id=${member }"/>'"></td>
						<td><input type="button" value="회원 정보 보기" onclick="location.href='<c:url value="/group/memberInfo?member_id=${member }"/>'"></td></tr>
				</c:forEach>
			</table>
		
		<h4>멤버 추가하기</h4>
			<div id="addMember">
			<input type="text" id="search_input"><input type="button" value="검색" onclick="searchMember()">
				<div id="memberList"></div>
			</div>
</div>
</body>
</html>