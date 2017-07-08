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
function submitCheck(){
	if(document.fr.name.value == ""){
		alert("이름을 입력해주세요");
		return false;
	}
}
</script>
<body>
<h2>그룹 만들기</h2>
<form action="<c:url value="/group/make"/>" method="post" name="fr" onsubmit="return submitCheck()">
	그룹 이름 : <input type="text" name="name">
	<h4>지각 RULE 설정</h4>
	지각 시작 시간 : <input type="time" name="late_start"><br>
	시간 간격 : <input type="number" name="late_interval">분<br>
 	지각비 : <input type="number" name="late_fee"><br>
	최대 지각 시간 : <input type="time" name="late_max"><br>
	최대 지각비 : <input type="number" name="late_maxFee"><br>
	기타 벌금 : <input type="number" name="fee"><br>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="submit" value="작성 완료">
	<input type="button" value="취소" onclick="history.back()">
</form>
*게시판은 공지사항과 자유게시판이 기본적으로 생성되며 추후에 새로 생성 가능합니다.<br>
</body>
</html>