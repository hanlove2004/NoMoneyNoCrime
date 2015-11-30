<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin: auto; padding: 20px; vertical-align: middle; height: 100%; width: 100%;">
		<div style="text-align: center; color: white;">
			<h2>회원가입</h2>
		</div>
		<div class="well well-lg" align="center" style="margin: auto; height: 85%; width: 50%;">
		<!-- <button id="checkId">중복확인</button>
		<input type="button" onclick="location.href='member.do?cmd=memberidcheck&m_id=admin@kosta.com'">확인 -->
		<div style="width: 400px;">
		<form class="form-horizontal" name="joinform" action="member.do?cmd=memberjoinok" method="post" onsubmit="return CheckForm();">
			<div class="form-group">
				<label for="m_id" class="col-sm-4 control-label">아이디</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_id" id="m_id" value="${ m_id }" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="m_pwd1" class="col-sm-4 control-label">비밀번호</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="m_pwd1" id="m_pwd1" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="m_pwd2" class="col-sm-4 control-label">비밀번호확인</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="m_pwd2" id="m_pwd2" placeholder="Password Check">
				</div>
			</div>
			<div class="form-group">
				<label for="m_nick" class="col-sm-4 control-label">닉네임</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_nick" id="m_nick" placeholder="Nickname">
				</div>
			</div>
			<div class="form-group">
				<label for="m_name" class="col-sm-4 control-label">이름</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_name" id="m_name" placeholder="Name">
				</div>
			</div>
			<div class="form-group">
				<label for="m_gender" class="col-sm-4 control-label">성별</label>
					<div class="col-sm-5">
						<label class="radio-inline">
							<input type="radio" name="m_gender" id="m_gender" value="남" checked>남
						</label>
						<label class="radio-inline">
							<input type="radio" name="m_gender" id="m_gender" value="여">여
						</label>
					</div>
			</div>
			<div class="form-group">
				<label for="m_birth" class="col-sm-4 control-label">생년월일</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_birth" id="m_birth" placeholder="(예시) 900101">
				</div>
			</div>
			<div class="form-group">
				<label for="m_phone" class="col-sm-4 control-label">전화번호</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="(예시) 01012345678">
				</div>
			</div>
			<hr>
			<input type="submit" value="JOIN" class="btn btn-success">
			<input type="button" onclick="location.href='javascript:joinform.reset()'" value="RESET" class="btn btn-info">
			<input type="button" onclick="location.href='login.jsp'" value="CANCEL" class="btn btn-danger">
		</form>
		</div>
		</div>
	</div>
</body>
</html>