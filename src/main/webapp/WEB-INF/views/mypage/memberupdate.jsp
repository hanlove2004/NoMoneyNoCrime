<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" id="memberinfo" style="margin-bottom: 20px;">
   <div class="well well-lg" align="center" style="margin: auto; width: 40%; background-color: #FFE7EC;">
      <form class="form-horizontal" name="memberupdate" action="memberupdate.htm" method="post">
            
            <div class="form-group">
               <label for="m_id" class="col-sm-4 control-label">아이디</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control input-sm" name="id" id="id" value="${memberdto.id}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="pwd" class="col-sm-4 control-label">비밀번호</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control input-sm" name="pwd" id="pwd" placeholder="기존 비밀번호">
               </div>
            </div>
            
            <div class="form-group">
               <label for="oldpwd" class="col-sm-4 control-label"></label>
               <div class="col-sm-8" id="oldpwd">기존 비밀번호를 입력하세요.</div>
            </div>
            
            <div class="form-group">
               <label for="newpwd" class="col-sm-4 control-label">새비밀번호</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control input-sm" name="newpwd" id="newpwd" placeholder="새비밀번호(6~18글자 입력)">
               </div>
            </div>
            
            <div class="form-group">
               <label for="confirmpwd" class="col-sm-4 control-label">비밀번호확인</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control input-sm" name="confirmpwd" id="confirmpwd" placeholder="비밀번호 확인">
               </div>
            </div>
            
            <div class="form-group">
               <label for="pwdcheck" class="col-sm-4 control-label"></label>
               <div class="col-sm-8" id="pwdcheck">필수정보 입니다.</div>
            </div>
            
            <div class="form-group">
               <label for="name" class="col-sm-4 control-label">이름</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control input-sm" name="name" id="name" value="${memberdto.name}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="phone" class="col-sm-4 control-label">전화번호</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control input-sm" name="phone" id="phone" value="${memberdto.phone}">
               </div>
            </div>
            
            <div class="form-group">
               <label for="sex" class="col-sm-4 control-label">성별</label>
               <div class="col-sm-5">
                  <input type="text" class="form-control input-sm" name="sex" id="sex" value="${memberdto.sex}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="birth" class="col-sm-4 control-label">생년월일</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control input-sm" name="birth" id="birth" value="${memberdto.birth}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="email" class="col-sm-4 control-label">이메일</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control input-sm" name="email" id="email" value="${memberdto.email}">
               </div>
            </div>
            
            <hr>
            
            <button type="submit" class="btn btn-success" name="update" id="update">수정</button>
            <a href="<%=request.getContextPath()%>/mypage/memberinfo.htm" class="btn btn-info">취소</a> 
         </form>
   </div>
</div>
<script>
	$(document).ready(function() {
		
		// 비밀번호 확인시 이벤트 처리
		function passwordcheck(newpwdcheck,newpwd){
			
			if (newpwdcheck != newpwd) {
	              $('#pwdcheck').text('');
	              $('#pwdcheck').html("비밀번호 불일치");
	              $('#pwdcheck').css("color", "red");
	           } else {
	              $('#pwdcheck').text('');
	              $('#pwdcheck').html("비밀번호 일치");
	              $('#pwdcheck').css("color", "blue");
	           }
	    }
		
		// newpwd / confirmpwd 에 입력시 비밀번호 체크
        $('#confirmpwd').keyup(function() {
        	var newpwd = $('#newpwd').val();
    		var newpwdcheck = $('#confirmpwd').val();
			passwordcheck(newpwdcheck,newpwd);
        });
		
        $('#newpwd').keyup(function() {
        	var newpwd = $('#newpwd').val();
    		var newpwdcheck = $('#confirmpwd').val();
            passwordcheck(newpwdcheck,newpwd);
        });
        
        //회원정보 수정 비밀번호 확인
        $("#pwd").keyup(function() {
           var pwd = $('#pwd').val();
           var id = $('#id').val(); 
           console.log("id : " + id);
           console.log("pwd : " + pwd);
           $.ajax({
              type : "post",
              url  : "pwdcheck.htm",
              data : "id=" + id + "&pwd=" + pwd ,
              success : function(data) { //callback  
                 console.log(data.data); // 비밀번호가 잘못되었으면 false, 맞으면 true
                 if (!data.data) {
                    $('#oldpwd').text('');
  	                $('#oldpwd').html("비밀번호가 맞지 않습니다.");
  	                $('#oldpwd').css("color", "red");
                 } else {
                	$('#oldpwd').text('');
   	                $('#oldpwd').html("입력한 비밀번호가 일치합니다.");
   	                $('#oldpwd').css("color", "blue");
                 }
              }
           });
        });
        
        // 유효성 검증
        var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식 (6~18글자)
        var re_email = /^(\w+)(((\.?)(\w+))*)[@](((\w+)[.])+)(\w{2,3})$/;  // 이메일 검사식
        var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
        
        $('#update').click(function() {
            
            //일력한 값 변수 할당
			var newpwd = $("#newpwd").val();
			var confirmpwd = $("#confirmpwd").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
             
			console.log("newpwd   : " + newpwd); 
			console.log("confirmpwd  : " + confirmpwd); 
			console.log("phone : " + phone); 
			console.log("email : " + email)
             
            if (re_pw.test(newpwd) != true) { // 비밀번호 검사
               alert('[비밀번호 입력 오류] 유효한 비밀번호 를 입력해 주세요.');
               $("#newpwd").focus();
               return false;
            } else if (re_pw.test(confirmpwd) != true) { // 비밀번호 검사
               alert('[비밀번호 입력 오류] 유효한 비밀번호 를 입력해 주세요.');
               $("#confirmpwd").focus();
               return false;
            } else if (re_tel.test(phone) != true) { // 전화번호 검사
               alert('[Tel 입력 오류] 유효한 전화번호를 입력해 주세요.');
               $("#phone").focus();
               return false;
            } else if (re_email.test(email) != true) { // 이메일 검사
               alert('[이메일 입력 오류] 유효한 이메일을 입력해 주세요.');
               $("#email").focus();
               return false;
            }
         });
	
	});
</script>