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
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<title>무전무죄 프로젝트</title>
	<script type="text/javascript">
		$(function(){
			
			$('#login').empty();
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
			background-image: url(images/main.jpg);
			width: 100%;
			height: 100%;
		}
		
		.maincontent
		{
			height: 470px;
			
		}
	</style>
</head>
<body cellpadding=0 cellspacing=0 marginleft=0 margintop=0 width="100%" height="100%">
	<div class="main">
		<!-- header 영역 -->
		<tiles:insertAttribute name="header" />
		
		<!-- main 영역 -->
		<div class="maincontent">
		<tiles:insertAttribute name="content" />
			<div id="login" class="container collapse" align="center">
				<div style="text-align: center; vertical-align: middle; margin: auto; width: 400px; border-color: white; border-style: ;">
					<h1>로그인</h1>
					<form method="post" class="form-horizontal">
						<div class="form-group form-inline">
							<label for="id" class="col-sm-3 control-label">아이디:</label>
							<div class="col-sm-8">
								<input type="email" class="form-control" id="id"
									placeholder="Enter email">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="pwd" class="col-sm-3 control-label">비밀번호:</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="pwd"
									placeholder="Enter password">
							</div>
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</div>
		
		<!-- footer 영역 -->
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>