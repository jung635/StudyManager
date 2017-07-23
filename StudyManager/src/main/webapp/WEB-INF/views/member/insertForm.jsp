<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<link href="<c:url value='/resources/css/anonymous.css'/>" rel="stylesheet">
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
<div class="login_container">
	<h2>SignUp Form</h2>
	<form:form action="/web/member/insert" commandName="mb" method="post" name="fr" onsubmit="return submitCheck()"  style="border:1px solid #ccc; padding: 20px;">
	<div class="container">
		<label><b>아이디</b></label>
		<input type="text" id="id" name="id" value="${mb.id }"><form:errors path="id"/>
		<input type="button" value="아이디 중복 확인" onclick="checkDupId()"><br>
		<label><b>비밀번호</b></label>
		<input type="password" name="pass" value="${mb.pass }"><form:errors path="pass"/><br>
		<label><b>이름</b></label>
		<input type="text" name="name" value="${mb.name }"><form:errors path="name"/><br>
		<label><b>email</b></label><input type="text" name="email" value="${mb.email }"><form:errors path="email"/><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="clearfix">
		    <button type="button" class="cancelbtn" onclick="history.back()">Cancel</button>
		    <button type="submit" class="signupbtn">Sign Up</button>
	    </div>
	</div>
	</form:form>
</div>
</body>
</html>