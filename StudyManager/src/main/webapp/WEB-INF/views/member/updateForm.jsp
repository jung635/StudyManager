<%@page import="java.sql.*"%>
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
<h1>회원정보수정</h1>
<form action="<c:url value="/member/update"/>" method="post" name="fr">
아이디:<input type="text" name="id" value="${mb.id }" readonly><br>
비밀번호 확인 :<input type="password" name="pass"><br>
이름 :<input type="text" name="name" value="${mb.name}"><br>
나이 :<input type="text" name="age" value="${mb.age }"><br>
성별 :<input type="radio" name="gender" value="남" <c:if test="${mb.gender eq '남' }">checked</c:if>>남
<input type="radio" name="gender" value="여" <c:if test="${mb.gender eq '여' }">checked</c:if>>여<br>
email :<input type="text" name="email" value="${mb.email }"><br>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="submit" value="회원정보수정">
</form>
</body>
</html>