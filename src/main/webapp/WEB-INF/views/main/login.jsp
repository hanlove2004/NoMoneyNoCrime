<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<form action="login.htm" method="post" name="login">
		���̵� :<input type="text" name="id" ><br>
		��й�ȣ :<input type="text" name="pwd" ><br>
		<a href="javascript:document.login.submit()">�α���</a>
		</form>
		<br>
		<form action="searchid.htm" method="post" name="searchid">
		�̸� :<input type="text" name="name" ><br>
		�̸��� :<input type="text" name="email" ><br>
		<a href="javascript:document.searchid.submit()">���̵� ã��</a>
		</form>
		<br>
		<form action="searchpwd.htm" method="post" name="searchpwd">
		���̵� :<input type="text" name="id" ><br>
		�̸��� :<input type="text" name="email" ><br>
		<a href="javascript:document.searchpwd.submit()">��й�ȣ ã��</a>
		</form>
</body>
</html>