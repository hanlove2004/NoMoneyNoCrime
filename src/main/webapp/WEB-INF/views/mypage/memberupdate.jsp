<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="memberupdate" align="center" class="collapse">
   <div class="well well-lg" align="center" style="margin: auto; height: 85%; width: 50%;">
      <div style="width: 400px;">
         <form class="form-horizontal" name="memberupdate" action="memberupdate.htm" method="post">
            
            <div class="form-group">
               <label for="m_id" class="col-sm-4 control-label">아이디</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="id" id="id" value="${memberdto.id}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="pwd" class="col-sm-4 control-label">비밀번호</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
               </div>
            </div>
            
            <div class="form-group">
               <label for="newpwd" class="col-sm-4 control-label">새비밀번호</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control" name="newpwd" id="newpwd" placeholder="NewPassword">
               </div>
            </div>
            
            <div class="form-group">
               <label for="confirmpwd" class="col-sm-4 control-label">비밀번호확인</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control" name="confirmpwd" id="confirmpwd" placeholder="NewPassword Check">
               </div>
            </div>
            
            <div class="form-group">
               <label for="name" class="col-sm-4 control-label">이름</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="name" id="name" value="${memberdto.name}" readonly="readonly">
               </div>
            </div>
            
            <div class="form-group">
               <label for="phone" class="col-sm-4 control-label">전화번호</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="phone" id="phone" value="${memberdto.phone}">
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
                  <input type="text" class="form-control" name="email" id="email" value="${memberdto.email}">
               </div>
            </div>
            
            <hr>
            
            <input type="submit" value="수정" class="btn btn-success"> 
            <input type="button" onclick="<%=request.getContextPath()%>/mypage/memberinfo.htm" value="취소" class="btn btn-info"> 
         </form>
      </div>
   </div>
</div>