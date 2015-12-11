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
		
		function Paging(pg) {
			$.ajax({
				type : "GET",
				url : "ajaxmemberlist.htm",
				data : "pg=" + pg,
				success : function(data) {
					var print = "";
					$("#memberlist").empty();
					var nextPage = data.toPage + 1;
					var previousPage = data.fromPage - 1;
					print += "<table class=\"table table-hover\" style=\"text-align: center;\">";
					print += "<tr style=\"font-size: 15px;\" class=\"success\">";
					print += "<td>회원번호</td>";
					print += "<td>아이디</td>";
					print += "<td>이름</td>";
					print += "<td>생년월일</td>";
					print += "<td>전화번호</td>";
					print += "<td>상세보기</td></tr>";
					$.each(data.memberlist, function(index, obj){
						print += "<tr style=\"font-size: 15px;\">";
						print += "<td>" + obj.num + "</td>";
						print += "<td>" + obj.id + "</td>";
						print += "<td>" + obj.name + "</td>";
						print += "<td>" + obj.birth + "</td>";
						print += "<td>" + obj.phone + "</td>";
						print += "<td><button type=\"button\" class=\"btn btn-warning btn-sm\" onclick=\"memberdetail(" + obj.num + ")\"";
						print += "data-toggle=\"modal\" data-target=\"#memberModal\">상세보기</button></td></tr>";
					});
					print += "</table>";
					print += "<div style=\"margin: 0 auto; width: 300px;\">";
					print += "<nav style=\"text-align: center;\">";
					print += "<ul class=\"pagination pagination-sm\">";
					if(data.pg>data.block){
						print += "<li><a onclick=\"Paging(1)\">처음</a></li>";
						print += "<li><a onclick=\"Paging("+ previousPage +")\" aria-label=\"Previous\">";
						print += "<span aria-hidden=\"true\">\&laquo;</span></a></li>";
						}
					for(var i = data.fromPage; i <= data.toPage; i++){
						if(i==data.pg){
							print += "<li class=\"active\"><a>" + i + "</a></li>";
						}
						if(i!=data.pg){
							print += "<li><a onclick=\"Paging(" + i + ")\">" + i + "</a></li>";
						}
					}
					if(data.toPage < data.allPage){
						print += "<li><a onclick=\"Paging(" + nextPage + ")\" aria-label=\"Next\">";
						print += "<span aria-hidden=\"true\">\&raquo;</span></a></li>";
						print += "<li><a onclick=\"Paging(" + data.allPage + ")\">마지막</a></li></ul></nav></div>";
					}
					$("#memberlist").html(print);
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