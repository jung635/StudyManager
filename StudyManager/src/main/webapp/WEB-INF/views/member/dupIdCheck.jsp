<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
function goId(id, dupCheck){
	if(dupCheck){
		window.opener.fr.id.value=id;
		window.close();
	}
}

function dupCheckFun(){
	check = fr.dupCheck.value;
	dupId = fr.id.value;
	if(check == "true"){
		document.getElementById("dupCheckResult").innerHTML = "��밡���� ���̵��Դϴ�.";
	}else if(dupId == "" || check == "" ){
		
	}else{
		document.getElementById("dupCheckResult").innerHTML = "�ߺ��Ǵ� ���̵��Դϴ�.";
	}
}

$(document).ready(function(){
	dupCheckFun();
})
</script>
</head>
<body>
<form action="<c:url value='/member/dupIdCheck'/>" method="post" name="fr">
<input type="hidden" name="dupCheck" value="${dupCheck }">
���̵�: <input type="text" name="id" value="${dupId}">
<span id="dupCheckResult"></span>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="submit" value="�ߺ�Ȯ��">
<c:if test="${dupCheck}">
<input type="button" value="����ϱ�" onclick="goId('${dupId}',${dupCheck})">
</c:if>
</form>
</body>
</html>