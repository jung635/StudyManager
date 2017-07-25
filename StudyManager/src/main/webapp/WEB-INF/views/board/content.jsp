<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
function reReplyGo(reply_num){  
	content = document.getElementById("reRe_content"+reply_num).value;
	
 	var xhttp;    
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			reReplyView(reply_num);
		}
	};
	xhttp.open("GET", "/web/board/reReply?num="+'${bb.num }'+"&pageNum="+'${pageNum }'+"&re_num="+reply_num+
			"&content="+content, true);
	xhttp.send();	  
	document.getElementById("reRe_content"+reply_num).value = "";
}

function reReplyView(reply_num){  
 	var xhttp;    
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("reReply_box"+reply_num).innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "/web/board/reReplyView?num="+'${bb.num }'+"&pageNum="+'${pageNum }'+"&re_num="+reply_num, true);
	xhttp.send();
}

function replyToggle(reply_num){
	$(document).ready(function(){
        $("#reReply_box_toggle"+reply_num).toggle();
        $("#reReply_box"+reply_num).toggle();
        reReplyView(reply_num);
	});
}
</script>
</head>
<body>
<c:import url="/member/header" />
<c:import url="/group/header" />
<div class="container">
	<div class="title"><h1>글내용</h1></div>
	<table class="table_center default_table">
		<tr><td>이름</td><td>${bb.name }</td></tr>
		<tr><td>제목</td><td>${bb.subject }</td></tr>
		<tr><td>내용</td><td>${bb.content }</td></tr>
		<tr><td>첨부파일</td><td><a href="<c:url value='/board/fileDownload?file=${bb.file }&fileName=${bb.fileName }'/>">${bb.fileName }</a></td></tr>
	</table>
	<c:if test="${bt.comment_auth eq 'all' }">
		<div id="reply_form">
			<table class="table_center default_topbotTable">
				<c:forEach var="reply" items="${replyList}">
					<tr><td>${bb.name }</td>
						<td>${reply.content }</td>
						<td><input type="button" value="대댓글 쓰기" onclick="replyToggle('${reply.re_num}')"></td>
					</tr>
					<tr id="reReply_box_toggle${reply.re_num }" style="display: none;">
						<td colspan="3">
							<div id="reReply_box${reply.re_num }" style="display: none;"></div>
								<textarea id="reRe_content${reply.re_num }" name="content" cols="60" rows="2"></textarea>
								<input type="hidden" name="group_num" value="${bb.group_num }">
								<input type="hidden" name="board_num" value="${bb.board_num }">
								<input type="hidden" name="num" value="${bb.num }">
								<input type="hidden" name="pageNum" value="${pageNum }">
								<input type="hidden" name="re_num" value="${reply.re_num }">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="button" value="댓글등록" onclick="reReplyGo('${reply.re_num }')">
						</td>
					</tr>
				</c:forEach>
			</table>
			<form action="<c:url value="/board/replyInsert"/>" method="post" name="reply_form">
				<textarea name="content" cols="60" rows="2"></textarea>
				<input type="hidden" name="group_num" value="${bb.group_num }">
				<input type="hidden" name="board_num" value="${bb.board_num }">
				<input type="hidden" name="num" value="${bb.num }">
				<input type="hidden" name="pageNum" value="${pageNum }">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="button" value="댓글등록" onclick="document.reply_form.submit()">
			</form>
		</div>
	</c:if>
	<div class="text_center" style="margin-top: 20px">
		<input type="button" value="수정하기" onclick="location.href='<c:url value="/board/update?num=${bb.num }&pageNum=${pageNum }"/>'">
		<input type="button" value="삭제하기" onclick="location.href='<c:url value="/board/delete?num=${bb.num }&board_num=${bb.board_num }"/>'">
		<input type="button" value="목록돌아가기" onclick="location.href='<c:url value="/board/list?pageNum=${pageNum }&board_num=${bb.board_num }"/>'">
	</div>
</div>
<c:import url="/member/bottom" />
</body>
</html>