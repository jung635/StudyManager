<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Study Manager</title>
	<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
  <meta charset="utf-8">
</head>
<body>
<!-- Navbar -->
<c:import url="/member/header" />

<!-- First Container -->
<div class="container-fluid_first bg-1 text-center">
  <h3 class="margin">Create your Group!</h3>
  <a href="<c:url value="/group/make"/>" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-flash"></span> Create
  </a>
</div>

<!-- Second Container -->
<div class="container-fluid_first bg-2 text-center">
<form action="<c:url value="/group/search"/>" method="post" name="searchFr">
	<h3 class="margin">What are you looking for?</h3>
  지역: <select style="color:black" name="city">
		<option value="">선택하세요</option>	
		<option value="서울">서울</option>	
		<option value="부산광역시">부산광역시</option>	
		<option value="인천광역시">인천광역시</option>	
		<option value="경기도">경기도</option>	
		<option value="대구광역시">대구광역시</option>	
		<option value="대전광역시">대전광역시</option>	
		<option value="광주광역시">광주광역시</option>	
		<option value="울산광역시">울산광역시</option>	
		<option value="강원도">강원도</option>	
		<option value="경상남도">경상남도</option>	
		<option value="경상북도">경상북도</option>	
		<option value="전라남도">전라남도</option>	
		<option value="전라북도">전라북도</option>	
		<option value="충청남도">충청남도</option>	
		<option value="충청북도">충청북도</option>	
		<option value="제주도">제주도</option>	
	</select>
	요일: 
		월<input type="checkbox" name="week" value="월">
		화<input type="checkbox" name="week" value="화">
		수<input type="checkbox" name="week" value="수">
		목<input type="checkbox" name="week" value="목">
		금<input type="checkbox" name="week" value="금">
		토<input type="checkbox" name="week" value="토">
		일<input type="checkbox" name="week" value="일"><br>
	목적: 
		<select name="goal" style="color:black">
			<option value="">선택하세요</option>
			<option value="취업">취업</option>	
			<option value="취미">취미</option>	
			<option value="시험">시험</option>	
			<option value="학습">학습</option>	
			<option value="기타">기타</option>	
		</select>	
		카테고리:
		<select name="category" style="color:black">
			<option value="">선택하세요</option>	
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
			<option value="공기업준비">공기업준비</option>	
			<option value="어학">어학</option>	
			<option value="자격증">자격증</option>	
			<option value="기타">기타</option>	
		</select>
		<br>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="text" name="search_input" placeholder="검색어는 그룹 이름이나 해시태그를 기준으로 검색됩니다." style="width:50%; color:black">
	<a href="#" class="btn btn-default btn-lg" onclick="document.searchFr.submit()">
    <span class="glyphicon glyphicon-search"></span> Search
  </a>
  </form>
</div>
<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center clear">    
  <h3 class="margin">My Groups</h3><br>

  <div class="row">
	<div class="container">
		<table  class="table_center default_thTable" style="width: 100%">
		<th>그룹 이름</th><th>만나는 요일</th><th>만나는 시간</th><th>도시</th><th>목적</th><th>카테고리</th><th>해시태그</th>
		<c:forEach items="${group_map }" var="key" >
			<tr>
				<td><a href="<c:url value="/group/main?group_num=${key.value.num }"/>">${key.value.name }</a>
					<c:if test="${key.value.admin eq id }"><b> (관리자입니다)</b></c:if>
					<a href="<c:url value="/group/main?group_num=${key.value.num }"/>" class="btn btn-default btn-lg" style="padding: 3px; font-size: 15px; margin-left: 20px;">
						Go <span class="glyphicon glyphicon-hand-right"></span>
	       			</a>
	       		</td>
				<td>${key.value.week }</td>
				<td>${key.value.start_time }</td>
				<td>${key.value.city }</td>
				<td>${key.value.goal }</td>
				<td>${key.value.category }</td>
				<td>${key.value.hashTag }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
  </div>
</div>

<!-- Footer -->
<c:import url="/member/bottom" />

</body>
</html>