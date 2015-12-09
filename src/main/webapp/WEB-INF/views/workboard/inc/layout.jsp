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
               $("#work-list").empty();
                
                print += "<div class=\"work-list-box swiper-container\" id=\"work-slide\">";
                print += "<div class=\"row work-list swiper-wrapper clear-wrap\">";
              
                $.each(data.worklist, function(index, obj){
                 // \역슬러시 사용해서 ""를 문자그대로 인식하도록 했다.
                 print += "<div class=\"col col-xs-4 work-card\">";
                 print += "<a href=\"workdetail.htm?num="+obj.num+"\">";
                 print += "<span class=\"work-thumb\">";
                 print += "<img class=\"img\" src=\""+$("#path").val()+"/images/"+obj.compensate+".jpg\">";
                 print += "<span class=\"work-name\">"+obj.addr+"</span></img></span>";
                 print += "<span class=\"work-content\">";
                 print += "<span class=\"profile-img\">";
                 print += "<img class=\"img-wrap\" src=\""+$("#path").val()+"/images/"+obj.sex+".JPG\" style=\"width: 52px; height: 52px;\">";
                 print += "<span class=\"profile-name\">"+obj.id+"</span></img></span>";
                 print += "<span class=\"text\">"+obj.title+"</span>";
                 print += "<span class=\"howmany\" style=\"text-align: center\">";
                 print += obj.startdate+" ~ "+obj.enddate;
                 print += "<br><b>신청 현황 : "+obj.regpeople+" / "+obj.needpeople+" 명</b></span></span>";
                 print += "<span class=\"work-info\"><span class=\"text\">"+obj.compensate+"</span></span><span class=\"over ani\"></span></a></div>";
                 
              }); // $.each(data.worklist, function(index, obj){            
              
              print += "</div>";
              print += "</div>";
              $("#work-list").append(print);
            }
            else //체크박스에서 선택한게 없을경우.
           {
               console.log("result = 2");
               $("#work-list").empty();                      
               $("#work-list").html("결과값이 없습니다.");
           }

           }// success : function(data)
        });//$.ajax({
   }//function checkAndSearchClick()

	// sendmessage() start
	function sendMessage() {
		var sender = $('#sender').val();
		var receiver = $('#receiver').val();
		var content = $('#messagecontent').val();
		var contextpath = $('#contextpath').val();
		$.ajax({
			type : "post",
			url : contextpath + "/sendmessage.htm",
			data : "sender=" + sender + "&receiver=" + receiver + "&content=" + content,
			success : function(data) { //callback
				if(data != null){
					alert("쪽지를 성공적으로 보냈습니다");
					$('#messagecontent').val("");
				}
				
			}// success : function(data)
		});//$.ajax({
	}//function sendMessage() end
	
	// getMemberInfo() start
	function getMemberInfo(id) {
		var contextpath = $('#contextpath').val();
		$.ajax({
			type : "post",
			url : contextpath + "/main/getmemberinfo.htm",
			data : "id=" + id,
			success : function(data) { //callback
				$("#member_id").text(data.memberdto.id);
				$("#member_name").text(data.memberdto.name);
				$("#member_sex").text(data.memberdto.sex);
				$("#member_birth").text(data.memberdto.birth);
				$("#member_email").text(data.memberdto.email);
				$("#member_panalty").text(data.memberdto.panalty);
			}// success : function(data)
		});//$.ajax({
	}//function getMemberInfo() end
	
	// Paging 처리
	function Paging(pg) {
        $.ajax({
           type : "GET",
           url : "ajaxworklist.htm",
           data : "pg=" + pg,
           success : function(data) {
              var print = "";
              $("#list").empty();
              var nextPage = data.toPage + 1;
              var previousPage = data.fromPage - 1;
              $.each(data.worklist, function(index, obj){
                 print += "<div>";
                 print += "<div class=\"workhead\">";
                 print += "<div class=\"col col-xs-2\">" + obj.num + "</div>";
                 print += "<div class=\"col col-xs-2\">" + obj.id + "</div>";
                 print += "<div class=\"col col-xs-6\" id=\"workhead" + obj.num + "\"";
                 print += "onclick=\"WorkDetail(" + obj.num + ")\">";
                 print += obj.title + "</div>";
                 print += "<div class=\"col col-xs-2\">" + obj.regdate + "</div>";
                 print += "<div><hr></div></div>";
                 print += "<div class=\"work\" id=\"workdetail" + obj.num + "\"></div>";
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
	
	/* div #workcontainer
	{
		background-color: #fff;
		border-radius: 0.5em;
		width: 700px;
		margin-top: 30px;
		margin-bottom: 30px;
		font-family: myfont05;
		text-align: center;
	} */
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