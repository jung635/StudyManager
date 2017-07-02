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
<form action="<c:url value="/board/update?${_csrf.parameterName}=${_csrf.token}"/>" method="post" name="fr" enctype="multipart/form-data">
<table>
<tr><td>이름 <input type="text" name="name" value="${bb.name }" readonly></td></tr>
<tr><td>비밀번호 <input type="text" name="pass"></td></tr>
<tr><td>제목 <input type="text" name="subject" value="${bb.subject }"></td></tr>
<tr><td>내용 <textarea name="content" cols="60" rows="15">${bb.content }</textarea></td></tr>
<tr><td>첨부파일 <input type="file" name="fileInput">${bb.fileName }</td></tr>
</table>
<input type="hidden" name="file_ori" value="${bb.file }">
<input type="hidden" name="fileName" value="${bb.fileName }">
<input type="hidden" name="num" value="${bb.num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<input type="submit" value="등록">
<input type="button" value="취소" onclick="history.back()">
</form>
</body>
</html>