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
		
		div .col {
			padding-top: 10px;
			padding-bottom: 10px;
		}
		
		div .freehead {
			padding-top: 50px;
		}
		
		div .col-xs-10 {
			border-radius: 10px;
			border: 2px solid silver;
			height: 300px;
			overflow: auto;
			margin-bottom: 10px;
		}
		
		div .col-btn {
			padding-top: 265px;
		}
		
		div .free {
			display: none;
			height: 310px;
			overflow: auto;
			overflow-x: hidden;
		}
		
		hr {
			display: block;
			margin-top: 0;
			margin-bottom: 0.5em;
			margin-left: auto;
			margin-right: auto;
			border-style: inset;
			border-width: 1px;
		}
		
		.affix {
			top: 0;
			width: 100%;
		}
		
		.main {
			width: 100%;
			height: 100%;
		}
		
		a {
			color: black;
		}
		
		a:hover {
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
		
		hr 
		{
			width: 100%;
		}
		
		div #freecontainer 
		{
			background-color: #fff;
			border-radius: 0.5em;
			width: 800px;
			margin-top: 30px;
			margin-bottom: 30px;
			font-family: myfont05;
			text-align: center;
		}
		
		div #freehead
		{
			padding-top: 20px;
		}
		
		nav
		{
			font-family: myfont05;
		}
	</style>
	<script type="text/javascript">
		function FreeDetail(num) {
				$.ajax({
					type : "POST", //전송타입
					url : "freedetail.htm", //서버 요청 주소생성
					data : "num=" + num,
					//dataType:"html" ,  //서버가 클라이언트에 응답 dataType
					success : function(data) { //response 서버가 전달한 데이터
						console.log(data.freeboarddto.content);
						console.log(data.id);
						//alert(num);
						if (data.id == data.freeboarddto.id) {
							$('#freedetail'+num).html(
									'<div class="col col-xs-10">'
									+ data.freeboarddto.content
									+ '</div>'
									+ '<div class="col-btn col-xs-2">'
									+ '<button type="button" class="btn btn-info btn-sm">'
									+ '<a href="freeupdate.htm?num='+num+'">수정</a>'
									+ '</button>  '
									+ '<button type="button" class="btn btn-danger btn-sm">'
									+ '<a href="freedelete.htm?num='+num+'">삭제</a>'
									+ '</button>'
									+ '</div>' + '<div>'
									+ '<hr>' + '</div>');
						} else if (data.id == "admin") {
							$('#freedetail' + num).html(
									'<div class="col col-xs-10">'
									+ data.freeboarddto.content
									+ '</div>'
									+ '<div class="col-btn col-xs-2">'
									+ '<button type="button" class="btn btn-danger btn-sm">'
									+ '<a href="freedelete.htm?num='+num+'">삭제</a>'
									+ '</button>'
									+ '</div>' + '<div>'
									+ '<hr>' + '</div>');
						} else {
							$('#freedetail' + num).html(
									'<div class="col col-xs-10">'
									+ data.freeboarddto.content
									+ '</div>' + '<div><hr></div>');
						}
						$('#freedetail' + num).slideToggle('slow');
					},

					error : function(status) {
						alert('ERROR');
					}
				});
		};
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