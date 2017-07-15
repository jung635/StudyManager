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

	if(document.fr.late_start.value == ""){
		document.fr.late_start.value = document.fr.late_start_default.value;
	}
	if(document.fr.late_interval.value == ""){
		document.fr.late_interval.value = document.fr.late_interval_default.value;
	}
	if(document.fr.late_fee.value == ""){
		document.fr.late_fee.value = document.fr.late_fee_default.value;
	}
	if(document.fr.late_max.value == ""){
		document.fr.late_max.value = document.fr.late_max_default.value;
	}
	if(document.fr.late_maxFee.value == ""){
		document.fr.late_maxFee.value = document.fr.late_maxFee_default.value;
	}
	if(document.fr.absent_fee.value == ""){
		document.fr.absent_fee.value = document.fr.absent_fee_default.value;
	}
	if(document.fr.fee.value == ""){
		document.fr.fee.value = document.fr.fee_default.value;
	}
}

function makeBoard(){
	board_count = document.fr.name.board_coun;
	for(i=0; i<board_count; i++){
		document.getElementById("addBoard").innerHTML = "<input type='text' name='board_name'"+i+">"
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
	결석비 : <input type="number" name="absent_fee"><br>
	기타 벌금 : <input type="number" name="fee"><br>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="submit" value="작성 완료">
	<input type="button" value="취소" onclick="history.back()"><br>
	**입력 하지 않을 시 기본 값으로 저장됩니다.<br>
	지각 시작 시간 : AM 11:00<br>
	시간 간격 : 10분<br>
 	지각비 : 1000원<br>
	최대 지각 시간 : PM12:00<br>
	최대 지각비 : 6000원<br>
	결석비 : 10000원<br>
	기타 벌금 : 2000원<br>
	<input type="hidden" name="late_start_default" value="11:00:00">
	<input type="hidden" name="late_interval_default" value="10">
 	<input type="hidden" name="late_fee_default" value="1000">
	<input type="hidden" name="late_max_default" value="12:00:00">
	<input type="hidden" name="late_maxFee_default" value="6000">
	<input type="hidden" name="absent_fee_default" value="10000">
	<input type="hidden" name="fee_default" value="2000"><br>
	<h4>생성할 게시판</h4>
	<!-- 중복 안되게 처리하기 -->
<!-- 	생성할 게시판 개수: <input type="number" name="board_count"><input type="button" value="생성하기" onclick="makeBoard()">
	<div id="addBoard"></div> -->
</form>
*게시판은 공지사항과 자유게시판이 기본적으로 생성되며 추후에 새로 생성 가능합니다.<br>
</body>
</html>