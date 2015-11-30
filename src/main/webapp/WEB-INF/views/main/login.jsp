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
		아이디 :<input type="text" name="id" ><br>
		비밀번호 :<input type="text" name="pwd" ><br>
		<a href="javascript:document.login.submit()">로그인</a>
		</form>
		<br>
		<form action="searchid.htm" method="post" name="searchid">
		이름 :<input type="text" name="name" ><br>
		이메일 :<input type="text" name="email" ><br>
		<a href="javascript:document.searchid.submit()">아이디 찾기</a>
		</form>
		<br>
		<form action="searchpwd.htm" method="post" name="searchpwd">
		아이디 :<input type="text" name="id" ><br>
		이메일 :<input type="text" name="email" ><br>
		<a href="javascript:document.searchpwd.submit()">비밀번호 찾기</a>
		</form>
</body>
</html>