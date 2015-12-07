<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" id="memberinfo" style="margin-bottom: 20px;">
   <div class="well well-lg" align="center" style="margin: auto; width: 40%; background-color: #FFE7EC;">
       <form class="form-horizontal" action="memberupdate.htm" method="get">
	       <div class="form-group">
	          <label for="m_id" class="col-sm-4 control-label">아이디</label>
	          <div class="col-sm-8">
	             <input type="text" class="form-control input-sm" name="id" id="id" value="${memberdto.id}" readonly="readonly">
	          </div>
	       </div>
	       
	       <div class="form-group">
	          <label for="m_nick" class="col-sm-4 control-label">이름</label>
	          <div class="col-sm-8">
	             <input type="text" class="form-control input-sm" name="name" id="name" value="${memberdto.name}" readonly="readonly">
	          </div>
	       </div>
	       
	       <div class="form-group">
	          <label for="phone" class="col-sm-4 control-label">전화번호</label>
	          <div class="col-sm-8">
	             <input type="text" class="form-control input-sm" name="phone" id="phone" value="${memberdto.phone}" readonly="readonly">
	          </div>
	       </div>
	       
	       <div class="form-group">
	          <label for="sex" class="col-sm-4 control-label">성별</label>
	          <div class="col-sm-8">
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
	             <input type="text" class="form-control input-sm" name="email" id="email" value="${memberdto.email}" readonly="readonly">
	          </div>
	       </div>
	       
	       <div class="form-group">
	          <label for="panalty" class="col-sm-4 control-label">벌점</label>
	          <div class="col-sm-8">
	             <input type="text" class="form-control input-sm" name="panalty" id="panalty" value="${memberdto.panalty}" readonly="readonly">
	          </div>
	       </div>
	       
	       <button type="submit" class="btn btn-info">개인정보 수정</button>&nbsp;&nbsp;
	       <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteMember">
	       		회원탈퇴</button>
       </form>
   </div>
</div>

<!-- 회원탈퇴 모달창 -->
<div class="modal fade" id="deleteMember" role="dialog">
	<div class="modal-dialog" style="width: 400px;">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원탈퇴</h4>
			</div>
			<div class="modal-body" style="height: 170px;">
				<form class="form-horizontal" action="${pageContext.request.contextPath}/mypage/memberdelete.htm" method="post">
					<div class="form-group">
						<h4 class="modal-title" style="text-align: left;"></h4>
						<label for="id" class="col-sm-3 control-label">아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="id" name="id" value="${memberdto.id}" readonly>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pwd" class="col-sm-3 control-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="pwd" name="pwd" placeholder="pwd">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-12" align="right">
							<button type="submit" class="btn btn-default" style="background-color: #F27983">회원탈퇴</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>