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

<!-- 카드 디자인 css 적용 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/workboard.css">
<title>무전무죄 프로젝트</title>

<script type="text/javascript">
   $(document).ready(function() {
         //search 버튼 클릭시
         $('#search').click(function() {
            checkAndSearchClick();
         });
   
         //체크박스 체크시 이벤트
         $('input[name=column]').click(function() {
            checkAndSearchClick();
         });
         
         // id 옆에 dropdown 메뉴 이벤트
         $(".dropdown").on("hide.bs.dropdown", function(){
       		$("#writerdropdown").html('<span class="caret"></span>');
         });
         $(".dropdown").on("show.bs.dropdown", function(){
        	$("#writerdropdown").html('<span class="caret caret-up"></span>');
         });
         
   });//$(document).ready(function()
      
    //체크박스 와 검색버튼 클릭시 공통된 함수
   function checkAndSearchClick(){
        //각각의 체크박스 체크유무 가져오기
        var sukso     = $("input:checkbox[id='sukso']").is(":checked");
        var siksa     = $("input:checkbox[id='siksa']").is(":checked");
        var don       = $("input:checkbox[id='don']"  ).is(":checked");
        var searchvalue = $('#searchvalue').val();

        console.log("searchvalue : " + searchvalue);
        console.log("sukso : " + sukso + " / " + "siksa : " + siksa + " / " + "don : " + don);

        $.ajax({
           type : "post",
           url  : "worklistchecksearch.htm",
           data : "sukso=" + sukso + "&don=" + don + "&siksa=" + siksa + "&searchvalue=" + searchvalue,
           success : function(data) { //callback
              console.log("data.result : " + data.result + " / " + "data.worklist : " + data.worklist);

              var print = "";

              //결과값이 있는경우
               if(data.result == "1")
               {
                  console.log("result = 1");
                  $("#body").empty();

                   print += "<tr style=\"height: 30px;\" class=\"success\">";
                   print += "<td>글번호</td>";
                   print += "<td>작성자</td>"
                   print += "<td>제목</td>"
                   print += "<td>보상</td>";
                   print += "<td>인원</td>";
                   print += "</tr>";

                   $.each(data.worklist, function(index, obj){
                      // \역슬러시 사용해서 ""를 문자그대로 인식하도록 했다.
                      print += "<tr style=\"height: 30px;\">"
                      print += "<td>" + obj.num + "</td>";
                      print += "<td>" + obj.id + "</td>";
                      print += "<td>" + "<a href=\"workdetail.htm?num=" + obj.num + "\">" + obj.title + "</a></td>";
                      print += "<td>" + obj.compensate + "</td>";
                      print += "<td>" + obj.needpeople + "</td>";
                      print += "</tr>";
                 });

                 $("#body").append(print);
               }
               else //체크박스에서 선택한게 없을경우.
              {
                  console.log("result = 2");
                  $("#body").empty();
                  $("#body").html("결과값이 없습니다.");
              }
           }// success : function(data)
        });//$.ajax({
   }//function checkAndSearchClick()
   
   
   
</script>
<style type="text/css">
	a 
	{
		color: white;
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
</style>

<!-- dropdown style -->
<style>
  /* Style to reverse the caret icon from pointing downwards to upwards */
  .caret.caret-up {
    border-top-width: 0;
    border-bottom: 4px solid #fff;
  }
  
  .dropdown-menu {
  	min-width: 100px;
  }
  </style>
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