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
<<<<<<< HEAD
	<div class="container" style="margin: auto; padding: 20px; vertical-align: middle; height: 100%; width: 100%;">
		<div style="text-align: center; color: white;">
			<h2>ȸ������</h2>
		</div>
		<div class="well well-lg" align="center" style="margin: auto; height: 85%; width: 50%;">
		<!-- <button id="checkId">�ߺ�Ȯ��</button>
		<input type="button" onclick="location.href='member.do?cmd=memberidcheck&m_id=admin@kosta.com'">Ȯ�� -->
		<div style="width: 400px;">
		<form class="form-horizontal" name="joinform" action="member.do?cmd=memberjoinok" method="post" onsubmit="return CheckForm();">
			<div class="form-group">
				<label for="m_id" class="col-sm-4 control-label">���̵�</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_id" id="m_id" value="${ m_id }" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="m_pwd1" class="col-sm-4 control-label">��й�ȣ</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="m_pwd1" id="m_pwd1" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="m_pwd2" class="col-sm-4 control-label">��й�ȣȮ��</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="m_pwd2" id="m_pwd2" placeholder="Password Check">
				</div>
			</div>
			<div class="form-group">
				<label for="m_nick" class="col-sm-4 control-label">�г���</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_nick" id="m_nick" placeholder="Nickname">
				</div>
			</div>
			<div class="form-group">
				<label for="m_name" class="col-sm-4 control-label">�̸�</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_name" id="m_name" placeholder="Name">
				</div>
			</div>
			<div class="form-group">
				<label for="m_gender" class="col-sm-4 control-label">����</label>
					<div class="col-sm-5">
						<label class="radio-inline">
							<input type="radio" name="m_gender" id="m_gender" value="��" checked>��
						</label>
						<label class="radio-inline">
							<input type="radio" name="m_gender" id="m_gender" value="��">��
						</label>
					</div>
			</div>
			<div class="form-group">
				<label for="m_birth" class="col-sm-4 control-label">�������</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_birth" id="m_birth" placeholder="(����) 900101">
				</div>
			</div>
			<div class="form-group">
				<label for="m_phone" class="col-sm-4 control-label">��ȭ��ȣ</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="(����) 01012345678">
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
=======
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
>>>>>>> fa05a0015ba9dacd2747f4b873b040edc3f94515
</body>
</html>