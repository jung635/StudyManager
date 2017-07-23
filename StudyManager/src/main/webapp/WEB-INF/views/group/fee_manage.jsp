<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/graph/jquery.jqplot.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/graph/plugins/jqplot.pieRenderer.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/graph/jquery.jqplot.css"/>" />
</head>
<body>
<c:import url="/member/header" />
<c:import url="/group/header" />
<div class="container">
<c:import url="/group/manage_nav" />
	<div id="right_nav_content">
		<div class="title"><h1>벌금 관리</h1></div>
		<div class="title"><h3>팀원 벌금 내역</h3></div>
		<table class="table_center default_thTable">
			<th>아이디</th><th>지불금액</th><th>이유</th><th>날짜</th><th>지불상태</th><th>상태변경</th>
			<c:forEach items="${attend_map }" var="map">
				<tr><td>${map.value.id }</td><td>${map.value.absent_fee + map.value.fee + map.value.late_fee }</td>
					<td>
						<c:if test="${map.value.status eq 'late' }">지각</c:if>
						<c:if test="${map.value.status eq 'absent' }">결석</c:if>
						<c:if test="${map.value.status eq 'fee' }">벌금</c:if>
					</td>
					<td>${map.value.date }</td>
					<td><c:if test="${map.value.payed eq false}">미지불</c:if><c:if test="${map.value.payed eq true}">지불 완료</c:if></td>
					<td><input type="button" value="수정" onclick="location.href='<c:url value="/group/attendUpdate?attend_num=${map.value.num }"/>'">
						<input type="button" value="삭제" onclick="location.href='<c:url value="/group/attendDel?attend_num=${map.value.num }"/>'">
						<input type="button" value="지불완료" onclick="location.href='<c:url value="/group/payDone?attend_num=${map.value.num }"/>'"></td>
			</c:forEach>
		</table>
		<div style="text-align: right; margin-right: 120px;"><h4>총 금액: ${all_fee_group }</h4></div>
		<div style="text-align: right; margin-right: 120px;"><h4>총 지불 금액: ${all_fee_group_payed }</h4></div>
		<div class="title"><h3>팀원 별 총 지각비 내역</h3></div>
		<table class="table_center default_thTable">
			<th>아이디</th><th>지불금액</th>
			<c:forEach items="${fee_map }" var="map">
				<tr><td>${map.key }</td><td>${map.value }</td>
			</c:forEach>
		</table>
		<div style="text-align: right; margin-right: 120px;"><h4>총 지불 금액: ${all_fee_group }</h4></div>
		<div id="chart"></div>
	    <script>
	    $(document).ready(function(){ 
	        //var s1 = [['Sony',10000], ['Samsumg',20000], ['LG',2000], ['Vizio',1000], ['Insignia', 500]];
	        var s1 = ${data };
	        var plot8 = $.jqplot('chart', [s1], {
	            grid: {
	                drawBorder: false, 
	                drawGridlines: false,
	                background: '#ffffff',
	                shadow:false
	            },
	            axesDefaults: {
	                 
	            },
	            seriesDefaults:{
	                renderer:$.jqplot.PieRenderer,
	                rendererOptions: {
	                    showDataLabels: true
	                }
	            },
	            legend: {
	                show: true,
	                rendererOptions: {
	                    numberRows: 1
	                },
	                location: 's'
	            }
	        }); 
	    });
	    </script>
	</div>
</div>
</body>
</html>