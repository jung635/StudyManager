<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/member/header" />
<div class="container">
		<div class="title"><h1>그룹 검색</h1></div>
		<div class="search_box text-center">
		<form action="<c:url value="/group/search"/>" method="post" name="searchFr">
		  지역: <select style="color:black" name="city">
				<option value="">선택하세요</option>	
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
			요일: 
				월<input type="checkbox" name="week" value="월" <c:if test="${fn:contains(gb.week, '월') }">checked</c:if>>
					화<input type="checkbox" name="week" value="화" <c:if test="${fn:contains(gb.week, '화') }">checked</c:if>>
					수<input type="checkbox" name="week" value="수" <c:if test="${fn:contains(gb.week, '수') }">checked</c:if>>
					목<input type="checkbox" name="week" value="목" <c:if test="${fn:contains(gb.week, '목') }">checked</c:if>>
					금<input type="checkbox" name="week" value="금" <c:if test="${fn:contains(gb.week, '금') }">checked</c:if>>
					토<input type="checkbox" name="week" value="토" <c:if test="${fn:contains(gb.week, '토') }">checked</c:if>>
					일<input type="checkbox" name="week" value="일" <c:if test="${fn:contains(gb.week, '일') }">checked</c:if>><br>
			목적: 
				<select name="goal" style="color:black">
					<option value="">선택하세요</option>
					<option value="취업" <c:if test="${gb.goal eq '취업' }">selected</c:if>>취업</option>	
					<option value="취미" <c:if test="${gb.goal eq '취미' }">selected</c:if>>취미</option>	
					<option value="시험" <c:if test="${gb.goal eq '시험' }">selected</c:if>>시험</option>	
					<option value="학습" <c:if test="${gb.goal eq '학습' }">selected</c:if>>학습</option>	
					<option value="기타" <c:if test="${gb.goal eq '기타' }">selected</c:if>>기타</option>	
				</select>	
				카테고리:
				<select name="category" style="color:black">
					<option value="">선택하세요</option>	
					<option value="IT" <c:if test="${gb.category eq 'IT' }">selected</c:if>>IT</option>	
					<option value="면접" <c:if test="${gb.category eq '면접' }">selected</c:if>>면접</option>	
					<option value="수능" <c:if test="${gb.category eq '수능' }">selected</c:if>>수능</option>	
					<option value="토익" <c:if test="${gb.category eq '토익' }">selected</c:if>>토익</option>	
					<option value="토스" <c:if test="${gb.category eq '토스' }">selected</c:if>>토스</option>	
					<option value="오픽" <c:if test="${gb.category eq '오픽' }">selected</c:if>>오픽</option>	
					<option value="일본어" <c:if test="${gb.category eq '일본어' }">selected</c:if>>일본어</option>	
					<option value="중국어" <c:if test="${gb.category eq '중국어' }">selected</c:if>>중국어</option>	
					<option value="jpt" <c:if test="${gb.category eq 'jpt' }">selected</c:if>>jpt</option>	
					<option value="jlpt" <c:if test="${gb.category eq 'jlpt' }">selected</c:if>>jlpt</option>	
					<option value="hsk" <c:if test="${gb.category eq 'hsk' }">selected</c:if>>hsk</option>	
					<option value="공무원" <c:if test="${gb.category eq '공무원' }">selected</c:if>>공무원</option>	
					<option value="디자인" <c:if test="${gb.category eq '디자인' }">selected</c:if>>디자인</option>	
					<option value="영어" <c:if test="${gb.category eq '영어' }">selected</c:if>>영어</option>	
					<option value="NCS" <c:if test="${gb.category eq 'NCS' }">selected</c:if>>NCS</option>	
					<option value="경제" <c:if test="${gb.category eq '경제' }">selected</c:if>>경제</option>	
					<option value="대기업적성검사" <c:if test="${gb.category eq '대기업적성검사' }">selected</c:if>>대기업적성검사</option>	
					<option value="공기업" <c:if test="${gb.category eq '공기업' }">selected</c:if>>공기업</option>	
					<option value="어학" <c:if test="${gb.category eq '어학' }">selected</c:if>>어학</option>	
					<option value="자격증" <c:if test="${gb.category eq '자격증' }">selected</c:if>>자격증</option>	
					<option value="기타" <c:if test="${gb.category eq '기타' }">selected</c:if>>기타</option>	
				</select>
				<br>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="text" name="search_input" value="${search_input }" <c:if test="${empty search_input }">placeholder="검색어는 그룹 이름이나 해시태그를 기준으로 검색됩니다."</c:if> style="width:50%; color:black">
			<a href="#" class="btn btn-default btn-lg" onclick="document.searchFr.submit()">
		    <span class="glyphicon glyphicon-search"></span> Search
		  </a>
		  </form>
		</div>
<div class="title"><h1>검색 결과</h1></div>
	<table class="table_center default_thTable">
		<th>그룹 이름</th><th>만나는 요일</th><th>만나는 시간</th><th>도시</th><th>목적</th><th>카테고리</th><th>해시태그</th>
		<c:forEach items="${list }" var="gb">
			<tr><td>${gb.name }</td><td>${gb.week }</td><td>${gb.start_time }</td><td>${gb.city }</td>
			<td>${gb.goal }</td><td>${gb.category }</td><td>${gb.hashTag }</td></tr>
		</c:forEach>
	</table>
</div>
<c:import url="/member/bottom" />
</body>
</html>