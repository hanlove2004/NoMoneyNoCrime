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
���̵� :<input type="text" name="id" ><br>
��й�ȣ :<input type="text" name="pwd" ><br>
��й�ȣ Ȯ�� :<input type="text" name="confirmpwd" ><br>
�̸� :<input type="text" name="name" ><br>
��ȭ��ȣ :<select name="phone1" id="phone1">
				<option>�����ϼ���</option>
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
���� :<input type="radio" name="sex" value="����" checked="checked">����
        <input type="radio" name="sex" value="����">����
        	<br>
������� :<input type="date" name="birth" style="height: 30px"><br>
�̸��� :<input type="text" name="email" ><br>
<input type="submit" value="����">
</form>
</body>
</html>