<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- 폰트 적용 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
	<!-- 파비콘 적용 -->
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />
	<title>무전무죄 프로젝트</title>
	<style type="text/css">
		.main
		{
			width: 100%;
			height: 100%;
		}
		
		a
		{
			color: black;
		}
		
		a:hover
		{
			color: black;
			text-decoration: underline;
		}
		
		p
		{
			color: #A8D5F6;
			font-family: myfont05;
		}
		
		h3
		{
			font-family: myfont05;
		}
		
		nav
		{
			font-family: myfont05;
		}
		
		div #admincontainer 
		{
			background-color: #fff;
			border-radius: 0.5em;
			width: 800px;
			margin-top: 30px;
			margin-bottom: 30px;
			font-family: myfont05;
			text-align: center;
		}
		
		label
		{
			margin-bottom: 0px;
			margin-top: 7px;
		}
	</style>
	<script type="text/javascript">
		function deleteMember(num) {
			//confirm : 예/아니오 버튼의 선택에 따라 true/false 반환
			if (confirm(num + "번 회원님을 강퇴 하시겠습니까?")) {
				//location.href=path -> 지정된 경로로 이동
				location.href='memberdelete.htm?num=' + num;
			}
		}
	</script>
</head>
<body style="font-family: myfont05;">
	<div class="main" style="background-image: url(<%=request.getContextPath()%>/images/notice.jpg)">
	
		<!-- header 영역 -->
		<tiles:insertAttribute name="header"/>
		
		<!-- main 영역 -->
		<tiles:insertAttribute name="content"/>
		
		<!-- footer 영역 -->
		<tiles:insertAttribute name="footer"/>
	
	</div>
</body>
</html>