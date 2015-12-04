<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<!-- bootstrap vertical-tabs -->
	<link href="<%=request.getContextPath()%>/css/bootstrap.vertical-tabs.min.css" rel="stylesheet">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- 폰트 적용 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
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
	
	<div style="text-align: center">
		<button type="submit" class="btn btn-info">
			<a href="memberinfo.htm">회원정보</a>
		</button>&nbsp;&nbsp;&nbsp;
		<button type="submit" class="btn btn-info">
			<a href="workaddlist.htm">일자리현황</a>
		</button>&nbsp;&nbsp;&nbsp;
		<button type="submit" class="btn btn-info">
			<a href="myepiloguelist.htm">나의여행후기</a>
		</button>&nbsp;&nbsp;&nbsp;
		<button type="submit" class="btn btn-info">
			<a href="messagelist.htm">쪽지함</a>
		</button>
	</div>
	<!-- main 영역 -->
	<tiles:insertAttribute name="content"/>
	
	<!-- footer 영역 -->
	<tiles:insertAttribute name="footer"/>
	
</body>
</html>