<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/graph/jquery.jqplot.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/graph/plugins/jqplot.pieRenderer.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/graph/jquery.jqplot.css"/>" />
<title>Insert title here</title>
</head>
<body>
<c:import url="/member/header" />
<c:import url="/group/header" />
<div class="container" >
	<div class="title"><h1>내 정보</h1></div>
	<div id="info">
	<div class="title"><h3>지각비 내역</h3></div>
	<table class="table_center default_thTable">
		<th>날짜</th><th>출석상태</th><th>출석시간</th><th>늦은 시간</th><th>지각비</th><th>결석비</th><th>벌금</th>
		<c:forEach items="${ab_list }" var="ab">
			<tr><td>${ab.date }</td><td>${ab.status }</td><td><c:choose><c:when test="${ab.late_interval eq -1 }">결석</c:when><c:otherwise>${ab.attend_time }</c:otherwise></c:choose></td><td><c:choose><c:when test="${ab.late_interval eq -1 }">결석</c:when><c:otherwise>${ab.late_interval }</c:otherwise></c:choose> </td>
			<td>${ab.late_fee }</td><td>${ab.absent_fee }</td><td>${ab.fee }</td></tr>
		</c:forEach>
	</table>
	<div style="text-align: right; margin-right: 120px;"><h4>총 지불 금액: ${all_fee }</h4></div>
	
	<div class="title"><h3>팀원들이 낸 지각비 내역</h3></div>
	<table class="table_center default_thTable">
		<th>아이디</th><th>지불금액</th>
		<c:forEach items="${fee_map }" var="map">
			<tr><td>${map.key }</td><td>${map.value }</td>
		</c:forEach>
	</table>
	<div style="text-align: right; margin-right: 120px;"><h4>총 지불 금액: ${all_fee_group }</h4></div>
	</div>
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
<c:import url="/member/bottom" />
</body>
</html>