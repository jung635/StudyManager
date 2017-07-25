<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
  if('${gb.hashTag}'.trim().length>0){
	  hashTag_array = '${gb.hashTag}'.split(",");
	  for(i=0; i<hashTag_array.length; i++){
		  document.getElementById("hashTag_view").innerHTML += "<div class='choose_box' id='hashTag_"+i+"''><span class='hashTag_value_part'>"+hashTag_array[i]+"</span><span class='glyphicon glyphicon-remove pointer' onclick='tagDelete("+i+")'></span></div>"
	  } 
  }
  if('${gb.category}'.trim().length>0){
	  category_array = '${gb.category}'.split(",");
	  for(i=0; i<category_array.length; i++){
		  document.getElementById("category_view").innerHTML += "<div class='choose_box' id='category_"+i+"'><span class='category_value_part'>"+category_array[i]+"</span><span class='glyphicon glyphicon-remove pointer' onclick='categoryDelete("+i+")'></span></div>";
	  } 
  }
  
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


tag_count = '${gb.hashTag}'.split(",").length;
if('${gb.hashTag}'.trim().length==0) tag_count = 0;
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
				document.getElementById("hashTag_view").innerHTML += "<div class='choose_box' id='hashTag_"+tag_count+"'><span class='hashTag_value_part'>"+hashTag_input+"</span><span class='glyphicon glyphicon-remove pointer' onclick='tagDelete("+tag_count+")'></span></div>"
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

