<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#content{
margin-left: 20%; 
}

.manage_nav{
    list-style-type: none;
    margin-top: 5%;
    padding: 0;
    width: 15%;
    background-color: #f1f1f1;
    position: fixed;
    height: 25%;
    overflow: auto;
}

.manage_nav_li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

.manage_nav_li a.active {
    background-color: #588fde;
    color: white;
}

.manage_nav_li a:hover:not(.active) {
    background-color: #555;
    color: white;
}

.manage_nav_li{
	float: none;
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
var selector = '.manage_nav li a';
$(document).ready(function(){
	$(selector).on('click', function(){
		 $(this).addClass('active').siblings().removeClass('active');
	});
});
</script>
<body>
<ul class="manage_nav">
  <li class="manage_nav_li"><a href="<c:url value="/group/manageMember"/>">멤버 관리</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/group/manageBoard"/>">게시판 관리</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/group/manageFee"/>">벌금 관리</a></li>
  <li class="manage_nav_li"><a href="<c:url value="/group/manageGroup"/>">그룹 관리</a></li>
</ul>
</body>
</html>