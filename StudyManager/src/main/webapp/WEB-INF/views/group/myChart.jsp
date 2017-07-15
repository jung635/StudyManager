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
<c:import url="/group/header" />
<div id="chart"></div>
    <script>
    $(document).ready(function(){ 
        var s1 = [['Sony',7], ['Samsumg',13.3], ['LG',14.7], ['Vizio',5.2], ['Insignia', 1.2]];
             
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
</body>
</html>