category_count = '${gb.category}'.split(",").length;
if('${gb.category}'.trim().length==0) category_count = 0;
function categoryInput(){
	category_input = document.getElementById("category_input").value;
	category_index = document.getElementById("category_input").selectedIndex;
	if(category_count>2){
		alert("3개까지 가능합니다.");
	}else{
		if(category_index>0){
			if(category_count>0){
				document.getElementById("category_view").innerHTML += "<div class='choose_box' id='category_"+category_count+"'><span class='category_value_part'>"+category_input+"</span><span class='glyphicon glyphicon-remove pointer' onclick='categoryDelete("+category_count+")'></span></div>";
				category_count ++;
				document.getElementById("category_input").value = "선택하세요";
			}else{
				document.getElementById("category_view").innerHTML += "<div class='choose_box' id='category_"+category_count+"'><span class='category_value_part'>"+category_input+"</span><span class='glyphicon glyphicon-remove pointer' onclick='categoryDelete("+category_count+")'></span></div>";
				category_count ++;
				document.getElementById("category_input").value = "선택하세요";
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
</head>
<body>
<c:import url="/member/header" />
<c:import url="/group/header" />
<div class="container">
<c:import url="/group/manage_nav" />
	<div id="right_nav_content">
	<div class="title"><h1>그룹 관리</h1></div>
	<div id="group_make_container">
		<form action="<c:url value="/group/update"/>" method="post" name="fr" onsubmit="return submitCheck()">
			<div class="group_make_content">
				그룹 이름 : <input type="text" name="name" value="${gb.name }">
			</div>
			<div class="group_make_content">
				<h4><b>&lt;기본 RULE 설정&gt;</b></h4>
				요일: 
					월<input type="checkbox" name="week" value="월" <c:if test="${fn:contains(gb.week, '월') }">checked</c:if>>
					화<input type="checkbox" name="week" value="화" <c:if test="${fn:contains(gb.week, '화') }">checked</c:if>>
					수<input type="checkbox" name="week" value="수" <c:if test="${fn:contains(gb.week, '수') }">checked</c:if>>
					목<input type="checkbox" name="week" value="목" <c:if test="${fn:contains(gb.week, '목') }">checked</c:if>>
					금<input type="checkbox" name="week" value="금" <c:if test="${fn:contains(gb.week, '금') }">checked</c:if>>
					토<input type="checkbox" name="week" value="토" <c:if test="${fn:contains(gb.week, '토') }">checked</c:if>>
					일<input type="checkbox" name="week" value="일" <c:if test="${fn:contains(gb.week, '일') }">checked</c:if>><br>
	
				
				시간: 
				<input type="time" name="start_time" value="${gb.start_time }">
			</div>
			<div class="group_make_content">
				<h4><b>&lt;지각 RULE 설정&gt;</b></h4>
				<table>
					<tr><td>지각 시작 시간</td><td><input type="time" name="late_start" value="${gb.late_start }"></td></tr>
					<tr><td>시간 간격</td><td><input type="number" name="late_interval" value="${gb.late_interval }">분</td></tr>
				 	<tr><td>지각비</td><td><input type="number" name="late_fee" value="${gb.late_fee }"></td></tr>
					<tr><td>최대 지각 시간</td><td><input type="time" name="late_max" value="${gb.late_max }"></td></tr>
					<tr><td>최대 지각비</td><td><input type="number" name="late_maxFee" value="${gb.late_maxFee }"></td></tr>
					<tr><td>결석비</td><td><input type="number" name="absent_fee" value="${gb.absent_fee }"></td></tr>
					<tr><td>기타 벌금</td><td><input type="number" name="fee" value="${gb.fee }"></td></tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div id="rule_warn">
					**입력 하지 않을 시 기본 값으로 저장됩니다.<br>
					지각 시작 시간 : AM 11:00<br>
					시간 간격 : 10분<br>
				 	지각비 : 1000원<br>
					최대 지각 시간 : PM12:00<br>
					최대 지각비 : 6000원<br>
					결석비 : 10000원<br>
					기타 벌금 : 2000원
				</div>
				<input type="hidden" name="late_start_default" value="11:00:00">
				<input type="hidden" name="late_interval_default" value="10">
			 	<input type="hidden" name="late_fee_default" value="1000">
				<input type="hidden" name="late_max_default" value="12:00:00">
				<input type="hidden" name="late_maxFee_default" value="6000">
				<input type="hidden" name="absent_fee_default" value="10000">
				<input type="hidden" name="fee_default" value="2000">
			</div>
			<div class="group_make_content">
				<h4><b>&lt;기타 RULE 설정&gt;</b></h4>
				<textarea rows="4" cols="50" name="rule">${gb.rule }</textarea>
			</div>
			
			<div class="group_make_content">
				<h4><b>&lt;그룹 정보&gt;</b></h4>
				<table>
					<tr>
						<td>지역</td>
						<td>
							<select name="city">
								<option>선택하세요</option>	
								<option value="서울" <c:if test="${gb.city eq '서울' }">selected</c:if>>서울</option>	
								<option value="부산광역시" <c:if test="${gb.city eq '부산광역시' }">selected</c:if>>부산광역시</option>	
								<option value="인천광역시" <c:if test="${gb.city eq '인천광역시' }">selected</c:if>>인천광역시</option>	
								<option value="경기도" <c:if test="${gb.city eq '경기도' }">selected</c:if>>경기도</option>	
								<option value="대구광역시" <c:if test="${gb.city eq '대구광역시' }">selected</c:if>>대구광역시</option>	
								<option value="대전광역시" <c:if test="${gb.city eq '대전광역시' }">selected</c:if>>대전광역시</option>	
								<option value="광주광역시" <c:if test="${gb.city eq '광주광역시' }">selected</c:if>>광주광역시</option>	
								<option value="울산광역시" <c:if test="${gb.city eq '울산광역시' }">selected</c:if>>울산광역시</option>	
								<option value="강원도" <c:if test="${gb.city eq '강원도' }">selected</c:if>>강원도</option>	
								<option value="경상남도" <c:if test="${gb.city eq '경상남도' }">selected</c:if>>경상남도</option>	
								<option value="경상북도" <c:if test="${gb.city eq '경상북도' }">selected</c:if>>경상북도</option>	
								<option value="전라남도" <c:if test="${gb.city eq '전라남도' }">selected</c:if>>전라남도</option>	
								<option value="전라북도" <c:if test="${gb.city eq '전라북도' }">selected</c:if>>전라북도</option>	
								<option value="충청남도" <c:if test="${gb.city eq '충청남도' }">selected</c:if>>충청남도</option>	
								<option value="충청북도" <c:if test="${gb.city eq '충청북도' }">selected</c:if>>충청북도</option>	
								<option value="제주도" <c:if test="${gb.city eq '제주도' }">selected</c:if>>제주도</option>	
							</select>
						</td>
					</tr>
					<tr>
						<td>목적</td> 
						<td>
							<select name="goal">
								<option>선택하세요</option>	
								<option value="취업" <c:if test="${gb.goal eq '취업' }">selected</c:if>>취업</option>	
								<option value="취미" <c:if test="${gb.goal eq '취미' }">selected</c:if>>취미</option>	
								<option value="시험" <c:if test="${gb.goal eq '시험' }">selected</c:if>>시험</option>	
								<option value="학습" <c:if test="${gb.goal eq '학습' }">selected</c:if>>학습</option>	
								<option value="기타" <c:if test="${gb.goal eq '기타' }">selected</c:if>>기타</option>	
							</select>
						</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select style="float:left" id="category_input" onclick="categoryInput()">
								<option>선택하세요</option>	
								<option value="IT">IT</option>	
								<option value="면접">면접</option>	
								<option value="수능">수능</option>	
								<option value="토익">토익</option>	
								<option value="토스">토스</option>	
								<option value="오픽">오픽</option>	
								<option value="일본어">일본어</option>	
								<option value="중국어">중국어</option>	
								<option value="jpt">jpt</option>	
								<option value="jlpt">jlpt</option>	
								<option value="hsk">hsk</option>	
								<option value="공무원">공무원</option>	
								<option value="디자인">디자인</option>	
								<option value="영어">영어</option>	
								<option value="NCS">NCS</option>	
								<option value="경제">경제</option>	
								<option value="대기업적성검사">대기업적성검사</option>	
								<option value="공기업">공기업</option>	
								<option value="어학">어학</option>	
								<option value="자격증">자격증</option>	
								<option value="기타">기타</option>	
							</select>
							<span style="float:left">**최대 3개 가능</span><div id="category_view" style="float:left"></div>
							<input type="hidden" name="category">
						</td>
					</tr>
					<tr>
						<td>해시태그</td>
						<td><input type="text" onkeyup="hashTagInput(event)" id="hashTag_input"  style="float:left"><span style="float:left"> **최대 3개 가능</span><div id="hashTag_view" style="float:left"></div>
						<input type="hidden" name="hashTag"></td>
					</tr>
					<tr>
						<td>공개여부</td>
						<td>
							<input type="radio" value="false" name="secret" <c:if test="${gb.secret eq false }">checked</c:if> >공개　
			            	<input type="radio" value="true" name="secret" <c:if test="${gb.secret eq true }">checked</c:if> >비공개
			            </td>
			         </tr>
				</table>
		    </div>
		    <div style="margin-top: 40px;margin-bottom: 30px;">
		    <input type="hidden" value="${gb.num }" name="num">
				<input type="submit" value="수정하기">
				<input type="button" value="그룹삭제" onclick="history.back()">
			</div>
		</form>
	</div>
	</div>
</div>
<c:import url="/member/bottom" />
</body>
</html>