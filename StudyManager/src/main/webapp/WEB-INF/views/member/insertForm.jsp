<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkDupId(){
	id = document.getElementById("id").value;
	window.open('/web/member/dupIdCheck?dupId='+id,'IdDupCheck','height=400 width=400');
}

function submitCheck(){
	if(document.fr.id.value == ""){
		alert("아이디를 입력해주세요");
		return false;
	}else if(document.fr.pass.value == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if(document.fr.name.value == ""){
		alert("이름을 입력해주세요");
		return false;
	}else if(document.fr.email.value == ""){
		alert("이메일을 입력해주세요");
		return false;
	}else if(document.fr.age.value == ""){
		document.fr.age.value = 0;
		return true;
	}
}
</script>
</head>
<body>
<form:form action="/web/member/insert" commandName="mb" method="post" name="fr" onsubmit="return submitCheck()">
 아이디:<input type="text" id="id" name="id" value="${mb.id }"><form:errors path="id"/>
 <input type="button" value="아이디 중복 확인" onclick="checkDupId()"><br>
비밀번호 :<input type="password" name="pass" value="${mb.pass }"><form:errors path="pass"/><br>
이름 :<input type="text" name="name" value="${mb.name }"><form:errors path="name"/><br>
나이 :<input type="number" name="age" value="${mb.age }"><form:errors path="age"/><br>
성별 :<input type="radio" name="gender" value="남" <c:if test="${mb.gender eq '남' }">checked</c:if>>남
<input type="radio" name="gender" value="여" <c:if test="${mb.gender eq '여' }">checked</c:if>>여<br>
email :<input type="text" name="email" value="${mb.email }"><form:errors path="email"/><br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="submit" value="회원가입">
</form:form>
</body>
</html>