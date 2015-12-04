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
	<title>무전무죄 프로젝트</title>
	<style type="text/css">
		.main
		{
			width: 100%;
			height: 100%;
		}
		
		@font-face 
		{
		    font-family: myfont01;
		    src: url(font/365dal.ttf);
		    
		    font-family: myfont02;
		    src: url(font/koreanews.ttf);
		    
		    font-family: myfont03;
		    src : url(font/BMDOHYEON_ttf.ttf)
		}
		
		a
		{
			color: white;
		}
		
		a:hover
		{
			color: rgb(0, 153, 0);
			text-decoration: underline;
		}
		
		.maincontent
		{
			height: 470px;
		}
		
		p
		{
			color: #A8D5F6;
			font-family: myfont03;
		}
		
		h3
		{
			font-family: myfont01;
		}
	</style>
</head>
<body style="height: 100%; width: 100%">
	
		<!-- header 영역 -->
		<tiles:insertAttribute name="header"/>
		
		<!-- main 영역 -->
		<tiles:insertAttribute name="content"/>
		
		<!-- footer 영역 -->
		<tiles:insertAttribute name="footer"/>
	
</body>
</html>