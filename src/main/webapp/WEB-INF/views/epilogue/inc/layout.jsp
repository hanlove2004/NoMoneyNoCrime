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

<!-- jQuery Form Plugin import -->
<script src="<%=request.getContextPath() %>/js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="<%=request.getContextPath() %>/js/jQuery.MultiFile.min.js"></script>

<!-- 폰트 적용 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
<!-- 파비콘 적용 -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />

<script>
$(document).ready(function(){
    
	var path = $('#path').val();
    
    //use jQuery MultiFile Plugin 
    $('#epilogueinsertform input[name=files]').MultiFile({
        max: 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
        accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
        maxfile: 1024, //각 파일 최대 업로드 크기
        maxsize: 3024,  //전체 파일 최대 업로드 크기
        STRING: { //Multi-lingual support : 메시지 수정 가능
            remove : "<img src='"+path+"/images/delete.png' height='16' width='16' alt='x'/>", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
            duplicate : "$files 은 이미 선택된 파일입니다.", 
            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
            selected:'$files 을 선택했습니다.', 
            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
            toobig: "$files 은 크기가 매우 큽니다. (max $size)"
        },
        list:"#afile3-list" //파일목록을 출력할 요소 지정가능
    });
});

function Paging(pg) {
	$.ajax({
		type : "GET",
		url : "ajaxepiloguelist.htm",
		data : "pg=" + pg,
		success : function(data) {
			var print = "";
			$("#epiloguelist").empty();
			var nextPage = data.toPage + 1;
			var previousPage = data.fromPage - 1;
         
			print += "<div style=\"margin: 0 auto; width: 700px; height: 550px;\">";
			print += "<div class=\"card-deck-wrapper\" style=\"margin: 0 auto;\">";
			print += "<div class=\"card-deck\">";
			$.each(data.epiloguelist, function(index, obj){
				print += "<div class=\"card\" style=\"float: left; margin: 30px; padding: 10px; background-color: silver;";
				print += "-moz-box-shadow: 30px 3px 5px 5px black;";
				print += "-webkit-box-shadow: 3px 3px 85px 5px black;";
				print += "box-shadow: 10px 10px 30px 5px black;";
				print += "border-top-right-radius: 1em;";
				print += "border-top-left-radius: 1em;";
				print += "border-bottom-right-radius: 1em;";
				print += "border-bottom-left-radius: 1em;\">";
				print += "<img class=\"card-img-top\" src=\"" + $("#path").val() + "/" + obj.photoname1 +"\"";
				print += "alt=" + obj.title + " height=\"100px\" width=\"150px\">";
				print += "<div class=\"card-block\">";
				print += "<h4 class=\"card-title\"><b>" + obj.title + "</b></h4>";
				print += "<p class=\"card-text\">";
				print += "<small class=\"text-muted\">" + obj.regdate + "</small>\&nbsp\&nbsp\&nbsp\&nbsp\&nbsp\&nbsp";
				print += "<small class=\"text-muted\">" + obj.id + "</small></p>";
				print += "<a href=\"#\" class=\"btn btn-primary\" id=\"epilogue" + data.num + "\" onclick=\"epiloguedetail(" + obj.num + ")\"";
				print += "data-target=\"#epilogueModal\" data-toggle=\"modal\" >상세보기</a>";
				print += "</div></div>";
			});
				print += "</div></div></div>";
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
           
			$("#epiloguelist").html(print);
		},
		error : function(status) {
			alert('ERROR');
		}
	});
};
 
</script>

<style type="text/css">
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
	}
	
	nav
	{
		font-family: myfont05;
	}
	
	.cardtext
	{
		white-space: nowrap;
	}
</style>

<title>여행후기 레이아웃</title>
</head>
<body style="font-family: myfont05;">

	<!-- header 영역 -->
	<tiles:insertAttribute name="header"/>
	
	<!-- main 영역 -->
	<tiles:insertAttribute name="content"/>
	
	<!-- footer 영역 -->
	<tiles:insertAttribute name="footer"/>
	
</body>
</html>