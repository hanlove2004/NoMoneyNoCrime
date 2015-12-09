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

         //회원가입 아이디 중복검사
         $("#id").focusout(function() {
            var id = $('#id').val();
            console.log(id);
            $.ajax({
               type : "post",
               url  : "idcheck.htm",
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
         
         //회원가입 유효성 검사
         var re_id = /^[a-z0-9_-]{4,16}$/; //아이디 검사식 (4~16글자)
         var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식 (6~18글자)
         var re_email = /^(\w+)(((\.?)(\w+))*)[@](((\w+)[.])+)(\w{2,3})$/;  // 이메일 검사식
         var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
         
         $('#check').click(function() {
                 
                 //일력한 값 변수 할당
                 var uid = document.joinform.id.value;
             var upw = document.joinform.pwd.value;
             var upw2 = document.joinform.confirmpwd.value;
             var name = document.joinform.name.value;
             var phone = document.joinform.phone.value;
             var birth = document.joinform.birth.value;
             var email = document.joinform.email.value;
             
             console.log(uid.value);
             console.log(upw.value);
             console.log(upw2.value);
             console.log(birth.value);
             console.log(name.value);
             console.log(birth.value);
             console.log(email.value);
             console.log(phone.value);
             
            var result= true;
            if (re_id.test(uid) != true) { // 아이디 검사
               alert('[아이디 입력 오류] 유효한 ID를 입력해 주세요.');
               id.focus();
               return false;
            } else if (re_pw.test(upw) != true) { // 비밀번호 검사
               alert('[비밀번호 입력 오류] 유효한 비밀번호 를 입력해 주세요.');
               pwd.focus();
               return false;
            } else if (re_pw.test(upw2) != true) { // 비밀번호 검사
               alert('[비밀번호 입력 오류] 유효한 비밀번호 를 입력해 주세요.');
               pwd2.focus();
               return false;
            } else if (name == "") { // 이름 검사
               alert('[이름 입력 오류] 이름 을 입력해 주세요.');
               name.focus();
               return false;
            } else if (re_tel.test(phone) != true) { // 전화번호 검사
               alert('[Tel 입력 오류] 유효한 전화번호를 입력해 주세요.');
               tel.focus();
               return false;
            } else if (birth.value == "") { // 생일 검사
               alert('[생년월일 입력 오류] 생년월일을 입력해 주세요.');
               birth.focus();
               return false;
            } else if (re_email.test(email) != true) { // 이메일 검사
               alert('[이메일 입력 오류] 유효한 이메일을 입력해 주세요.');
               email.focus();
               return false;
            }
         });
         
         //메인search 비동기
         //단어를 입력할때 마다 그내용을 포함하는 글 제목들이 뜨게 된다.
         $("#mainsearch").keyup(function() {
            var mainsearch = $("#mainsearch").val();
            console.log("mainsearch : " + mainsearch);
            
            $.ajax({
               type : "post",
               url  : "searchkeyword.htm",
               data : "keyword=" + mainsearch,
               success : function(data) { //callback
                  console.log("data.result       : " + data.result);
                  console.log("data.keywordlist    : " + data.keywordlist);
                  
                  var print = "";    
                  
                  //결과값이 없는경우
                  if(data.result == "0")
                  {
                     console.log("결과값이 없는 경우 : data.result == 0");
                     print += "<li style='width:287px; text-align:left'>결과값이 없습니다.</li>";
                  }
                  else //결과값이 있는경우
                  {
                     console.log("결과값이 있는 경우 : data.result == 1");
                     $.each(data.keywordlist , function(index,value){
                        //print += "<li style='width:287px; text-align:left' onclick=\"aa('sss')\">" + value + "</li>";
                        print += "<li style='width:287px; text-align:left' onclick=\"keywordclick('" + value + "')\">" + value + "</li>";
                      });
                  }
                  
                  //화면에 뿌리기.
                  $('#keywordlist').html(print).show();
                  
                  //search 마우스오버아웃 이벤트
                  $("#keywordlist").children("li").each(function() {
                       //마우스 오버시
                      $(this).mouseover(function() {
                           $(this).css ("background-Color", "#c0c0c0");
                       });
                      
                       //마우스 아웃시
                      $(this).mouseout(function () {
                           $(this).css("background-Color", "#FFF"); 
                       });
                       
                   });//$("#keywordlist").children("li").each(function() {
               }//success
            });//ajax
         });//$("#mainsearch").keyup(function()
               
         
         //메인search 검색버튼 비동기
         //검색버튼 누를시와 keywordlist를 비동기로 불러온후 그중 클릭시에도 호출된다.
         $("#searchbutton").click(function() {
            var mainsearch = $("#mainsearch").val();
            console.log("searchbutton click function() mainsearch 값 : " + mainsearch);
            
             $.ajax({
               type : "post",
               url  : "searchbuttonclick.htm",
               data : "keyword=" + mainsearch,
               success : function(data) { //callback
                  console.log("data.result       : " + data.result);
                  console.log("data.keywordlist    : " + data.keywordlist);
                  
                  var print = "";    
                  
                   //결과값이 없는경우
                  if(data.result == "0")
                  {
                     console.log("결과값이 없는 경우 : data.result == 0");
                     print += "<li style='width:287px; text-align:left'>결과값이 없습니다.</li>";
                  }
                  else //결과값이 있는경우
                  {
                     console.log("결과값이 있는 경우 : data.result == 1");
                     $.each(data.keywordlist , function(index,value){
                        //print += "<li style='width:287px; text-align:left' onclick=\"aa('sss')\">" + value + "</li>";
                        print += "<li style='width:287px; text-align:left' onclick=\"keywordclick('" + value + "')\">" + value + "</li>";
                      });
                  }
                  
                  //화면에 뿌리기.
                  $('#searchdiv').html(print).show(); 
                  
               }//success
            });//ajax 
         });//$("#mainsearch").keyup(function()
      });//$(document).ready(function()
      
      
      //list keyword 클릭 시 값전달
      function keywordclick(value){
         console.log("key value : " + value);
         $("#mainsearch").val(value);
         $("#keywordlist").empty();
      }
      
      
      
      // 여행후기 상세보기(modal)
      function epiloguedetail(num){         
         $.ajax({
            type: "post",
            url: "epiloguedetail.htm",
            cache: false,            
            data:'num=' + num,
             success:function(data){
                var arr = [];
                arr.push(data.epilogueboarddto.photoname1);
                arr.push(data.epilogueboarddto.photoname2);
                arr.push(data.epilogueboarddto.photoname3);
                
                $("#modal-num").val(data.epilogueboarddto.num);
                $("#modal-writer").val(data.epilogueboarddto.id);
                
                var LoingUser = $('#LoingUser').val();
                
                $('#modal-edit').empty();
                $('#modal-delete').empty();
                if(LoingUser == data.epilogueboarddto.id){
                   $('#modal-edit').append("<a href='epilogueupdate.htm?num=" + data.epilogueboarddto.num + "'>수정</a>");
                   $('#modal-delete').append("<a href='epiloguedelete.htm?num="+ data.epilogueboarddto.num +"'>삭제</a>");
                }
                
                $("#modal-image").empty();
                for(var i = 0 ; i < arr.length ; i++){
                   if(arr[i] != null){
                      $("#modal-image").append("<img style='width:300px;height:300px;' src=' " + $("#path").val()  + "/upload/" + arr[i] +" ' >");
                   }
                }
                
                 $("#modal-title").empty();
                 $("#modal-title").html(data.epilogueboarddto.title);
                 
                 $("#modal-body").empty();
                 $("#modal-body").html(data.epilogueboarddto.content);
              },
            error: function(){                  
               alert('Error while request..'   );
            }
         });
         
         //답글 
         $.ajax({
            type: "post",
            url: "epiloguereplydetail.htm",
            cache: false,            
            data:'num=' + num,
             success:function(data){
                $("#modal-reply").empty();
                $("#modal-reply").append("<div>댓      글</div>");
                 $.each(data.reply_epiloguelist,function(index,value){
                    if(value.id != data.userid){
                       $("#modal-reply").append("<div>"
                                                  + "<span id='reply_id"+ value.num +"'>" + value.id+"</span>:"
                                                  + "<span id='reply_content"+ value.num +"'>"+value.content + "</span>"
                                                  + "</div><br>");
                    }else{
                       $("#modal-reply").append("<div id=reply"+ value.num +" >" 
                                                  + "<span id='reply_id"+ value.num +"'>" + value.id+"</span>:"
                                                  + "<span id='reply_content"+ value.num +"'>"+value.content + "</span>"
                                                  + "|<span><a onclick='replyeditform("+ value.num +")'>수정</a></span>"
                                                  + "|<span><a onclick='replydelete("+ value.num +")'>삭제</a></span>"
                                                  + "</div><br>"
                                                  );
                    }
                      
                });
              },
            error: function(){                  
               alert('Error while request..'   );
            }
         });
         
         //모달호출
         $("#epilogueModal").modal();
      }
   </script>
   <style type="text/css">
      body
      {
         padding:0px;
         margin:0px;
         width:100%;
         height:100%;
      }
      
      li a
      {
         color: black;
      }
      
      li a:hover
      {
         color: black;
         text-decoration: underline;
      }
      
      .main
      {
         width: 100%;
         height: 100%;
         background-repeat: no-repeat;
      }
      
      .maincontent
      {
         height: 540px;
         padding-top: 65px;
      }
      
      p
      {
         color: #D9BBD7;
         font-family: myfont05;
      }
      
      .form-group
      {
         height: 23px;
      }
      
      label
      {
         font-family: myfont05;
      }
      
      h1,h2,h3,h4,h5
      {
         font-family: myfont05;
      }
      
      nav
      {
         font-family: myfont05;
      }
   </style>
</head>
<body style="font-family: myfont05;">
   <div class="main" style="background-image: url(<%=request.getContextPath()%>/images/moojun01.jpg);">
         <!-- header 영역 -->
         <tiles:insertAttribute name="header" />
         
         <!-- main 영역 -->
         <div class="maincontent">
         <tiles:insertAttribute name="content" />
         </div>
         
         <!-- searchdiv -->
         <tiles:insertAttribute name="searchdiv" />

         <!-- footer 영역 -->
         <tiles:insertAttribute name="footer" />
   </div>
</body>
</html>