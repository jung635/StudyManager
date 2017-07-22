<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});
function submitCheck(){
	if(document.fr.name.value == ""){
		alert("이름을 입력해주세요");
		return false;
	}
	//해시태그
	hashTag_part = document.getElementsByClassName("hashTag_value_part");
	hashTag_result = "";
	for(i=0; i<hashTag_part.length; i++){
		if(i==hashTag_part.length-1) hashTag_result += hashTag_part[i].innerHTML;
		else hashTag_result += hashTag_part[i].innerHTML+",";
	}
	document.fr.hashTag.value = hashTag_result;
	//alert(hashTag_result);
	
	//카테고리
	category_part = document.getElementsByClassName("category_value_part");
	category_result = "";
	for(i=0; i<category_part.length; i++){
		if(i==category_part.length-1) category_result += category_part[i].innerHTML;
		else category_result += category_part[i].innerHTML+",";
	}
	document.fr.category.value = category_result;
	//alert(category_result);

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
	document.getElementById("addBoard").innerHTML += "<input type='text' name='board'><br>"
}


function insertBoard(){
	table = document.getElementById("board_table");
	row = table.insertRow();
	cell = row.insertCell();
	row.addEventListener("mouseover", function(){
		findRow(this.rowIndex);
	});
	cell.innerHTML += "<input type='text' name='board'><input type='button' value='삭제' onclick='deleteBoard()'>";
}

function deleteBoard(){
	table = document.getElementById("board_table");
	row = table.clickedRowIndex;
	table.deleteRow(row);
}

function findRow(row){
	table = document.getElementById("board_table");
	table.clickedRowIndex=row;
}

tag_count = 0;
function hashTagInput(event){
	if(event.keyCode == 32 || event.keyCode == 13){
		if(tag_count>2){
			alert("3개까지 가능합니다.");
		}else{
			hashTag_input = document.getElementById("hashTag_input").value
			if(hashTag_input.trim() == ""){
				alert("내용을 입력해주세요");
			}else{
				tag_count ++;
				if(hashTag_input.startsWith("#")) hashTag_input = hashTag_input.substring(1, hashTag_input.length);
				document.getElementById("hashTag_view").innerHTML += "<div id='hashTag_"+tag_count+"'style='float:left'><span class='hashTag_value_part'>"+hashTag_input+"</span><span class='glyphicon glyphicon-remove' onclick='tagDelete("+tag_count+")'></span></div>"
				document.getElementById("hashTag_input").value = "";
			}
		}
	}
}

function tagDelete(count){
	tag_count --;
	item = document.getElementById("hashTag_"+count);
	item.parentNode.removeChild(item);
}

category_count = 0;
category_block_tmp = 0;
function categoryInput(){
	category_input = document.getElementById("category_input").value;
	category_index = document.getElementById("category_input").selectedIndex;
	if(category_count>2){
		alert("3개까지 가능합니다.");
	}else{
		if(category_index>0){
			if(category_count>0){
				prev_catogory = document.getElementById("category_value_"+(category_block_tmp-1).toString()).innerHTML;
				//+(category_count-1).toString()
				//alert(prev_catogory);
				if(category_input!=prev_catogory){
					document.getElementById("category_view").innerHTML += "<div id='category_"+category_count+"'style='float:left'><span class='category_value_part' id='category_value_"+category_block_tmp+"'>"+category_input+"</span><span class='glyphicon glyphicon-remove' onclick='categoryDelete("+category_count+")'></span></div>";
					category_block_tmp ++;
					category_count ++;
				}
			}else{
				document.getElementById("category_view").innerHTML += "<div id='category_"+category_count+"'style='float:left'><span class='category_value_part' id='category_value_"+category_count+"'>"+category_input+"</span><span class='glyphicon glyphicon-remove' onclick='categoryDelete("+category_count+")'></span></div>";
				category_block_tmp ++;
				category_count ++;
			}
		}
	}
	
	
}

