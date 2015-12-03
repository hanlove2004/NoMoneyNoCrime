<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="memberinfo" align="center" class="collapse">
   <div class="well well-lg" align="center" style="margin: auto; height: 85%; width: 50%;">
      <div style="width: 400px;">

            <div class="form-group">
               <label for="m_id" class="col-sm-4 control-label">아이디</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="id" id="id" value="${memberdto.id}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="m_nick" class="col-sm-4 control-label">이름</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="name" id="name" value="${memberdto.name}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="phone" class="col-sm-4 control-label">전화번호</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="phone" id="phone" value="${memberdto.phone}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="sex" class="col-sm-4 control-label">성별</label>
               <div class="col-sm-5">
                  <input type="text" class="form-control" name="sex" id="sex" value="${memberdto.sex}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="birth" class="col-sm-4 control-label">생년월일</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="birth" id="birth" value="${memberdto.birth}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="email" class="col-sm-4 control-label">이메일</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="email" id="email" value="${memberdto.email}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="panalty" class="col-sm-4 control-label">벌점</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="panalty" id="panalty" value="${memberdto.panalty}" readonly="readonly">
               </div>
            </div>
            
            <hr>
            
            <input type="button" onclick="memberupdate.htm" value="개인정보 수정" class="btn btn-info"> 
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteMember">ID / PWD 찾기</button>

      </div>
   </div>
</div>
<!-- 회원탈퇴 모달창 -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원탈퇴</h4>
			</div>
			<div class="modal-footer">
				<form action="${pageContext.request.contextPath}/mypage/deletemember.htm" method="post">
					<div class="form-group form-inline">
						<h4 class="modal-title" style="text-align: left;"></h4>
						<label for="id" class="col-sm-3 control-label">아이디:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="id" name="id" readonly>${memberdto.id}
						</div>
					</div>
					<div class="form-group form-inline">
						<label for="pwd" class="col-sm-3 control-label">비밀번호:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="pwd" name="pwd" placeholder="pwd">
						</div>
					</div>

					<button type="submit" class="btn btn-default">회원탈퇴</button>
				</form>
			</div>
		</div>
	</div>
</div>