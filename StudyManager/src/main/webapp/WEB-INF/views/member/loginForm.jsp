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
<form action="<c:url value="/loginProcess"/>" method="post" name="fr">
아이디:<input type="text" name="id"><br>
비밀번호 :<input type="password" name="pass"><br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="submit" value="로그인">
<a href="<c:url value="/member/insert"/>">회원가입</a>
</form>
<c:if test="${errorMesg ne null }">
<script type="text/javascript">
alert('${errorMesg }');
</script>
</c:if>
</body>
</html>