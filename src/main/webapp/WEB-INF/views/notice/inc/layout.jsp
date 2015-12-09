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
	<!-- 파비콘 적용 -->
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />
	<title>무전무죄 프로젝트</title>
	<script type="text/javascript">
	      function NoticeDetail(num){
	           $.ajax(
	              {
	                 type:"POST", //전송타입
	                 url:"noticedetail.htm"  , //서버 요청 주소생성
	                 data:"num="+num,       //noticedetail.htm?num=num
	                  success:function(data){ //response 서버가 전달한 데이터
	                      console.log(data.noticeboarddto.content);
	                      console.log(data.id);
	                       //alert(num);
	                  if(data.id == "admin"){
	                     $('#noticedetail'+num).html(
	                    		 '<div class="col col-xs-10">'+data.noticeboarddto.content+'</div>'
			                       +'<div class="col-btn col-xs-2">'
			                       +'<button type="button" class="btn btn-info btn-sm">'
			                       +'<a href="noticeupdate.htm?num='+num+'">수정</a>'
			                       +'</button>&nbsp;&nbsp;'
			                       +'<button type="button" class="btn btn-danger btn-sm">'
			                       +'<a href="noticedelete.htm?num='+num+'">삭제</a>'
			                       +'</button>'
			                       +'</div>'
			                       +'<div>'
			                       +'<hr>'
			                       +'</div>'
	                          ); 
	                  } else {
	                     $('#noticedetail'+num).html(
	                        '<div class="col col-xs-10">'+data.noticeboarddto.content+'</div>'
	                        +'<div><hr></div>'
	                     );
	                  }
	                  
                      $('#noticedetail'+num).slideToggle('slow');
                      } ,
	                                            
	                  error:function(status){alert('ERROR');}  
	              }
	              );
	        };
	        
	        function Paging(pg) {
	            $.ajax({
	               type : "GET",
	               url : "ajaxnoticelist.htm",
	               data : "pg=" + pg,
	               success : function(data) {
	                  var print = "";
	                  $("#list").empty();
	                  var nextPage = data.toPage + 1;
	                  var previousPage = data.fromPage - 1;
	                  $.each(data.noticelist, function(index, obj){
	                     print += "<div>";
	                     print += "<div class=\"noticehead\">";
	                     print += "<div class=\"col col-xs-2\">" + obj.num + "</div>";
	                     print += "<div class=\"col col-xs-2\">" + obj.id + "</div>";
	                     print += "<div class=\"col col-xs-6\" id=\"noticehead" + obj.num + "\"";
	                     print += "onclick=\"NoticeDetail(" + obj.num + ")\">";
	                     print += obj.title + "</div>";
	                     print += "<div class=\"col col-xs-2\">" + obj.regdate + "</div>";
	                     print += "<div><hr></div></div>";
	                     print += "<div class=\"notice\" id=\"noticedetail" + obj.num + "\"></div>";
	                  });
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
	                  $("#list").html(print);
	               },
	               error : function(status) {
	                  alert('ERROR');
	               }
	            });
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
			margin-bottom: 10px;
		}
		
		div .col-btn {
			padding-top: 265px;
		}
		
		div .notice {
			display: none;
			height: 310px;
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
		
		hr
		{
			width: 100%;
		}
		
		div #noticecontainer
		{
			background-color: #fff;
			border-radius: 0.5em;
			width: 800px;
			margin-top: 30px;
			margin-bottom: 30px;
			font-family: myfont05;
			text-align: center;
		}
		
		div #noticehead
		{
			padding-top: 20px;
		}
		
		nav
		{
			font-family: myfont05;
		}
	</style>
	
</head>
<body style="font-family: myfont05;">
	<div class="main">

		<!-- header 영역 -->
		<tiles:insertAttribute name="header"/>
		
		<!-- main 영역 -->
		<tiles:insertAttribute name="content"/>
		
		<!-- footer 영역 -->
		<tiles:insertAttribute name="footer"/>
	
	</div>
</body>
</html>