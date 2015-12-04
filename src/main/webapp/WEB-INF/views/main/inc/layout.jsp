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
	<title>무전무죄 프로젝트</title>
	<script type="text/javascript">
	
		
		$(document).ready(function() {
			$(".li1").click(function() {
				$("#login").fadeOut();
				$("#join").fadeOut();
				$("#howtouse").fadeOut();
				$("#start").delay(500).fadeIn();
			});
			$(".li2").click(function() {
				$("#start").fadeOut();
				$("#join").fadeOut();
				$("#howtouse").fadeOut();
				$("#login").delay(500).fadeIn();
			});
			$(".li3").click(function() {
				$("#start").fadeOut();
				$("#login").fadeOut();
				$("#howtouse").fadeOut();
				$("#join").delay(500).fadeIn();
			});
			$(".li4").click(function() {
				$("#start").fadeOut();
				$("#login").fadeOut();
				$("#join").fadeOut();
				$("#howtouse").delay(500).fadeIn();
			});

			//암호비교
			$('#confirmpwd').keyup(function() {
				var pwd = $('#pwd').val();
				if ($('#confirmpwd').val() != pwd) {
					$('#pwdcheck').text('');
					$('#pwdcheck').html("비밀번호 불일치");
				} else {
					$('#pwdcheck').text('');
					$('#pwdcheck').html("비밀번호 일치");
				}
			});

			$("#id").focusout(function() {
				var id = $('#id').val();
				console.log(id);
				$.ajax({
					type : "post",
					url : "idcheck.htm",
					data : "id=" + id,
					success : function(data) { //callback  
						console.log(data.data); // 아이디가 중복 되면 false 아니면 true
						if (!data.data) {
							alert("중복된 아이디 입니다. 다시 입력해주세요");
							$('#id').val("");
							$('#id').focus();
						}
					}
				});
			});

		});
	</script>
	<style type="text/css">
		body
		{
			padding:0px;
			margin:0px;
			width:100%;
			height:100%;
		}
		
		.navbar a
		{
			color: white;
		}
		
		.navbar a:hover
		{
			color: rgb(0, 153, 0);
			text-decoration: underline;
		}
		
		.navbar li:hover
		{
			background-color: none;
		}
		
		.main
		{
			/* background-image: url(images/main.jpg); */
			width: 100%;
			height: 100%;
		}
		
		.maincontent
		{
			height: 470px;
		}
		
		p
		{
			color: yellow;
			font-family: myfont02;
		}
		
		@font-face 
		{
		    font-family: myfont01;
		    src: url(font/365달콤한머핀.ttf);
		    
		    font-family: myfont02;
		    src: url(font/a대한늬우스M.ttf);
		}
	</style>
</head>
<body>
	<div class="main" style="background-image: url(<%=request.getContextPath()%>/images/main.jpg)">
		<div class="container">
			<!-- header 영역 -->
			<tiles:insertAttribute name="header" />
			
			<!-- main 영역 -->
			<div class="maincontent">
			<tiles:insertAttribute name="content" />
			</div>
			

			<a href="${pageContext.request.contextPath}/epilogue/epiloguelist.htm">여행후기로 가기</a>
			
			<a href="notice/noticelist.htm">공지사항 목록</a>
			<a href="submain.htm">SUBMAIN으로</a>

			<!-- footer 영역 -->
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>