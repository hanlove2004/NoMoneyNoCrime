<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
			  $('#phone3').keyup(function(){
				  var phone = $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val();
				  alert(phone);
				  $('#phone').val(phone);
			 });
	});
</script>
<title>Insert title here</title>
</head>
<body>
<form action="join.htm" method="post">
아이디 :<input type="text" name="id" ><br>
비밀번호 :<input type="text" name="pwd" ><br>
비밀번호 확인 :<input type="text" name="confirmpwd" ><br>
이름 :<input type="text" name="name" ><br>
전화번호 :<select name="phone1" id="phone1">
				<option>선택하세요</option>
				<option> 010 </option>
				<option>011</option>
				<option> 017 </option>
				<option> 018 </option>
			</select>
				 - 
			<input type="text" id="phone2" size="4">
				 - 
			<input type="text" id="phone3" size="4">
			<input type="hidden" name="phone" id="phone"><br>
성별 :<input type="radio" name="sex" value="남자" checked="checked">남자
        <input type="radio" name="sex" value="여자">여자
        	<br>
생년월일 :<input type="date" name="birth" style="height: 30px"><br>
이메일 :<input type="text" name="email" ><br>
<input type="submit" value="가입">
</form>
</body>
</html>