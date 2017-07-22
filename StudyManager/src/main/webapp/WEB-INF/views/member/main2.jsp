<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Study Manager</title>
  <meta charset="utf-8">
</head>
<style>
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
  }
  p {font-size: 16px;}
  .margin {margin-bottom: 45px;}
  .bg-1 { 
      background-color: #1abc9c; /* Green */
      color: #ffffff;
      float: left;
  }
  .bg-2 { 
      background-color: #474e5d; /* Dark Blue */
      color: #ffffff;
      float: right;
  }
  .bg-3 { 
      background-color: #ffffff; /* White */
      color: #555555;
  }
  .bg-4 { 
      background-color: #2f2f2f; /* Black Gray */
      color: #fff;
  }
  .container-fluid {
      padding-top: 70px;
      padding-bottom: 70px;
  }
  .container-fluid_first {
      padding-top: 70px;
      padding-bottom: 70px;
      width: 50%;
      height: 350px;
  }
</style>
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
	</select>
	요일: 
		<input type="checkbox" name="week" value="mon">월
		<input type="checkbox" name="week" value="tue">화
		<input type="checkbox" name="week" value="wed">수
		<input type="checkbox" name="week" value="thu">목
		<input type="checkbox" name="week" value="fri">금
		<input type="checkbox" name="week" value="sat">토
		<input type="checkbox" name="week" value="sun">일
		<br>
	목적: 
		<select name="goal" style="color:black">
			<option value="">선택하세요</option>
			<option value="job">취업</option>	
			<option value="hobby">취미</option>	
			<option value="exam">시험</option>	
			<option value="study">학습</option>	
			<option value="etc">기타</option>	
		</select>	
		카테고리:
		<select name="category" style="color:black">
			<option value="">선택하세요</option>	
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
  	<c:forEach items="${group_map }" var="key" >
	    <div class="col-sm-4">
	    	<h3>
	    		<a href="<c:url value="/group/main?group_num=${key.value.num }"/>">${key.value.name }</a>
	    		<c:if test="${key.value.admin eq id }"> >>관리자</c:if>
	    	</h3>
	      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
	       <a href="#" class="btn btn-default btn-lg">
				Go <span class="glyphicon glyphicon-hand-right"></span>
	       </a>
	    </div>
    </c:forEach>
  </div>
</div>

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>Bootstrap Theme Made By <a href="https://www.w3schools.com">www.w3schools.com</a></p> 
</footer>

</body>
</html>