function categoryDelete(count){
	category_count --;
	item = document.getElementById("category_"+count);
	item.parentNode.removeChild(item);
}
</script>
<body>
<c:import url="/member/header" />
<div class="title"><h1>그룹 만들기</h1></div>
<div style="margin-left: 43%; margin-top: 50px">
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
		요일: 
		<input type="checkbox" name="week" value="mon">월
		<input type="checkbox" name="week" value="tue">화
		<input type="checkbox" name="week" value="wed">수
		<input type="checkbox" name="week" value="thu">목
		<input type="checkbox" name="week" value="fri">금
		<input type="checkbox" name="week" value="sat">토
		<input type="checkbox" name="week" value="sun">일<br>
		<!-- 중복 안되게 처리하기 -->
		<h4>생성할 게시판</h4>
		<table id="board_table">
			<tr onmouseover="findRow(this.rowIndex)"><td><input type="text" name="board" value="공지사항"><input type='button' value="삭제" onclick="deleteBoard()"></td></tr>
			<tr onmouseover="findRow(this.rowIndex)"><td><input type="text" name="board" value="자유게시판"><input type='button' value="삭제" onclick="deleteBoard()"></td></tr>
		</table>
		<div id="addBoard"></div>
		<input type="button" value="추가" onclick="insertBoard()"><br>
		**기본적으로 모든 회원이 댓글 및 글쓰기 권한이 있습니다. 게시판 관리에서 권한을 변경 할 수 있습니다.
		
		
		<h4>그룹 정보</h4>
		지역: <select name="city">
			<option>선택하세요</option>	
			<option value="seoul">서울</option>	
			<option value="busan">부산광역시</option>	
			<option value="incheon">인천광역시</option>	
			<option value="gyeonggi">경기도</option>	
			<option value="daegu">대구광역시</option>	
			<option value="daejeon">대전광역시</option>	
			<option value="gwangju">광주광역시</option>	
			<option value="ulsan">울산광역시</option>	
			<option value="gangwon">강원도</option>	
			<option value="gyeongNam">경상남도</option>	
			<option value="gyeongBuk">경상북도</option>	
			<option value="jeoNam">전라남도</option>	
			<option value="jeoBuk">전라북도</option>	
			<option value="chungNam">충청남도</option>	
			<option value="chungBuk">충청북도</option>	
			<option value="Jeju">제주도</option>	
			</select><br>
		목적: 
		<select name="goal">
			<option value="job">취업</option>	
			<option value="hobby">취미</option>	
			<option value="exam">시험</option>	
			<option value="study">학습</option>	
			<option value="etc">기타</option>	
		</select><br>
		<span style="float:left">카테고리: </span>
		<select style="float:left" id="category_input" onclick="categoryInput()">
			<option>선택하세요</option>	
			<option value="it">IT</option>	
			<option value="interview">면접</option>	
			<option value="high_scool">수능</option>	
			<option value="toeic">토익</option>	
			<option value="toss">토스</option>	
			<option value="opic">오픽</option>	
			<option value="japan">일본어</option>	
			<option value="china">중국어</option>	
			<option value="jpt">jpt</option>	
			<option value="jlpt">jlpt</option>	
			<option value="hsk">hsk</option>	
			<option value="goverment">공무원</option>	
			<option value="design">디자인</option>	
			<option value="english">영어</option>	
			<option value="nsc">NCS</option>	
			<option value="economy">경제</option>	
			<option value="big_company">대기업적성검사</option>	
			<option value="goverment_company">공기업준비</option>	
			<option value="laguage">어학</option>	
			<option value="exam">자격증</option>	
			<option value="etc">기타</option>	
		</select><span style="float:left">**최대 3개 가능</span><div id="category_view" style="float:left"></div><br>
		<input type="hidden" name="category">
		<span style="float:left">해시태그: </span><input type="text" onkeyup="hashTagInput(event)" id="hashTag_input"  style="float:left"><span style="float:left"> **최대 3개 가능</span> <div id="hashTag_view" style="float:left"></div><br>
		<input type="hidden" name="hashTag">
		공개여부: <input type="radio" value="false" name="secret">공개　
	            <input type="radio" value="true" name="secret">비공개　<br>
	    <div style="margin-top: 40px;margin-bottom: 30px;">
			<input type="submit" value="작성 완료">
			<input type="button" value="취소" onclick="history.back()">
		</div>
	</form>
</div>
</body>
</html>