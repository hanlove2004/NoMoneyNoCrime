<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<!-- 폰트 적용 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
	<title>무전무죄 프로젝트</title>
	<script type="text/javascript">
		function NoticeDetail(num){
	        $.ajax(
	           {
	              type:"POST", //전송타입
	              url:"noticedetail.htm"  , //서버 요청 주소생성
	              data:"num="+num,   //jsp?user_id=aaa&user_pw=1004&is_Ajax=1
	               //dataType:"html" ,  //서버가 클라이언트에 응답 dataType
	               success:function(data){ //response 서버가 전달한 데이터
	                        console.log(data.noticeboarddto.content);
	                    //alert(num);
	                    
	                   $('#noticedetail'+num).html(
	                       '<div class="col col-xs-10">'+data.noticeboarddto.content+'</div>'
	                       +'<div class="col-btn col-xs-2">'
	                       +'<button type="button" class="btn btn-info">'
	                       +'<a href="#">수정</a>'
	                       +'</button>  '
	                       +'<button type="button" class="btn btn-danger">'
	                       +'<a type="submit">삭제</a>'
	                       +'</button>'
	                       +'</div>'
	                       +'<div>'
	                       +'<hr>'
	                       +'</div>'
	                    ); 
	                   $('#noticedetail'+num).slideToggle('slow');
	                   } ,
	                                         
	               error:function(status){alert('ERROR');}  
	           }
	           );
	     };
	</script>
	<style type="text/css">
	
		div .col {
			padding-top: 10px;
			padding-bottom: 10px;
		}
		
		div .noticehead {
			padding-top: 50px;
		}
		
		div .col-xs-10 {
			border-radius: 10px;
			border: 2px solid silver;
			height: 300px;
			overflow: auto;
		}
		
		div .col-btn {
			padding-top: 265px;
		}
		
		div .notice {
			display: none;
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
		
		.main
		{
			width: 100%;
			height: 100%;
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
		
		hr
		{
			width: 100%;
		}
		
		div #noticecontainer
		{
			background-color: #fff;
			border-radius: 0.5em;
		}
	</style>
	
</head>
<body>
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